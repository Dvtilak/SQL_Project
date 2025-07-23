# Student Result Processing System

A robust and structured Student Result Processing System built using **MySQL**. This project efficiently manages academic records for students, calculating GPA, CGPA, rankings, and failure analysis using automated triggers and views.

## Project Overview

This system is designed to handle student academic data across multiple semesters and courses. It helps institutions manage grades, calculate GPA/CGPA, track top performers, and identify failed subjects or students.

## Database Schema

The database includes the following core tables:

- **students** – Student details: ID, name, date of birth, department  
- **semesters** – Academic terms (e.g., Spring 2023)  
- **courses** – Course details: name, credits, and semester association  
- **grades** – Student marks, grade letters, and course linkage  
- **cgpa_summary** – Stores the CGPA summary for each student  

> Additional **views** and **triggers** are implemented for real-time calculations and data analysis.

## Key Features

- **GPA Calculation** – Credit-weighted GPA calculated per semester  
- **CGPA Calculation** – Automatically updates CGPA using triggers on grade insertions  
- **Top Rankers** – Ranks top students per semester using `DENSE_RANK()`  
- **Failure Analysis** – Detects students who failed in one or more subjects  
- **Result Summary View** – Aggregated view of marks, grades, and pass/fail status  

## Triggers and Views

- **Trigger: `trg_calculate_cgpa`** – Calculates CGPA dynamically after each grade insertion  
- **View: `grade_points`** – Computes grade points per course based on marks  
- **View: `semester_result_summary`** – Displays detailed subject-wise result analysis  

## Technologies Used

- **MySQL** – Relational database management system  
- **SQL** – Used for schema design, data operations, and logic via views and triggers

## Author

**Venkata Tilak**  
_B.Tech Student_

Thank you for checking out the Student Result Processing System!
