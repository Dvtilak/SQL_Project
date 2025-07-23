-- create database
create database student_result_db;
use student_result_db;

-- students table
create table students (
    student_id int primary key,
    fullname varchar(100),
    dob date,
    department varchar(50));
    
select * from students;

-- semesters table
create table semesters (
    semester_id int primary key,
    years int,
    term varchar(10));

select * from semesters;

-- courses table
create table courses (
    course_id int primary key,
    course_name varchar(100),
    credits int,
    semester_id int,
    foreign key (semester_id) references semesters(semester_id));
    
select * from courses;

-- grades table
create table grades (
    grade_id int primary key,
    student_id int,
    course_id int,
    semester_id int,
    marks int,
    grade_letter char(2),
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id),
    foreign key (semester_id) references semesters(semester_id));
    
select * from grades;

-- cgpa summary table
create table if not exists cgpa_summary (
    student_id int primary key,
    cgpa decimal(4,2),
    foreign key (student_id) references students(student_id)
);

alter table cgpa_summary add column student_name VARCHAR(100);
update cgpa_summary cs
join students s on cs.student_id = s.student_id
set cs.student_name = s.fullname;


select * from cgpa_summary;



-- insert into semesters
insert into semesters values
(1, 2023, 'spring'),
(2, 2023, 'fall');

-- insert into students
insert into students values
(1, 'tilak', '2003-05-01', 'cse'),
(2, 'gayathri', '2004-03-15', 'ece'),
(3, 'rahul', '2003-12-20', 'mech'),
(4, 'priya', '2004-07-09', 'cse'),
(5, 'ravi', '2003-11-11', 'eee'),
(6, 'usha', '2004-01-10', 'cse'),
(7, 'vikram', '2003-08-05', 'civil'),
(8, 'divya', '2004-02-17', 'cse'),
(9, 'kiran', '2003-06-28', 'ece'),
(10, 'jyothi', '2004-04-04', 'mech'),
(11, 'teja', '2003-01-01', 'eee'),
(12, 'priyanka', '2004-03-11', 'cse'),
(13, 'venkat', '2003-07-15', 'it'),
(14, 'raja', '2004-06-16', 'mech'),
(15, 'manoj', '2003-08-01', 'civil'),
(16, 'mounika', '2004-09-10', 'cse'),
(17, 'naveen', '2003-10-12', 'ece'),
(18, 'deepak', '2004-05-06', 'it'),
(19, 'nagur', '2003-02-28', 'eee'),
(20, 'haji', '2004-11-09', 'cse');

-- insert into courses (3 courses for each semester)
insert into courses values
(1, 'mathematics', 4, 1),
(2, 'physics', 3, 1),
(3, 'programming', 4, 1),
(4, 'data structures', 4, 2),
(5, 'electronics', 3, 2),
(6, 'mechanics', 4, 2);

