select model, round(qty_flights/sum(qty_flights) over(), 2)*100 as fly_procent, qty_flights
from (
	select model, count(flight_id) as qty_flights from aircrafts
	join flights using(aircraft_code)
	group by model
) as model_qty_flights
order by fly_procent desc
