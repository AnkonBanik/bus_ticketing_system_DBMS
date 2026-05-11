CREATE VIEW vw_full_ticket_summary AS
    SELECT 
        t.ticket_id,
        t.booking_date,
        t.seat_no,
        t.status AS ticket_status,
        p.passenger_id,
        p.name AS passenger_name,
        p.phone AS passenger_phone,
        p.email AS passenger_email,
        s.schedule_id,
        s.departure_time,
        s.arrival_time,
        s.fare,
        s.available_seats,
        r.route_id,
        r.source,
        r.destination,
        r.distance_km,
        b.bus_id,
        b.bus_no,
        b.type AS bus_type,
        b.total_seats,
        o.operator_id,
        o.name AS operator_name,
        o.contact AS operator_contact,
        pay.payment_id,
        pay.amount AS payment_amount,
        pay.method AS payment_method,
        pay.payment_date
    FROM
        Ticket t
            JOIN
        Passenger p ON t.passenger_id = p.passenger_id
            JOIN
        Schedule s ON t.schedule_id = s.schedule_id
            JOIN
        Route r ON s.route_id = r.route_id
            JOIN
        Bus b ON s.bus_id = b.bus_id
            JOIN
        Operator o ON b.operator_id = o.operator_id
            LEFT JOIN
        Payment pay ON t.ticket_id = pay.ticket_id;

