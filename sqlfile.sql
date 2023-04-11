CREATE TABLE Departments (
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) NOT NULL,
  department_chair VARCHAR(50) NOT NULL
);

CREATE TABLE Courses (
  course_id SERIAL PRIMARY KEY,
  course_name VARCHAR(50) NOT NULL,
  course_description VARCHAR(100) NOT NULL,
  department_id INT NOT NULL,
  instructor_name VARCHAR(50) NOT NULL,
  FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Students (
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email_address VARCHAR(100) NOT NULL
);

CREATE TABLE Enrollments (
  enrollment_id SERIAL PRIMARY KEY,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  grade VARCHAR(2),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


CREATE SEQUENCE departments_seq START 1;
CREATE SEQUENCE courses_seq START 1;
CREATE SEQUENCE students_seq START 1;
CREATE SEQUENCE enrollments_seq START 1;



INSERT INTO Departments (department_id, department_name, department_chair)
VALUES (nextval('departments_seq'), 'Computer Science', 'Dr. Jane Smith');

INSERT INTO Courses (course_id, course_name, course_description, department_id, instructor_name)
VALUES (nextval('courses_seq'), 'Introduction to Programming', 'An introduction to programming concepts', 1, 'Dr. John Doe');

INSERT INTO Students (student_id, first_name, last_name, email_address)
VALUES (nextval('students_seq'), 'Jane', 'Doe', 'jane.doe@example.com');

INSERT INTO Enrollments (enrollment_id, student_id, course_id, grade)
VALUES (nextval('enrollments_seq'), 1, 1, 'A');
