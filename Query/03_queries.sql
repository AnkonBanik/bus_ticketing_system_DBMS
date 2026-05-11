-- 1. Search available buses from Dhaka to Chittagong
SELECT s.schedule_id, b.bus_no, b.type, r.source, r.destination,
       s.departure_time, s.arrival_time, s.fare, s.available_seats
FROM Schedule s
  JOIN Bus b   ON s.bus_id   = b.bus_id
  JOIN Route r ON s.route_id = r.route_id
WHERE r.source = 'Dhaka' AND r.destination = 'Chittagong'
  AND s.available_seats > 0;
 
-- 2. Book a new ticket (transaction)
START TRANSACTION;
  UPDATE Schedule SET available_seats = available_seats - 1
  WHERE schedule_id = 'S001' AND available_seats > 0;
 
  INSERT INTO Ticket VALUES
    ('T011', 'P002', 'S001', 'B1', CURDATE(), 'Confirmed');
 
  INSERT INTO Payment VALUES
    ('PAY010', 'T011', 500.00, 'bKash', CURDATE());
COMMIT;
 
-- 3. Cancel a ticket
START TRANSACTION;
  UPDATE Ticket SET status = 'Cancelled'
  WHERE ticket_id = 'T011';
 
  UPDATE Payment SET method = 'Refunded', amount = 0
  WHERE ticket_id = 'T011';
 
  UPDATE Schedule SET available_seats = available_seats + 1
  WHERE schedule_id = 'S001';
COMMIT;
 
-- 4. Passenger booking history
SELECT t.ticket_id, r.source, r.destination,
       s.departure_time, t.seat_no, t.status, p.amount, p.method
FROM Ticket t
  JOIN Schedule s  ON t.schedule_id  = s.schedule_id
  JOIN Route r     ON s.route_id     = r.route_id
  JOIN Payment p   ON t.ticket_id    = p.ticket_id
WHERE t.passenger_id = 'P001';
 
-- 5. Revenue report by route
SELECT r.source, r.destination,
       COUNT(t.ticket_id)    AS total_tickets,
       SUM(p.amount)         AS total_revenue
FROM Payment p
  JOIN Ticket t   ON p.ticket_id   = t.ticket_id
  JOIN Schedule s ON t.schedule_id = s.schedule_id
  JOIN Route r    ON s.route_id    = r.route_id
WHERE t.status = 'Confirmed'
GROUP BY r.route_id, r.source, r.destination
ORDER BY total_revenue DESC;
 
-- 6. Seat occupancy per schedule
SELECT s.schedule_id, b.bus_no, r.source, r.destination,
       s.departure_time,
       b.total_seats,
       s.available_seats,
       (b.total_seats - s.available_seats) AS booked_seats,
       ROUND((b.total_seats - s.available_seats) * 100.0 / b.total_seats, 1) AS occupancy_pct
FROM Schedule s
  JOIN Bus b   ON s.bus_id   = b.bus_id
  JOIN Route r ON s.route_id = r.route_id;
 
-- 7. All confirmed tickets for a specific schedule
SELECT p.name AS passenger, t.seat_no, t.booking_date,
       pay.amount, pay.method
FROM Ticket t
  JOIN Passenger p ON t.passenger_id = p.passenger_id
  JOIN Payment pay  ON t.ticket_id   = pay.ticket_id
WHERE t.schedule_id = 'S001' AND t.status = 'Confirmed';