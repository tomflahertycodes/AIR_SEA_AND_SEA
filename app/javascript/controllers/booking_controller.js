import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["source"]
  alert() {
    console.log("there is a booking")
  }
}