-- insert grades: 2 courses per student per semester = 4 per student total
insert into grades values
-- spring semester (1)
(1, 1, 1, 1, 85, 'a'), (2, 1, 2, 1, 78, 'b'),
(3, 2, 1, 1, 88, 'a'), (4, 2, 3, 1, 74, 'b'),
(5, 3, 2, 1, 91, 'a'), (6, 3, 3, 1, 69, 'c'),
(7, 4, 1, 1, 82, 'b'), (8, 4, 3, 1, 76, 'b'),
(9, 5, 1, 1, 73, 'b'), (10, 5, 2, 1, 84, 'a'),
(11, 6, 2, 1, 80, 'b'), (12, 6, 3, 1, 88, 'a'),
(13, 7, 1, 1, 67, 'c'), (14, 7, 3, 1, 79, 'b'),
(15, 8, 2, 1, 85, 'a'), (16, 8, 1, 1, 72, 'b'),
(17, 9, 3, 1, 69, 'c'), (18, 9, 2, 1, 81, 'b'),
(19, 10, 1, 1, 75, 'b'), (20, 10, 2, 1, 90, 'a'),
-- fall semester (2)
(21, 1, 4, 2, 88, 'a'), (22, 1, 5, 2, 82, 'b'),
(23, 2, 5, 2, 77, 'b'), (24, 2, 6, 2, 83, 'a'),
(25, 3, 4, 2, 65, 'c'), (26, 3, 5, 2, 78, 'b'),
(27, 4, 5, 2, 74, 'b'), (28, 4, 6, 2, 69, 'c'),
(29, 5, 4, 2, 81, 'b'), (30, 5, 6, 2, 85, 'a'),
(31, 6, 4, 2, 90, 'a'), (32, 6, 5, 2, 84, 'a'),
(33, 7, 5, 2, 71, 'b'), (34, 7, 6, 2, 75, 'b'),
(35, 8, 4, 2, 67, 'c'), (36, 8, 6, 2, 70, 'c'),
(37, 9, 4, 2, 86, 'a'), (38, 9, 6, 2, 73, 'b'),
(39, 10, 4, 2, 79, 'b'), (40, 10, 5, 2, 88, 'a'),
-- students 11 to 20 (spring)
(41, 11, 1, 1, 78, 'b'), (42, 11, 3, 1, 82, 'b'),
(43, 12, 2, 1, 89, 'a'), (44, 12, 1, 1, 76, 'b'),
(45, 13, 3, 1, 72, 'b'), (46, 13, 2, 1, 68, 'c'),
(47, 14, 2, 1, 80, 'b'), (48, 14, 1, 1, 74, 'b'),
(49, 15, 3, 1, 91, 'a'), (50, 15, 1, 1, 87, 'a'),
(51, 16, 1, 1, 64, 'c'), (52, 16, 2, 1, 70, 'c'),
(53, 17, 3, 1, 85, 'a'), (54, 17, 1, 1, 73, 'b'),
(55, 18, 2, 1, 79, 'b'), (56, 18, 3, 1, 66, 'c'),
(57, 19, 1, 1, 88, 'a'), (58, 19, 2, 1, 90, 'a'),
(59, 20, 3, 1, 69, 'c'), (60, 20, 1, 1, 77, 'b'),
-- students 11 to 20 (fall)
(61, 11, 4, 2, 84, 'a'), (62, 11, 6, 2, 79, 'b'),
(63, 12, 5, 2, 75, 'b'), (64, 12, 6, 2, 83, 'a'),
(65, 13, 5, 2, 78, 'b'), (66, 13, 4, 2, 82, 'b'),
(67, 14, 5, 2, 80, 'b'), (68, 14, 6, 2, 77, 'b'),
(69, 15, 4, 2, 89, 'a'), (70, 15, 5, 2, 70, 'c'),
(71, 16, 4, 2, 65, 'c'), (72, 16, 6, 2, 72, 'b'),
(73, 17, 4, 2, 76, 'b'), (74, 17, 5, 2, 68, 'c'),
(75, 18, 4, 2, 87, 'a'), (76, 18, 6, 2, 84, 'a'),
(77, 19, 5, 2, 73, 'b'), (78, 19, 6, 2, 79, 'b'),
(79, 20, 5, 2, 80, 'b'), (80, 20, 4, 2, 90, 'a');

-- grade for each course 
create view grade_points as
select 
    g.student_id,
    g.semester_id,
    g.course_id,
    c.credits,
    g.marks,
    g.grade_letter,
    case 
        when g.marks >= 90 then 10
        when g.marks >= 80 then 9
        when g.marks >= 70 then 8
        when g.marks >= 60 then 7
        when g.marks >= 50 then 6
        else 0
    end as grade_point
from grades g
join courses c on g.course_id = c.course_id;

select * from grade_points;

-- cgpa 
insert into cgpa_summary (student_id, cgpa, student_name)
select 
    s.student_id,
    round(avg(g.marks)/10, 2) as cgpa,
    s.fullname
from 
    students s
join 
    grades g on s.student_id = g.student_id
group by 
    s.student_id, s.fullname;


-- trigers 

delimiter //

create trigger trg_calculate_cgpa
after insert on grades
for each row
begin
    declare total_marks int default 0;
    declare total_subjects int default 0;
    declare avg_marks decimal(5,2);
    declare cgpa_value decimal(4,2);
    declare student_name varchar(100);

    -- Get total marks and subject count
    select sum(marks), count(*) 
    into total_marks, total_subjects
    from grades
    where student_id = new.student_id;

    -- Calculate average marks
    set avg_marks = total_marks / total_subjects;

    -- Convert average marks to CGPA out of 10
    set cgpa_value = round(avg_marks / 10, 2);  -- scaling

    -- Get student name
    select fullname into student_name
    from students
    where student_id = new.student_id;

    -- Insert or update CGPA summary table
    if exists (select 1 from cgpa_summary where student_id = new.student_id) then
        update cgpa_summary
        set cgpa = cgpa_value, student_name = student_name
        where student_id = new.student_id;
    else
        insert into cgpa_summary (student_id, cgpa, student_name)
        values (new.student_id, cgpa_value, student_name);
    end if;
