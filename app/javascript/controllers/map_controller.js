import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static targets = ['imgmap']
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {

  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker({color: "#fa002a"})
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  toggleMap(e){
    if (this.imgmapTarget.classList.contains("d-none")){
      e.target.style.color = "#2ab3c0"
      this.imgmapTarget.classList.remove("d-none")
      mapboxgl.accessToken = this.apiKeyValue

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
