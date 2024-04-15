import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    this.timeout = setTimeout(() => {
      this.remove();
    }, 3000);
  }

  remove() {
    this.element.remove();
  }

  disconnect() {
    clearTimeout(this.timeout);
  }
}
