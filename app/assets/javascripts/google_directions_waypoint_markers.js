// Directions service (complex)

// This example demonstrates the use of the DirectionsService object to fetch directions between landmarks in New York City. Markers are placed at each waypoint along the route. Click on a marker to display the directions associated with that waypoint.

function initMap() {
        var markerArray = [];

        // Instantiate a directions service.
        var directionsService = new google.maps.DirectionsService;

        // Create a map and center it on Manhattan.
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: {lat: 40.771, lng: -73.974}
        });

        // Create a renderer for directions and bind it to the map.
        var directionsDisplay = new google.maps.DirectionsRenderer({map: map});

        // Instantiate an info window to hold step text.
        var waypointInfoWindow = new google.maps.InfoWindow;

        // Display the route between the initial start and end selections.
        calculateAndDisplayRoute(
            directionsDisplay, directionsService, markerArray, waypointInfoWindow, map);
        // Listen to change events from the start and end lists.
        // var onChangeHandler = function() {
        //   calculateAndDisplayRoute(
        //       directionsDisplay, directionsService, markerArray, waypointInfoWindow, map);
        // };
        // document.getElementById('start').addEventListener('change', onChangeHandler);
        // document.getElementById('end').addEventListener('change', onChangeHandler);
      }

      function calculateAndDisplayRoute(directionsDisplay, directionsService,
          markerArray, waypointInfoWindow, map) {
        // First, remove any existing markers from the map.
        for (var i = 0; i < markerArray.length; i++) {
          markerArray[i].setMap(null);
        }

        // Retrieve the start and end locations and create a DirectionsRequest using
        // WALKING directions.
        directionsService.route({
          origin: document.getElementById('start').value,
          destination: document.getElementById('end').value,
          travelMode: 'WALKING'
        }, function(response, status) {
          // Route the directions and pass the response to a function to create
          // markers for each step.
          if (status === 'OK') {
            document.getElementById('warnings-panel').innerHTML =
                '<b>' + response.routes[0].warnings + '</b>';
            directionsDisplay.setDirections(response);
            showSteps(response, markerArray, waypointInfoWindow, map);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }

      function showSteps(directionResult, markerArray, waypointInfoWindow, map) {
        // For each step, place a marker, and add the text to the marker's infowindow.
        // Also attach the marker to an array so we can keep track of it and remove it
        // when calculating new routes.
        var legs = directionResult.routes[0].legs[0];
        for (var i = 0; i < legs.steps.length; i++) {
          var marker = markerArray[i] = markerArray[i] || new google.maps.Marker;
          marker.setMap(map);
          marker.setPosition(legs.steps[i].start_location);
          attachInstructionText(
              waypointInfoWindow, marker, legs.steps[i].instructions, map);
        }
      }

      // function attachInstructionText(waypointInfoWindow, marker, text, map) {
      //   google.maps.event.addListener(marker, 'click', function() {
      //     // Open an info window when the marker is clicked on, containing the text
      //     // of the step.
      //     waypointInfoWindow.setContent(text);
      //     waypointInfoWindow.open(map, marker);
      //   });
      // }

