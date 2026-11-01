import AppKit
import SafariServices
import SwiftUI

/// Instructions for enabling the extension in Safari.
struct SetupView: View {
    /// An error encountered while opening Safari's extension settings.
    @State
    private var settingsError: String?

    /// The extension's setup instructions and settings shortcut.
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 16) {
                Image(nsImage: NSApplication.shared.applicationIconImage).resizable().frame(width: 72, height: 72)
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 4) {
                    Text("FixGHScroll").font(.title.bold())
                    Text("Keeps GitHub scrolling where you expect.").foregroundStyle(.secondary).fixedSize(
                        horizontal: false,
                        vertical: true
                    )
                }
            }

            VStack(alignment: .leading, spacing: 16) {
                SetupStep(
                    number: 1,
                    title: "Enable the extension",
                    message: "In Safari Settings → Extensions, turn on FixGHScroll."
                )
                SetupStep(
                    number: 2,
                    title: "Allow GitHub",
                    message: "Allow access to github.com, then reload your open GitHub tabs."
                )
            }

            HStack(spacing: 16) {
                Button("Open Safari Settings", action: openSafariSettings).buttonStyle(.borderedProminent).controlSize(
                    .large
                )

                Text("You can quit this app after setup.").font(.callout).foregroundStyle(.secondary).fixedSize(
                    horizontal: false,
                    vertical: true
                )
            }

            if let settingsError {
                Text(settingsError).font(.callout).foregroundStyle(.red).textSelection(.enabled).fixedSize(
                    horizontal: false,
                    vertical: true
                )
            }
        }.padding(28).frame(width: 480).fixedSize(horizontal: false, vertical: true)
    }

    /// Opens the extension's settings in Safari, displaying any error in the setup window.
    private func openSafariSettings() {
        Task {
            do {
                try await SFSafariApplication.showPreferencesForExtension(
                    withIdentifier: "com.julianschiavo.FixGHScroll.Extension"
                )
                settingsError = nil
            } catch { settingsError = error.localizedDescription }
        }
    }
}
