import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    console.log("test")
    const swiper = new Swiper('.swiper', {
      speed: 400,
      spaceBetween: 100,
      on: {
        slideChange: function () {
          console.log('CHANGED');
        },
      },
    });
  }


}
