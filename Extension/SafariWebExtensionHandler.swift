import SafariServices

/// The extension's native entry point, required by Safari's app extension bundle.
///
/// The web extension has no native messaging permission and does all its work in Safari.
final class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {
    /// Completes a native request without reading or returning page data.
    func beginRequest(with context: NSExtensionContext) { context.completeRequest(returningItems: nil) }
}
