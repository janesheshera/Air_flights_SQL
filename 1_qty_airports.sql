select city, count(airport_code) as qty_airports from airports
group by city having count(airport_code) > 1