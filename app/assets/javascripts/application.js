// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  // Declare all the variables we'll need to use.
  var potentialWaypoints = [];
  var infowindow = null;
  var userCoords;
  var tempMarkerHolder = [];

  //Start the GeoLocation
  if (navigator.geolocation) {
    function error(err){
      console.warn('ERROR(' + err.code + '): ' + err.message);
    }
    // on success we assign coordinates to usercords variable
    function success(pos) {
      userCoords = pos.coords;
    }

    // Get the user's current position
    navigator.geolocation.getCurrentPosition(success, error);
    //console.log(pos.latitude + " " + pos.longitude);
    } else { 
      alert('GeoLocation is not supported by your browser');
    }
   // End Geo Location (Note: this last close bracket may not be necessary )


  // Map Options
  var mapOptions = {
    zoom: 14,
    center: userCoords
  }

  // Add info window when user hovers over point on map
  infoWindow = new google.maps.InfoWindow({
    content: "holding..."
  });

  // Fire up google maps and place inside the map-canvas div
  map = new google.maps.Map(document.getElementById('map'), mapOptions);

});

// TUTORIALS:
// https://www.youtube.com/watch?v=Hv76o8PEKwk
// https://www.youtube.com/watch?v=W0juXNFLd6w

// function initMap() {
//   function success(pos) {
//     var crd = pos.coords;
//     var myLatLng = {lat: crd.latitude, lng: crd.longitude};
//     var map = new google.maps.Map(document.getElementById('map'), {
//       zoom: 14,
//       center: myLatLng
//     });
//   var marker = new google.maps.Marker({
//     position: myLatLng,
//     map: map,
//     title: 'Hello World!'

//   });
//   saveLocation(myLatLng);
// };
//   $("#button").on("click", function(){
//     navigator.geolocation.getCurrentPosition(success);
//   })
// }

// function saveLocation(myLatLng) {
//   $.ajax({
//     url: '/waypoints',
//     method: 'post',    
//     data: {location: myLatLng},
//     })
//     .done(function(response) { 
//       console.log("success");
//       console.log(response);
//     })
//     .fail(function() { 
//       console.log("error");
//     })
// }

//Add listener
// google.maps.event.addListener(marker, "click", function (event) {
//     var latitude = event.latLng.lat();
//     var longitude = event.latLng.lng();
//     console.log( latitude + ', ' + longitude );

//     radius = new google.maps.Circle({map: map,
//         radius: 100,
//         center: event.latLng,
//         fillColor: '#777',
//         fillOpacity: 0.1,
//         strokeColor: '#AA0000',
//         strokeOpacity: 0.8,
//         strokeWeight: 2,
//         draggable: true,    // Dragable
//         editable: true      // Resizable
//     });

//     // Center of map
//     map.panTo(new google.maps.LatLng(latitude,longitude));
// }); //end addListener