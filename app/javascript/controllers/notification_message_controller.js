import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="NotificationMessage"
export default class extends Controller {
  static targets = ["msgElement"];

  close(event) {
    event.preventDefault();
    this.msgElementTarget.remove();
  }
}
