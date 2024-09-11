
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ["sidebar", "backdrop", "backpage", "hamburger", "cross", "items", "overlay"];

  connect() {
    const storedWidth = localStorage.getItem("sidebarWidth");

    if (storedWidth) {
      this.overlayTarget.classList.add(storedWidth);
    }
    this.overlayTarget.addEventListener("mouseover", this.expandSidebar);
    this.overlayTarget.addEventListener("mouseleave", this.minimizeSidebar);
  }

  expandSidebar() {
    this.classList.remove("lg:w-20");
    this.classList.add("lg:w-72");
    this.querySelectorAll("ul div").forEach((div) => div.classList.remove("lg:hidden"));
    localStorage.setItem("sidebarWidth", 'lg:w-72');
  }

  minimizeSidebar() {
    this.classList.remove("lg:w-72");
    this.classList.add("lg:w-20");
    this.querySelectorAll("ul div").forEach((div) => div.classList.add("lg:hidden"));
    localStorage.setItem("sidebarWidth", 'lg:w-20');
  }

  toggle() {
    this.backdropTarget.classList.toggle("opacity-0");
    this.backdropTarget.classList.toggle("hidden");
    this.backpageTarget.classList.toggle("inset-0");
    this.crossTarget.classList.toggle("opacity-0");
    this.crossTarget.classList.toggle("hidden");
    this.hamburgerTarget.classList.toggle("opacity-0");
    this.hamburgerTarget.classList.toggle("hidden");
    this.itemsTarget.classList.toggle("hidden");
    this.sidebarTarget.classList.toggle("-translate-x-full");
    this.sidebarTarget.classList.toggle("translate-x-0");
  }

  disconnect() {
    this.overlayTarget.removeEventListener("mouseover", this.expandSidebar);
    this.overlayTarget.removeEventListener("mouseleave", this.minimizeSidebar);
  }
}
