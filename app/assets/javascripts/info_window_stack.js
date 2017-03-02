

function mapLocation() {
  var directionsDisplay;
  var directionsService = new google.maps.DirectionsService();
  var map;
  var waypointInfoWindow;

  function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer({
      suppressMarkers: true
    });
    var chicago = new google.maps.LatLng(37.334818, -121.884886);
    var mapOptions = {
      zoom: 7,
      center: chicago
    };
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    waypointInfoWindow = new google.maps.InfoWindow();
    directionsDisplay.setMap(map);
    google.maps.event.addDomListener(document.getElementById('routebtn'), 'click', calcRoute);
  }

  function calcRoute() {
    var start = new google.maps.LatLng(37.334818, -121.884886);
    var end = new google.maps.LatLng(37.441883, -122.143019);
    var waypoint = {
      location: new google.maps.LatLng(37.432334, -121.899574)
    };
    var waypoint2 = {
      location: new google.maps.LatLng(37.54827, -121.988572)
    };

    // Retrieve the start and end locations and create a DirectionsRequest using
    // WALKING directions.
    var request = {
      origin: start,
      destination: end,
      waypoints: [waypoint, waypoint2],
      travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
        directionsDisplay.setMap(map);


        var startLocation = new Object();
        var endLocation = new Object();
        var waypointLocations = [];

        // Display start and end markers for the route.

        // function showSteps()
        // builds the waypoints
        var legs = response.routes[0].legs;
        for (i = 0; i < legs.length; i++) {
          if (i == 0) {
            startLocation.latlng = legs[i].start_location;
            // startLocation.address = legs[i].start_address;
            // createMarker(legs[i].start_location, "start", legs[i].start_address, "green");
          }
          if (i != 0) {
            var waypoint = {};
            waypoint.latlng = legs[i].start_location;
            waypoint.address = legs[i].start_address;
            waypointLocations.push(waypoint);
          }
          if (i == legs.length - 1) {
            endLocation.latlng = legs[i].end_location;
            endLocation.address = legs[i].end_address;
          }
          // var steps = legs[i].steps;
        }
        // Builds the markers for each point
        createMarker(endLocation.latlng, "end", "special text for end marker", "http://www.google.com/mapfiles/markerB.png")
        createMarker(startLocation.latlng, "start", "special text for start marker", "http://maps.gstatic.com/mapfiles/markers2/marker_greenA.png");
        for (var i = 0; i < waypointLocations.length; i++) {
          createMarker(waypointLocations[i].latlng, "waypoint " + i, "special text for waypoint marker " + i, "http://labs.google.com/ridefinder/images/mm_20_gray.png");
        }
      } else {
        alert("Directions Request from " + start.toUrlValue(6) + " to " + end.toUrlValue(6) + " failed: " + status);
      }
    });
  }

  function createMarker(latlng, label, html, url) {
    var contentString = '<b>' + label + '</b><br>' + html;
    var marker = new google.maps.Marker({
      position: latlng,
      map: map,
      icon: url,
      title: label,
      zIndex: Math.round(latlng.lat() * -100000) << 5
    });



//     google.maps.event.addListener(marker, 'click', function() {
//       waypointInfoWindow.setContent(contentString);
//       waypointInfoWindow.open(map, marker);
//     });
//   }
//   google.maps.event.addDomListener(window, 'load', initialize);
// }


// http://www.google.com/mapfiles/markerB.png


mapLocation();
