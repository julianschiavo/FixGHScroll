/** A minimal Actions step used to verify cleanup preserves GitHub's callback. */
class CheckStep extends HTMLElement {
    disconnectCount = 0;

    disconnectedCallback() {
        this.disconnectCount++;
    }
}

customElements.define("check-step", CheckStep);
