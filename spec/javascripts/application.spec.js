// describe("Map", function(){
	
// 	beforeEach(fnction(){
// 		x = new X();
// 	})

// 	it("should do the thing", function(){
// 		x.xmethod(variables);
// 		expect(x.responseToMethod).toEqual(something)
// 	});

// })

describe('Map', function(){
	it("should lose markers on call of clearMarkers", function(){
		markersArray = [];
		map = new google.maps.Map();
		markersArray.push(new google.maps.Marker({
			map: map,
			position: (10 10)
		}));
		clearMarkers(markersArray);
		expect(markersArray).toEqual []
	})
})