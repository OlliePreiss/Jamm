import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loader"
export default class extends Controller {
  static targets = ["loaderWrapper"]

  connect() {
    setTimeout(() => {
      this.hideTargets()
    }, 2000)
  }

  hideTargets() {
    this.loaderWrapperTarget.style.display="none"
  }

}
