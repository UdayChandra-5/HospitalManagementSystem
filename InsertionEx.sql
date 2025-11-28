-- to insert sample data into patients table
INSERT INTO Patients (name, age, gender, phone)
VALUES 
('Rahul Sharma', 35, 'Male', '9876543210'),
('Priya Singh', 28, 'Female', '8877665544'),
('Amit Verma', 42, 'Male', '9998887776');

-- to insert sample data into doctors table
INSERT INTO Doctors (name, specialization, phone)
VALUES
('Dr. Priya Mehta', 'Cardiology', '9823456789'),
('Dr. Rohan Das', 'Orthopedics', '9855544332'),
('Dr. Sneha Nair', 'Dermatology', '9944332211');

-- to insert sample data into rooms table
INSERT INTO Rooms (room_number, room_type)
VALUES
('101', 'General'),
('201', 'Private'),
('301', 'ICU');

-- to insert sample data into appointments table
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, reason)
VALUES
(1, 1, '2025-01-10', '10:30:00', 'Heart checkup'),
(2, 2, '2025-01-11', '12:00:00', 'Knee pain'),
(3, 3, '2025-01-12', '15:00:00', 'Skin allergy');

-- to insert sample data into admissions table
INSERT INTO Admissions (patient_id, room_id, admit_date, discharge_date)
VALUES
(1, 1, '2025-01-09', NULL),
(3, 3, '2025-01-11', NULL);
