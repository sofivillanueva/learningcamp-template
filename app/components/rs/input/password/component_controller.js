import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['input', 'icon'];

  passwordVisibility() {
    if (this.inputTarget.type === 'password') {
      this.inputTarget.type = 'text';
    } else {
      this.inputTarget.type = 'password';
    }
    this.iconTargets.forEach(icon => icon.classList.toggle('hidden'));
  }
}
