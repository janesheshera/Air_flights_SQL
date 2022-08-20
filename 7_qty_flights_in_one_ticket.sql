CREATE VIEW line_routes as (
select distinct departure_city, arrival_city from routes
)

CREATE VIEW all_routes  as (
select distinct routes.departure_city as city, d.departure_city as mb_arrival_city from routes
cross join (select distinct departure_city from routes) as d 
order by city asc
)

select distinct city, mb_arrival_city from (
select city, mb_arrival_city, arrival_city, qty_lineroute, max(qty_lineroute) over (partition by city) from (
select distinct all_routes.city, mb_arrival_city, arrival_city, count(arrival_city) over (partition by city, mb_arrival_city) as qty_lineroute from all_routes 
join line_routes on all_routes.city=line_routes.departure_city
where city != mb_arrival_city and mb_arrival_city != arrival_city) as f
) as d 
where qty_lineroute=max
