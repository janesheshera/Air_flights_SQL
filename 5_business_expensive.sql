select city, departure_airport, arrival_airport, fare_conditions, amount, max_amount 
from (
select distinct city, departure_airport, arrival_airport, fare_conditions, amount, max(amount) over(partition by departure_airport, arrival_airport) as max_amount  from airports
join flights on airports.airport_code=flights.arrival_airport
join ticket_flights using(flight_id)
) as d
where fare_conditions = 'Business' and amount!=max_amount
