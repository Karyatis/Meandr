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
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  initMap();
  clickAddWaypointButton();
});

function initMap(){
  var defaultPosition = {lat: 11.8251, lng: 42.5903};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: defaultPosition
  });
  // Create the search box and link it to the UI element.
  var input = document.getElementById('search-input');
  var searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  // Bias the SearchBox results towards current map's viewport.
  map.addListener('bounds_changed', function(){
    searchBox.setBounds(map.getBounds());
  });
  var markers = [];
  var directionsDisplay = new google.maps.DirectionsRenderer;
  directionsDisplay.setMap(map);
  // Listen for click of Meandr button
  clickMeanderButton(markers, directionsDisplay);
  // Listen for the event fired when the user selects a prediction and retrieve more details for that place.
  setEndPoint(markers, searchBox, map);
  // set variable for user start location before get current loc call
  var startPosition = document.getElementById('current-user-lat').innerHTML;
  console.log(startPosition);
  // Setting current location on map to user location
  setStartLocation(startPosition, map);

};

// Sets an endpoint based on what a user enters in the search box on the map.
function setEndPoint(markers, searchBox, map){
  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();
    if (places.length == 0) {
      return;
    }
    // Clear out the old markers.
    clearMarkers(markers);

    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      if (!place.geometry) {
        // console.log("Returned place contains no geometry");
        return;
      }
      document.getElementById('end-location').innerHTML = place.geometry.location;
      document.getElementById('desired-end-lat').innerHTML = place.geometry.location.lat();
      document.getElementById('desired-end-long').innerHTML = place.geometry.location.lng();
      // Customized icons
      var icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };
      // Create a marker for each place.
      markers.push(new google.maps.Marker({
        map: map,
        // icon: icon,
        title: place.name,
        position: place.geometry.location
      }));

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
  });
}

function clickMeanderButton(markers, directionsDisplay){
  $("#find-route-button").on("click", function(){
  // get rid of original markers
  clearMarkers(markers);
  var startPointLat = $('#current-user-lat').html()
  var startPointLng = $('#current-user-long').html()
  var endPointLat = $('#desired-end-lat').html()
  var endPointLng = $('#desired-end-long').html()
  if (endPointLat == "end latitude" || endPointLng == "end longitude") {
    $('#error').show();
    $('#error').html('<b>We all love to wander aimlessly...</b><br><b>... but sadly in this instance we could really use a destination.');
      setTimeout(function() {
          $('#error').fadeOut('slow');
          }, 5000);
    }
    else {
      getWalkingRoute(startPointLat, startPointLng, endPointLat, endPointLng, map, directionsDisplay);
    }
  });
}

function setStartLocation(startPosition, map){
  // Still reach this point even if location has been blocked.
  // console.log('HERE IN SET START');
  var startPosition = startPosition
  if (navigator.geolocation) {
    // Still reach this point even if location has been blocked.
    // console.log('INSIDE GEOLOCATION');
    navigator.geolocation.getCurrentPosition(function(position){
      // We DO NOT reach this point if location was blocked
      // console.log('INSIDE CURRENT POSITION')
      var crd = position.coords;
      var myLatLng = {lat: crd.latitude, lng: crd.longitude};
      // console.log('NEW POSITION')
      // console.log(myLatLng)

      // Log starting user location on page in hidden div for use later
      document.getElementById('current-user-lat').innerHTML = crd.latitude;
      // $('#current-user-lat').html(crd.latitude);
      document.getElementById('current-user-long').innerHTML = crd.longitude;
      var startPosition = $('#current-user-lat').html();
      console.log(startPosition);
      var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        title: 'Meanderer'
      });
      // console.log(map);
      map.setCenter(myLatLng);
    });
  } else {
    $('#error').show()
    $('#error').html("<b>GeoLocation is not supported by your browser<b>");
    // alert('GeoLocation is not supported by your browser');
  }
  // Still need to figure out how to call variable for page load.
  // console.log(startPosition)
  // checkUserLocationProvided(startPosition);
}

// Goal is to provide error message to user if location services not enabled.
// function checkUserLocationProvided(startPosition){
//   // Added error message handling to check if user location services are enabled.
//   // var startPointLat = $('#current-user-lat').html();
//   // var startPointLng = $('#current-user-long').html();
//   console.log(startPosition);
//   // console.log(startPointLng);

//   if (startPosition == 'start latitude'){
//     $('#error').show();
//     $('#error').html("<b>Please turn on your location services and let us know where you're at so we can help get you on your way!</b><br>");
//   } else {
//     console.log('hello');
//   }
// }

