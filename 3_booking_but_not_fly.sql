select count(book_ref) as qty_booking, count(boarding_no) as qty_boardingpass from bookings
join tickets using(book_ref)
join ticket_flights using(ticket_no)
join boarding_passes using(flight_i)
