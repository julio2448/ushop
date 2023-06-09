import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static targets = ['imgmap']
  static values = {
    apiKey: String,
    markers: Object
  }

  connect() {

  }

  #addMarkersToMap() {
    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/supermarket.json&groceries.json?proximity=${this.markersValue.lng},${this.markersValue.lat}&access_token=${this.apiKeyValue}&limit=10`)
    .then(response => response.json())
    .then(data => {
      const bounds = new mapboxgl.LngLatBounds();
      data.features.forEach((supermarket) => {
        // add a link to the supermarket place name and do a fetch to the pages_controller#index
        // with the supermarket name as a parameter:
        // add an event listener to the link to hide the map
        const popup = new mapboxgl.Popup().setHTML(`<a data-action="click->map#toggleMap" href="/?supermarket=${supermarket.place_name}">${supermarket.place_name}</a>`)
        new mapboxgl.Marker({color: '#E0115F'})
        .setLngLat(supermarket.geometry.coordinates)
        .setPopup(popup)
        .addTo(this.map);
        bounds.extend(supermarket.geometry.coordinates);
      });
    })
    .catch(error => console.error(error));


    const popup = new mapboxgl.Popup().setHTML(this.markersValue.info_window_html)

    new mapboxgl.Marker()
      .setLngLat([ this.markersValue.lng,  this.markersValue.lat ])
      .setPopup(popup)
      .addTo(this.map);
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markersValue.lng,  this.markersValue.lat])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 13, duration: 0 })

  }

  toggleMap(e){
    if (this.imgmapTarget.classList.contains("d-none")){
      e.target.style.color = "#2ab3c0"
      this.imgmapTarget.classList.remove("d-none")
      mapboxgl.accessToken = this.apiKeyValue
      console.log("hi")
      this.map = new mapboxgl.Map({
        container: this.imgmapTarget,
        style: "mapbox://styles/mapbox/streets-v11"
      })
      this.#addMarkersToMap()
      this.#fitMapToMarkers()
      this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
          mapboxgl: mapboxgl }),"top-left")

    } else {
      e.target.style.color = "#787878"
      this.imgmapTarget.classList.add("d-none")
    }
  }
}
