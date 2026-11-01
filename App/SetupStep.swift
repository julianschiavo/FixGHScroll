import SwiftUI

/// A numbered instruction in the extension's setup window.
struct SetupStep: View {
    /// The instruction's position in the setup sequence.
    let number: Int

    /// A short description of the action to take.
    let title: String

    /// The details needed to complete the instruction.
    let message: String

    /// The step number and its wrapping instruction text.
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(number.formatted()).font(.callout.weight(.semibold)).frame(width: 24, height: 24).background(
                .quaternary,
                in: Circle()
            )

            VStack(alignment: .leading, spacing: 4) {
                Text(title).font(.headline)
                Text(message).foregroundStyle(.secondary)
            }.fixedSize(horizontal: false, vertical: true)
        }.accessibilityElement(children: .combine)
    }
}
