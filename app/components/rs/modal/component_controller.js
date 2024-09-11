import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ["modal"];

  connect() {
    this.element.addEventListener('turbo:before-frame-render', () => this.show());
  }

  show() {
    this.modalTarget.classList.remove('hidden');
  }

  close() {
    this.modalTarget.classList.add('hidden');
    const modalFrame = document.getElementById('modal');
    modalFrame.innerHTML = '';
  }

  disconnect() {
    this.element.removeEventListener('turbo:before-frame-render', () => this.show());
  }

}
