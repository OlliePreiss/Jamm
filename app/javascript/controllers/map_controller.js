import { Controller } from "stimulus";
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static targets = ['map'];

  connect() {

    console.log("connected");
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [-2.956106, 51.366074],
      zoom: 12
    });

    this.addMarkers();
  }

  addMarkers() {
    const features = JSON.parse(this.data.get('features'));

    features.forEach((feature) => {
      new mapboxgl.Marker()
        .setLngLat(feature.geometry.coordinates)
        .addTo(this.map);
    });
  }
}
