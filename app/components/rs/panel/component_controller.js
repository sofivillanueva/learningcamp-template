
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ["panel"];

  connect() {
    this.element.addEventListener('turbo:before-frame-render', () => this.show());
  }

  show() {
    this.panelTarget.classList.remove("hidden");
  }

  disconnect() {
    this.element.removeEventListener('turbo:before-frame-render', () => this.show());
  }
}
