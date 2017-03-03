# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Waypoint.create(location: 'POINT(-87.653217 41.876448)', description: 'DevBootcamp, R.I.P Matt Baker', dropped_by: 'Patrick') #0 4dbc

Waypoint.create(location: 'POINT(-87.647490 41.879617)', description: 'Dugans Pub', dropped_by: 'Anna')

Waypoint.create(location: 'POINT(-87.657240 41.876645)', description: 'Wise Owl', dropped_by: 'Joel')

Waypoint.create(location: 'POINT(-87.656140 41.874853)', description: 'UIC Pavillion', dropped_by: 'Hesham')

Waypoint.create(location: 'POINT(-87.647180 41.875540)', description: 'UIC Blue Line East Entrance', dropped_by: 'Patrick')

Waypoint.create(location: 'POINT(-87.648000 41.871955)', description: 'UIC Student Center', dropped_by: 'Hesham')

Waypoint.create(location: 'POINT(-87.647670 41.884654)', description: 'Au Cheval', dropped_by: 'Joel')

Waypoint.create(location: 'POINT(-87.650022, 41.877864)', description: "Sweet squirrel-based street art", dropped_by: 'Joel')
Waypoint.create(location: 'POINT(-87.650612, 41.879310)', description: "Tree shaped like a moose", dropped_by: 'Hesham')
Waypoint.create(location: 'POINT(-87.648367, 41.876514)', description: "Sewer grate that sounds like the ocean", dropped_by: 'Anna')
Waypoint.create(location: 'POINT(-87.647320, 41.879726)', description: "Great late night views", dropped_by: 'Patrick')
Waypoint.create(location: 'POINT(-87.644440, 41.879271)', description: "Best belfrey in town", dropped_by: 'Joel')
Waypoint.create(location: 'POINT(-87.643759, 41.879715)', description: "Great tree for reading under", dropped_by: 'Hesham')
Waypoint.create(location: 'POINT(-87.642585, 41.878922)', description: "Cute coffeeshop", dropped_by: 'Anna')
Waypoint.create(location: 'POINT(-87.641951, 41.881728)', description: "Great lobby coffee", dropped_by: 'Patrick')
Waypoint.create(location: 'POINT(-87.638642, 41.880604)', description: "Family of ducks lives here", dropped_by: 'Joel')
Waypoint.create(location: 'POINT(-87.637204, 41.881964)', description: "Pretty sure that was Carmen Sandiago", dropped_by: 'Hesham')
Waypoint.create(location: 'POINT(-87.636715, 41.880636)', description: "Waldo", dropped_by: 'Anna')
Waypoint.create(location: 'POINT(-87.632326, 41.879382)', description: "Great chess game", dropped_by: 'Patrick')
Waypoint.create(location: 'POINT(-87.632499, 41.882039)', description: "Wall fountain", dropped_by: 'Joel')
Waypoint.create(location: 'POINT(-87.629566, 41.884920)', description: "Local street performances", dropped_by: 'Hesham')
Waypoint.create(location: 'POINT(-87.627720, 41.883278)', description: "Great window shopping", dropped_by: 'Anna')
Waypoint.create(location: 'POINT(-87.623888, 41.883962)', description: "Bean!", dropped_by: 'Patrick')
Waypoint.create(location: 'POINT(-87.623710, 41.881552)', description: "Fountain!", dropped_by: 'Joel')
Waypoint.create(location: 'POINT(-87.621660, 41.886935)', description: "Great side street", dropped_by: 'Hesham')
Waypoint.create(location: 'POINT(-87.618953, 41.886418)', description: "Particularly lush grass", dropped_by: 'Anna')
Waypoint.create(location: 'POINT(-87.618031, 41.886450)', description: "Squirrel haven", dropped_by: 'Patrick')
Waypoint.create(location: 'POINT(-87.617187, 41.885868)', description: "Super slick slide", dropped_by: 'Joel')
Waypoint.create(location: 'POINT(-87.617574, 41.888896)', description: "Floofy trees", dropped_by: 'Hesham')
Waypoint.create(location: 'POINT(-87.610853, 41.891880)', description: "So. Many. Birds.", dropped_by: 'Anna')
Waypoint.create(location: 'POINT(-87.606815, 41.891101)', description: "Boats.  All of the boats.", dropped_by: 'Patrick')
Waypoint.create(location: 'POINT(-87.618532, 41.875404)', description: 'Buckingham Fountain', dropped_by: 'Matt Baker')
Waypoint.create(location: 'POINT(-87.623678, 41.883855)', description: 'The Bean', dropped_by: 'Pete Macaluso')
Waypoint.create(location: 'POINT(-87.628011, 41.877614)', description: 'Chill Park', dropped_by: 'Duke Greene')
Waypoint.create(location: 'POINT(-87.630732, 41.884157)', description: 'Daley Center', dropped_by: 'Kelly Arwine')
Waypoint.create(location: 'POINT(-87.627112, 41.887376)', description: 'Chicago River Walk', dropped_by: 'Ellie Poley')
Waypoint.create(location: 'POINT(-87.608706, 41.891256)', description: 'The Best Restaurant Ever!  Bubba Gumps Shrimp', dropped_by: 'Matt Baker')
Waypoint.create(location: 'POINT(-87.628034, 41.877206)', description: 'Old library with lots of sweet coding books, even Code Complete!', dropped_by: 'Avnair Shanan')
Waypoint.create(location: 'POINT(-87.644100, 41.879443)', description: 'Good ol, St. Patricks church.  Reminds me of our all time favorite student Patrick Hoban', dropped_by: 'Kelly Arwine')
Waypoint.create(location: 'POINT(-87.649862, 41.877882)', description: 'Jaks tap.  And they all think Im in San Francisco.', dropped_by: 'Alyssa Diaz')









