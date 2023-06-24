import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  // on start
  connect() {
    console.log("connected");
    const messages = document.getElementById("messages");
    messages.addEventListener("DOMNodeInserted", this.resetScroll);
    this.resetScroll(messages);
  }

  disconnect() {
    console.log("disconnected");

  }

  resetScroll() {
    messages.scrollTop = messages.scrollHeight - messages.clientHeight;

  }
}
