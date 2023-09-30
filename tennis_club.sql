-- Create the database
CREATE DATABASE IF NOT EXISTS tennis_club;
USE tennis_club;

-- Create the coaches table
CREATE TABLE coaches (
    coach_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the schedules table
CREATE TABLE schedules (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    location VARCHAR(100) NOT NULL,
    coach_id INT,
    FOREIGN KEY (coach_id) REFERENCES coaches(coach_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the members table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, -- Use appropriate password hashing
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the enrollments table to track member enrollments in schedules
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    schedule_id INT,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (schedule_id) REFERENCES schedules(schedule_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample data (you can add more as needed)
INSERT INTO coaches (name, bio) VALUES ('Coach 1', 'Bio for Coach 1');
INSERT INTO coaches (name, bio) VALUES ('Coach 2', 'Bio for Coach 2');

INSERT INTO schedules (event_name, date, location, coach_id) VALUES ('Tennis Lesson 1', '2023-10-10', 'Court 1', 1);
INSERT INTO schedules (event_name, date, location, coach_id) VALUES ('Tennis Lesson 2', '2023-10-12', 'Court 2', 2);

INSERT INTO members (username, password, email) VALUES ('member1', 'hashed_password_here', 'member1@example.com');
INSERT INTO members (username, password, email) VALUES ('member2', 'hashed_password_here', 'member2@example.com');

INSERT INTO enrollments (member_id, schedule_id) VALUES (1, 1);
INSERT INTO enrollments (member_id, schedule_id) VALUES (2, 2);
