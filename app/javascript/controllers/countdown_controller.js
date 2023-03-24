import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = [ "countdown" ]
  connect() {
    console.log("Hello, Stimulus!");
    this.secondsLeft = this.countdownTarget.dataset.secondsLeftValue;
    const now = new Date().getTime();
    this.endTime = new Date(now + this.secondsLeft * 1000);
    this.countdown = setInterval(this.countdown.bind(this), 1000);
    console.log(this.endTime);
  }

  countdown() {
    const now = new Date();
    const secondsRemaining = (this.endTime -now) / 1000;

    if (secondsRemaining <= 0) {
      clearInterval(this.countdown);
      this.countdownTarget.textContent = "Expired!";
      return;
    }
    const secondsPerDay = 60 * 60 * 24;
    const secondsPerHour = 60 * 60;
    const secondsPerMinute = 60;

    const days = Math.floor(secondsRemaining / secondsPerDay);
    const hours = Math.floor((secondsRemaining % secondsPerDay) / secondsPerHour);
    const minutes = Math.floor((secondsRemaining % secondsPerHour) / secondsPerMinute);
    const seconds = Math.floor(secondsRemaining % secondsPerMinute);

    this.countdownTarget.innerHTML = `${days} days, ${hours} hours, ${minutes} minutes, ${seconds} seconds`;
  }
}
