# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Waypoint.create(location: 'POINT(41.876451 -87.653213)') #0 4dbc
Waypoint.create(location: 'POINT(41.879618 -87.647487)') #1 5dugans
Waypoint.create(location: 'POINT(41.876647 -87.657238)') #2 6wise owl
Waypoint.create(location: 'POINT(41.874853 -87.656140)') #3 7UIC
Waypoint.create(location: 'POINT(41.875540 -87.647181)') #4 8blue line
Waypoint.create(location: 'POINT(41.871955 -87.647998)') #5 9student center
Waypoint.create(location: 'POINT(41.884659 -87.647666)') #6 10Au Cheval

# What is this measure?  Distance used?
# This is 1 mile.
1000.times do
  x = rand(41.86037366..41.88504033)
  y = rand(-87.661557333..-87.64489066)
  Waypoint.create(location: "POINT(#{x} #{y})")
end
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
