import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['input'];
  static values = {
    size: Number
  }

  sizeValidation() {
    const input = this.inputTarget;
    const sizeMb = this.sizeValue;

    if (input.files.length > 0) {
      const fileSizeB = Array.from(input.files).reduce((acc, file) => acc + file.size, 0);
      const fileSizeKb = Math.round(fileSizeB / 1024);
      const supportedSizeKb = Math.round(sizeMb * 1024);

      if (fileSizeKb > supportedSizeKb) {
        input.value = null;
        alert("File is too big");
      }
    }
  }
}