end //

delimiter ;

show triggers;

drop trigger if exists trg_calculate_cgpa;

-- gpa for each semester 
select 
    student_id,
    semester_id,
    round(sum(grade_point * credits) / sum(credits), 2) as gpa
from grade_points
group by student_id, semester_id;



insert into students values (21,'rakesh','2001-03-21','cse');

insert into grades values (81,21,1,1,81,'a'),(82,21,2,1,86,'a'),(83,21,3,2,74,'b'),(84,21,4,2,77,'b');
select * from cgpa_summary where student_id = 23;
insert into students values (22, 'rajesh', '2004-12-01', 'ece');
insert into students values (23, 'naveen', '2002-07-01', 'ece');
insert into grades values(85,22,1,1,80,'a'),(86,22,3,1,70,'b'),(87,22,5,2,90,'a'),(88,22,6,2,75,'b');
insert into grades values(89,22,1,1,80,'a'),(90,23,3,1,70,'b'),(91,23,5,2,90,'a'),(92,23,6,2,75,'b');
select * from cgpa_summary;

select 
    c.course_name,
    count(*) as failed_students
from 
    grades g
join 
    courses c on g.course_id = c.course_id
where 
    g.marks < 40
group by 
    g.course_id
order by 
    failed_students desc;
    
insert into students values
(24, 'suresh', '2004-06-10', 'cse'),
(25, 'anitha', '2003-09-23', 'ece'),
(26, 'lokesh', '2004-02-14', 'mech'),
(27, 'meghana', '2003-12-19', 'civil'),
(28, 'tarun', '2004-04-01', 'eee');


-- 📘 Spring Semester (semester_id = 1)
insert into grades values
(109,24,1,1,35,'F'),(110,24,3,1,72,'B'),(111,24,4,2,31,'F'),(112,24,5,2,67,'C'),
(113,25,2,1,33,'F'),(114,25,1,1,68,'C'),(115,25,5,2,38,'F'),(116,25,6,2,72,'B'),
(117,26,3,1,38,'F'),(118,26,2,1,59,'C'),(119,26,6,2,35,'F'),(120,26,4,2,64,'C'),
(121,27,1,1,36,'F'),(122,27,3,1,77,'B'),(123,27,4,2,37,'F'),(124,27,6,2,71,'B'),
(125,28,2,1,37,'F'),(126,28,1,1,70,'B'),(127,28,5,2,30,'F'),(128,28,4,2,66,'C');

-- failed students 
select distinct 
    g.student_id,
    s.fullname
from 
    grades g
join 
    students s on s.student_id = g.student_id
where 
    g.marks < 40;


-- semester top rank 
select 
    g.student_id,
    s.fullname,
    g.semester_id,
    round(avg(g.marks), 2) as avg_marks,
    dense_rank() over (partition by g.semester_id order by avg(g.marks) desc) as `rank`
from 
    grades g
join 
    students s on s.student_id = g.student_id
group by 
    g.student_id, g.semester_id;


-- gpa per student 
select 
    g.student_id,
    s.fullname,
    g.semester_id,
    round(avg(g.marks)/10, 2) as gpa
from 
    grades g
join 
    students s on s.student_id = g.student_id
group by 
    g.student_id, g.semester_id;


-- result summary 
create view semester_result_summary as
select 
    s.student_id,
    s.fullname,
    sem.semester_id,
    sem.term,
    c.course_name,
    g.marks,
    g.grade_letter,
    case 
        when g.marks >= 40 then 'Pass'
        else 'Fail'
    end as result_status
from grades g
join students s on s.student_id = g.student_id
join courses c on c.course_id = g.course_id
join semesters sem on sem.semester_id = g.semester_id;

select * from semester_result_summary order by student_id, semester_id;






