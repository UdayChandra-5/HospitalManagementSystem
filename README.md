🏥 Hospital Management System (SQL Project)
By: G. Uday Chandra

A structured, SQL-based Hospital Management System designed to simulate real-world hospital operations such as managing patients, doctors, appointments, room allocations, and patient admissions.
This project demonstrates practical data modeling, SQL querying, and relational database design skills suitable for Data Analyst, Database Developer, and Data Engineering roles.

🚀 Project Overview

This project focuses on building and analyzing a complete relational database for hospital operations.
It covers:

Patient records

Doctor information

Appointment tracking

Room management

Admission and discharge details

Useful SQL queries for reporting & analysis

The goal is to replicate how healthcare systems store and analyze data in a structured, normalized format.

🎯 Objectives

Design a clean and normalized relational database for hospital operations

Establish meaningful relationships using primary & foreign keys

Insert sample data for realistic analysis

Execute SQL queries to extract insights such as patient visit history, occupancy reports, and doctor workload

Demonstrate backend data handling skills using SQL

🏗️ Database Structure

The system includes the following core tables:

1. Patients

Stores basic patient information.

Column	Description
patient_id	Unique patient ID
name	Patient name
age	Patient age
gender	Male/Female/Other
phone	Contact number
2. Doctors
Column	Description
doctor_id	Unique doctor ID
name	Doctor’s name
specialization	Area of expertise
phone	Contact number
3. Appointments

Tracks patient-doctor appointments.

Column	Description
appointment_id	Unique ID
patient_id	Reference to Patients
doctor_id	Reference to Doctors
appointment_date	Date
appointment_time	Time
reason	Reason for visit
4. Rooms
Column	Description
room_id	Unique room ID
room_number	Room number
room_type	General / Private / ICU
is_occupied	TRUE/FALSE
5. Admissions

Represents a patient’s stay in the hospital.

Column	Description
admission_id	Unique ID
patient_id	Reference to Patients
room_id	Reference to Rooms
admit_date	Date admitted
discharge_date	Date discharged
📂 Project File Structure
📦 hospital-management-system
 ┣ 📄 README.md
 ┣ 📄 schema.sql
 ┣ 📄 insert_data.sql
 ┣ 📄 analysis_queries.sql
 ┗ 📁 assets/
      ┗ 🖼️ ER_Diagram.png

🧱 SQL Schema (Core Definitions)
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    reason VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10),
    room_type VARCHAR(50),
    is_occupied BOOLEAN DEFAULT FALSE
);

CREATE TABLE Admissions (
    admission_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    room_id INT,
    admit_date DATE,
    discharge_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

🧪 Sample Data Inserts
INSERT INTO Patients (name, age, gender, phone) VALUES
('Rahul Kumar', 32, 'Male', '9876543210'),
('Priya Sharma', 27, 'Female', '9988776655');

INSERT INTO Doctors (name, specialization, phone) VALUES
('Dr. Anita Rao', 'Cardiology', '9823456789'),
('Dr. Vikram Das', 'Neurology', '9887766554');

INSERT INTO Rooms (room_number, room_type) VALUES
('101', 'General'),
('202', 'Private');

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, reason) VALUES
(1, 1, '2025-02-15', '10:30:00', 'Chest pain'),
(2, 2, '2025-02-16', '12:00:00', 'Migraine');

INSERT INTO Admissions (patient_id, room_id, admit_date) VALUES
(1, 1, '2025-02-14');

🔍 Analysis Queries (Examples)
✔ List all appointments with patient and doctor names
SELECT a.appointment_id, p.name AS patient, d.name AS doctor,
       a.appointment_date, a.appointment_time
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

✔ Current admitted patients
SELECT p.name, r.room_number, a.admit_date
FROM Admissions a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Rooms r ON a.room_id = r.room_id
WHERE a.discharge_date IS NULL;

✔ Count appointments per doctor
SELECT d.name, COUNT(*) AS appointment_count
FROM Appointments a
JOIN Doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.name;

📘 What I Learned

Designing relational databases

Defining relationships using foreign keys

Writing SQL queries for reports and analytics

Understanding how hospital systems store data

Practicing logical modeling and normalization
