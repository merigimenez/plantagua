import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["friendsCard"]

  connect() {
    console.log("Hello Worldddd!");
  }

  displayFriends() {
    this.friendsCardTarget.classList.toggle('d-none');
  }
  closingX () {
    this.friendsCardTarget.classList.toggle('d-none');
  }
}
