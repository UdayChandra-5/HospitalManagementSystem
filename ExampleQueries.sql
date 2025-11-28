-- to get the list all appointments with patient & doctor names
SELECT 
    a.appointment_id,
    p.name AS patient,
    d.name AS doctor,
    a.appointment_date,
    a.appointment_time
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

-- to find all available rooms
SELECT room_number, room_type 
FROM Rooms 
WHERE is_occupied = FALSE;

-- to get full patient visit history
SELECT 
    p.name AS patient,
    d.name AS doctor,
    a.appointment_date,
    a.reason
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_date DESC;

-- to list all currently admitted patients with room details
SELECT 
    p.name AS patient,
    r.room_number,
    a.admit_date
FROM Admissions a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Rooms r ON a.room_id = r.room_id;

-- to count number of appointments per doctor
SELECT 
    d.name AS doctor,
    COUNT(*) AS total_appointments
FROM Appointments a
JOIN Doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.name;
