$(function() {
  function initializeGoogleMaps() {
    console.error('hello christiane');
    var myLatlng = new google.maps.LatLng(<%= @restaurant.latitude %>,<%= @restaurant.longitude %>);
    var mapOptions = {
      center: myLatlng,
      zoom: 16,
      panControl: false,
      zoomControl: false,
      streetViewControl: false,
      mapTypeControl: false
    };
    var map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);
    var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: 'Hello World!'
    });
  }
  google.maps.event.addDomListener(window, 'load', initializeGoogleMaps);
});
