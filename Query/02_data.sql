


-- Operator Data


INSERT INTO Operator VALUES
('OP001','Green Line Paribahan','01711-001001','LIC-GL-2001'),
('OP002','Shohagh Paribahan','01811-002002','LIC-SH-2002'),
('OP003','Hanif Enterprise','01911-003003','LIC-HE-2003'),
('OP004','National Travels','01611-004004','LIC-NT-2004');


-- Bus Data


INSERT INTO Bus VALUES
('B001','DHA-CHT-101','AC',40,'OP001'),
('B002','DHA-CHT-102','Non-AC',50,'OP001'),
('B003','DHA-SYL-201','Sleeper',30,'OP002'),
('B004','DHA-RJH-301','AC',40,'OP003'),
('B005','DHA-KHU-401','Double Decker',80,'OP004'),
('B006','DHA-CHT-103','Sleeper',28,'OP002');


-- Route Data


INSERT INTO Route VALUES
('R001','Dhaka','Chittagong',250.00),
('R002','Dhaka','Sylhet',240.00),
('R003','Dhaka','Rajshahi',260.00),
('R004','Dhaka','Khulna',280.00),
('R005','Dhaka','Comilla',90.00),
('R006','Chittagong','Cox''s Bazar',152.00);


-- Passenger Data


INSERT INTO Passenger VALUES
('P001','Rahim Uddin','01711-223344','rahim@gmail.com','NID-1001-2345'),
('P002','Sadia Islam','01833-445566','sadia@gmail.com','NID-1002-3456'),
('P003','Karim Hossain','01955-667788','karim@gmail.com','NID-1003-4567'),
('P004','Nasrin Akter','01622-889900','nasrin@yahoo.com','NID-1004-5678'),
('P005','Farhan Ahmed','01511-112233','farhan@gmail.com','NID-1005-6789'),
('P006','Mitu Begum','01788-334455','mitu@hotmail.com','NID-1006-7890'),
('P007','Rasel Mia','01999-556677','rasel@gmail.com','NID-1007-8901'),
('P008','Taslima Khatun','01644-778899','taslima@gmail.com','NID-1008-9012');


-- Schedule Data


INSERT INTO Schedule VALUES
('S001','B001','R001','2026-05-15 06:00:00','2026-05-15 11:30:00',500.00),
('S002','B002','R001','2026-05-15 08:30:00','2026-05-15 14:30:00',350.00),
('S003','B003','R002','2026-05-15 07:00:00','2026-05-15 13:00:00',600.00),
('S004','B004','R003','2026-05-15 09:00:00','2026-05-15 16:00:00',550.00),
('S005','B005','R004','2026-05-15 10:00:00','2026-05-15 18:00:00',650.00),
('S006','B006','R001','2026-05-15 22:00:00','2026-05-16 04:00:00',700.00),
('S007','B001','R005','2026-05-16 08:00:00','2026-05-16 10:30:00',200.00),
('S008','B002','R006','2026-05-16 06:00:00','2026-05-16 09:00:00',300.00);


-- Ticket Data


INSERT INTO Ticket VALUES
('T001','P001','S001','A1','2026-05-10','Confirmed'),
('T002','P002','S001','A2','2026-05-10','Confirmed'),
('T003','P003','S002','B3','2026-05-10','Confirmed'),
('T004','P004','S003','C1','2026-05-10','Confirmed'),
('T005','P005','S003','C2','2026-05-10','Cancelled'),
('T006','P006','S004','D4','2026-05-10','Confirmed'),
('T007','P007','S005','E2','2026-05-10','Confirmed'),
('T008','P008','S006','F1','2026-05-10','Confirmed'),
('T009','P001','S007','A3','2026-05-10','Confirmed'),
('T010','P003','S008','B5','2026-05-10','Pending');

-- Payment Data

INSERT INTO Payment VALUES
('PAY001','T001',500.00,'bKash','Paid','2026-05-10'),
('PAY002','T002',500.00,'Cash','Paid','2026-05-10'),
('PAY003','T003',350.00,'Nagad','Paid','2026-05-10'),
('PAY004','T004',600.00,'Card','Paid','2026-05-10'),
('PAY005','T005',0.00,'Card','Refunded','2026-05-10'),
('PAY006','T006',550.00,'bKash','Paid','2026-05-10'),
('PAY007','T007',650.00,'Cash','Paid','2026-05-10'),
('PAY008','T008',700.00,'Card','Paid','2026-05-10'),
('PAY009','T009',200.00,'bKash','Paid','2026-05-10'),
('PAY010','T010',300.00,'Cash','Pending','2026-05-10');
