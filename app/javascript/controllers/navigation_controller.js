import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "menuIcon", "menuIconREALLY"]

  connect() {
    console.log("navigation controller connected")
  }

  display(event) {
    event.preventDefault()
    this.menuTarget.classList.toggle("d-none")
    this.menuIconTarget.classList.toggle("visible-icon")
  }
  closeNavigation(event) {
    if (!this.menuTarget.classList.contains("d-none") && event.target != this.menuIconREALLYTarget) {
      this.menuTarget.classList.add("d-none")
      this.menuIconTarget.classList.remove("visible-icon")
    }
  }
}
