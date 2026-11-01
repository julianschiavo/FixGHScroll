// GitHub retains Actions steps after navigation and virtualizes any step that
// still has an open <details>. Closing detached steps stops its stale scroll
// compensation without changing scrolling or observing page mutations.
(() => {
    "use strict";

    const registry = window.customElements;
    const originalDefine = registry.define;
    const ownDefine = Object.getOwnPropertyDescriptor(registry, "define");

    // Custom-element lifecycle callbacks are captured at definition time. Install
    // this one cleanup before GitHub defines check-step, then restore the API.
    registry.define = function define(name, constructor, options) {
        if (name === "check-step") {
            const disconnected = constructor.prototype.disconnectedCallback;
            constructor.prototype.disconnectedCallback = function () {
                const details = this.firstElementChild;
                if (details?.matches("details.js-checks-log-details[open]")) {
                    // A synchronous move also disconnects an element. Let it
                    // reconnect before deciding whether its log is really gone.
                    queueMicrotask(() => {
                        if (!this.isConnected) details.removeAttribute("open");
                    });
                }
                return disconnected?.call(this);
            };

            if (registry.define === define) {
                if (ownDefine) Object.defineProperty(registry, "define", ownDefine);
                else delete registry.define;
            }
        }
        return originalDefine.call(this, name, constructor, options);
    };
})();
