select distinct airport_name, city, model, range from aircrafts
join flights using(aircraft_code)
join airports on flights.departure_airport=airports.airport_code
where range = (select max(range) from aircrafts)