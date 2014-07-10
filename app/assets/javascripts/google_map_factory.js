function GoogleMapFactory(centeringLat, centeringLong) {
  this.lat = centeringLat;
  this.lng = centeringLong;
  this.centeringPoint = new google.maps.LatLng(centeringLat, centeringLong);
  this.MAP_DISPLAY_CONFIG = {
    center: this.centeringPoint,
    zoom: 16,
    panControl: false,
    zoomControl: false,
    streetViewControl: false,
    mapTypeControl: false
  };
}

GoogleMapFactory.prototype = {
  create: function() {
    var map = new google.maps.Map(document.getElementById("map-canvas"), this.MAP_DISPLAY_CONFIG);
    var marker = this.addRestaurantMarker();
    marker.setPosition(this.centeringPoint);
    return map;
  },

  addRestaurantMarker: function(map) {
    return new google.maps.Marker({
      position: this.centeringPoint,
      map: map,
      title: 'Hello World!'
    });
  }
};