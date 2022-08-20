select departure_city, arrival_city, qtynom_flights from (
select ticket_no, flight_no, flight_id, departure_city, arrival_city, max(scheduled_arrival) over(partition by ticket_no) - sum(duration) over(partition by ticket_no) - min(scheduled_departure) over(partition by ticket_no) as stopping, count(flight_id) over(partition by ticket_no order by scheduled_departure asc) as qtynom_flights, scheduled_departure, scheduled_arrival, duration from routes
join flights using (flight_no)
join ticket_flights using (flight_id)
where status = 'Arrived' and ticket_no in (select ticket_no from ticket_flights group by ticket_no having count(*) = 2)
) as f
where stopping < '23:59:59'
