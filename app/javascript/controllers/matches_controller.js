import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="matches"
export default class extends Controller {

  static targets = [ "connect" , "next", "profile" ]


  connect() {
    console.log("testing alex");
    // console.log(this.connectTargets)
    // console.log(this.nextTargets)
    // console.log(this.connectTargets)

    this.profileTargets.forEach(el => {
      el.hidden = true
    });
    this.profileTarget.hidden = false
  }

  approve(){
    console.log("Connect Pressed");
  }

  decline(){

    console.log("Decline Pressed");
  }

}
