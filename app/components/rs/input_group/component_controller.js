import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['input'];

  connect() {
    let errorMessage = document.getElementById('error-message')
    if (errorMessage) {
      this.inputTarget.classList.add('ring-error-500');
      this.inputTarget.classList.remove('ring-neutral-300');
    }
  }

  clearErrors() {
    let errorMessage = document.getElementById('error-message')
    if (errorMessage) {
      this.inputTarget.classList.remove('ring-error-500');
      this.inputTarget.classList.add('ring-neutral-300');
      errorMessage.remove()
    }
  }
}
