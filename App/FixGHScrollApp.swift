import SwiftUI

/// The setup app for the FixGHScroll Safari extension.
@main
struct FixGHScrollApp: App {
    /// The app's single setup window.
    var body: some Scene { Window("FixGHScroll", id: "setup") { SetupView() }.windowResizability(.contentSize) }
}
