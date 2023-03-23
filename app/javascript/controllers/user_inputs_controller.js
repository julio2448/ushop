import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-inputs"
export default class extends Controller {
  static targets = ["address"]

  toggleAddress(e){
    if (e.target.value == "customer") {
      this.addressTarget.classList.remove("d-none")
    } else {
      this.addressTarget.classList.add("d-none")
    }
  }
}
