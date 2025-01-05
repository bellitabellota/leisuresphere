import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "elem" ]
  static classes = [ "change" ]
  

  toggle() {
    this.elemTarget.classList.toggle(this.changeClass)
  }
}