# What is this measure?  Distance used?
# This is 1 mile.

#centered on DBC give or take
#41.876452, -87.653214

# 1000.times do
#   x = rand(41.86037366..41.88504033)
#   y = rand(-87.661557333..-87.64489066)
#   Waypoint.create(location: "POINT(#{y} #{x})", dropped_by: "Us", description: "A cool thing")
# end

# # #1 mile north
# #41.890891, -87.653244
# 1000.times do
#   x = rand(41.8825576635..41.899224336500005)
#   y = rand(-87.6615773365..-87.6449106635)
#   Waypoint.create(location: "POINT(#{y} #{x})")
# end

# # #2 miles north -> goose island
# # #41.905397, -87.653659
# 1000.times do
#   x = rand(41.8970636635..41.9137303365)
#   y = rand(-87.6619923365..-87.6453256635)
#   Waypoint.create(location: "POINT(#{y} #{x}")
# end

# # #3 miles north -> lincoln park, near ba-ba-reeba/armitage stop
# #41.919876, -87.654084
# 1000.times do
#   x = rand(41.9115426635..41.928209336500004)
#   y = rand(-87.6624173365..-87.6457506635)
#   Waypoint.create(location: "POINT(#{y} #{x}")
# end

# #second city
# #41.911504, -87.635253
# 1000.times do
#   x = rand(41.9031706635..41.9198373365)
#   y = rand(-87.64358633650001.. -87.6269196635)
#   Waypoint.create(location: "POINT(#{y} #{x}")
# end

# Test Walk from DBC to 648 W Randolph Street.
# 4,215.71 ft


# 10000.times do
#   x = rand(41.86037366..41.88504033)
#   y = rand(-87.661557333..-87.64489066)
#   Waypoint.create(location: "POINT(#{x} #{y})")
# end

# 100000.times do
#   x = rand(41.86037366..41.88504033)
#   y = rand(-87.661557333..-87.64489066)
#   Waypoint.create(location: "POINT(#{x} #{y})")
# end

# Waypoint.create(location: 'POINT(41.876451 -87.653213)')

# Density of points
# 10 pts
# 50 pts
# 100 pts
# 1000 pts
# 10000 pts
# 100000 pts
# 1000000 pts

# Distances
# 1/10th mile
# 1/2 mile
# 1 mile
# 10 miles
# 50 miles
# 100 miles

# When does it break?

# When does it slow down?

# What is the degredation?
# How do we measure the speed?
