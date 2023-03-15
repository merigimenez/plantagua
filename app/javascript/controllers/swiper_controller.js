import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';

// Connects to data-controller="swiper"
export default class extends Controller {
  static values = {
    gardenPlantId: Number
  }

  connect() {
    console.log(this.gardenPlantIdValue)
    const swiper = new Swiper('.swiper', {
      speed: 400,
      spaceBetween: 100,
      on: {
        slideChange: () => {
          console.log('CHANGED');
          const token = document.head.querySelector("[name='csrf-token']").content
          const url = `garden_plants/${this.gardenPlantIdValue}/water`
          console.log(url)
          fetch(url, {
            method: 'PATCH',
            headers: {
              'X-CSRF-Token': token,
              'Content-type': 'application/json',
            }
          })
            .then((response) => response.json())
            .then((json) => this.element.remove);
        },
      },
    });
  }


}
