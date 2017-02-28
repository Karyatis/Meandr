
min_radius_donut = 
max_radius_donut = 
current_loc = Waypoint.XXX.location.as_text
sql_query = "ST_Distance_Sphere(location, ST_GeomFromText('#{current_loc}') < #{max_radius_donut} AND ST_Distance_Sphere(location, ST_GeomFromText('#{current_loc}') > #{min_radius_donut}"
Waypoint.where(sql_query)


SELECT ST_GeomFromText('POINT(-71.064544 42.28787)');