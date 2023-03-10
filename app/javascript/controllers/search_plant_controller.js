import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-plant"
export default class extends Controller {
  static targets = ["form", "input", "list"]
  static values = { garden: Number }

  connect() {
  }

  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}&garden_id=${this.gardenValue}`
    fetch(url, {headers: {"accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }
}
