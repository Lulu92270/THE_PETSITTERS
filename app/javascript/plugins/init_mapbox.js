import mapboxgl from 'mapbox-gl';
  const mapElement = document.getElementById('map');

const initMapbox = () => {

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
    });

    const marker = JSON.parse(mapElement.dataset.markers);
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    };
  }



export { initMapbox };