// Sets up listener out of the document ready call
function clickAddWaypointButton(map){
  $("#add-waypoint-button").on("click", function(){
    console.log('click')
    // Never get inside the findLocation call if location services not enabled.
    navigator.geolocation.getCurrentPosition(findLocation);
  });
}

// Find location is called when user clicks the add waypoint button.
function findLocation(pos) {
  var crd = pos.coords;
  var myLatLng = {lat: crd.latitude, lng: crd.longitude};
  console.log('findlocation');
  console.log(myLatLng);
  saveLocation(myLatLng);
};

// Save location is called by findLocation following user clicking add waypoint.
function saveLocation(myLatLng) {
  $.ajax({
    url: '/waypoints',
    method: 'post',
    data: {location: myLatLng},
  })
  .done(function(response) {
    console.log("success");
    console.log(response);
    if (response.status == 200) {
      $("#thanks").show();
      $("#thanks").html("<b>Thank you for sharing this location with us!</b>")
      setTimeout(function() {
          $('#thanks').fadeOut('slow');
          }, 5000);
    } else {
      $("#error").show();
      $("#error").html("<b>We were unable to save your location, please ensure GeoLocation is supported and location access is allowed.</b>");
      setTimeout(function() {
          $('#error').fadeOut('slow');
          }, 5000);
    }
  })
  .fail(function(response) {
    console.log("error");
    console.log(response.alert);
    $("#error").show();
    $("#error").html("<b>We were unable to save your location, please ensure GeoLocation is supported.</b>");
      setTimeout(function() {
          $('#error').fadeOut('slow');
          }, 5000);
  })
};

function getWalkingRoute(startLat, startLng, endLat, endLng, map, directionsDisplay){
  var meandr_info = {
      startLatitude: startLat,
      startLongitude: startLng,
      endLatitude: endLat,
      endLongitude: endLng
    }
  $.ajax({
    url: '/meandrs',
    type: 'post',
    // dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
    data: { meandr: meandr_info },
  })
  .done(function(response) {
    // console.log(response)
    // console.log(response.alert)
    if (response.status == 200) {
      var startPoint = convertWaypoint(response.start);
      var endPoint = convertWaypoint(response.end);
      var convertedWaypoints = convertWaypoints(response.waypoints);
      getDirectionsMap(startPoint, endPoint, convertedWaypoints, map, directionsDisplay);
    }
    else {
      // console.log(response.alert);
      $('#error').show();
      $('#error').html('<b>' + response.alert + '</b>');
      setTimeout(function() {
          $('#error').fadeOut('fast');
          }, 5000);
    }
  })
  .fail(function(response) {
    $('#error').show();
    $('#error').html("<b>Sorry, something went awry there.<b><br><b>Give it another try?<b>");
      setTimeout(function() {
          $('#error').fadeOut('fast');
          }, 5000);
  })
}

function convertWaypoints(waypointArray){
  var googleWaypoints = [];
  for (var i=0; i<waypointArray.length; i++){
    googleWaypoints.push({location: convertWaypoint(waypointArray[i]), stopover: false})
  }
  return googleWaypoints;
}

function convertWaypoint(waypoint){
  return new google.maps.LatLng(waypoint[0], waypoint[1]);
}

function getDirectionsMap(startPoint, endPoint, convertedWaypoints, map, directionsDisplay){
  var directionsService = new google.maps.DirectionsService;
  directionsService.route({
    origin: startPoint,
    destination: endPoint,
    waypoints: convertedWaypoints,
    travelMode: 'WALKING'
  }, function(response, status){
    if (status === 'OK') {
      directionsDisplay.setDirections(response);
      // var routes = response.routes[0];
    } else {
      $('#error').show();
      $('#error').html('<b>Directions request failed due to ' + status + '</b>');
      setTimeout(function() {
        $('#error').fadeOut('fast');
        }, 5000);
    }
  })
}

function clearMarkers(markers){
 markers.forEach(function(marker) {
    marker.setMap(null);
  });
  markers = [];
}

  // // Map Options
  // var mapOptions = {
  //   zoom: 14,
  //   center: userCoords
  // }

  // // Add info window when user hovers over point on map
  // infoWindow = new google.maps.InfoWindow({
  //   content: "holding..."
  // });

  // // Fire up google maps and place inside the map-canvas div
  // map = new google.maps.Map(document.getElementById('map'), mapOptions);


// TUTORIALS:
// https://www.youtube.com/watch?v=Hv76o8PEKwk
// https://www.youtube.com/watch?v=W0juXNFLd6w

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
