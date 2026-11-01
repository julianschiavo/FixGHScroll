import SafariServices
import SwiftUI

/// Instructions for enabling the extension in Safari.
struct SetupView: View {
    /// An error encountered while opening Safari's extension settings.
    @State
    private var settingsError: String?

    /// The extension's setup instructions and settings shortcut.
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("FixGHScroll", systemImage: "arrow.up.and.down").font(.title.bold())

            Text("Keeps GitHub scrolling where you expect.")

            Text("Turn on FixGHScroll in Safari and allow it on github.com. Then reload your open GitHub tabs once.")
                .foregroundStyle(.secondary)

            Button("Open Safari Settings", action: openSafariSettings).buttonStyle(.borderedProminent)

            if let settingsError { Text(settingsError).font(.callout).foregroundStyle(.red).textSelection(.enabled) }
        }.padding(24).frame(width: 360)
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
