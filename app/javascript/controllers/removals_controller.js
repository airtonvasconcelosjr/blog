import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["flash"];

  connect() {
    setTimeout(() => {
      this.remove();
    }, 5000);
  }

  remove(event) {
    const target = event ? event.currentTarget.closest('.flash__message') : this.element;
    target.classList.add('fade-out');
    setTimeout(() => {
      target.remove();
    }, 300);
  }
}
