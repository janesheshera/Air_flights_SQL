select distinct model, max(actual_departure-scheduled_departure) over() as delay from flights
join aircrafts on aircrafts.aircraft_code=flights.aircraft_code
where actual_departure is not null 
order by delay desc 