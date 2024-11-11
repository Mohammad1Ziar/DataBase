--student table  --its ok
CREATE TABLE student (
    ID VARCHAR(7) PRIMARY KEY,
    name VARCHAR(100),
    dept_name VARCHAR(50),
    tot_cred INT
);

--department table  --its ok
CREATE TABLE department (
    dept_name VARCHAR(50) PRIMARY KEY,
    building VARCHAR(50),
    budget FLOAT
);

--course table  --its ok
CREATE TABLE course (
    course_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(100),
    dept_name VARCHAR(50),
    credits INT,
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

-- instructor table  --its ok
CREATE TABLE instructor (
    ID VARCHAR(7) PRIMARY KEY,
    name VARCHAR(100),
    dept_name VARCHAR(50),
    salary FLOAT,
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

--advisor table  -- its ok
CREATE TABLE advisor (
    s_id VARCHAR(7),
    i_id VARCHAR(7),
    PRIMARY KEY (s_id, i_id),
    FOREIGN KEY (s_id) REFERENCES student(ID),
    FOREIGN KEY (i_id) REFERENCES instructor(ID)
);

-- time_slot table --its ok
CREATE TABLE time_slot (
    time_slot_id VARCHAR(5) PRIMARY KEY, 
    day VARCHAR(10), -- M as Monday, T as Tuesday, W as Wednesday, R as Thursday, F as Friday, Saturday and Sunday are close
	start_time_hour INT,
    start_time_minute INT,
	end_time_hour INT,
    end_time_minute INT
);

--classroom table --its ok
CREATE TABLE classroom (
    building VARCHAR(50),
    room_number VARCHAR(5),
    capacity INT,
    PRIMARY KEY (building, room_number)
);

-- section table  --its ok
CREATE TABLE section (
    course_id VARCHAR(5),
    sec_id VARCHAR(3),
    semester VARCHAR(6),
    year INT,
    building VARCHAR(50),
    room_number VARCHAR(5),
    time_slot_id VARCHAR(5),
    PRIMARY KEY (course_id, sec_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (building, room_number) REFERENCES classroom(building, room_number),
    FOREIGN KEY (time_slot_id) REFERENCES time_slot(time_slot_id)
);

-- teaches table  --its ok
CREATE TABLE teaches (
    ID VARCHAR(7),
    course_id VARCHAR(5),
    sec_id VARCHAR(3),
    semester VARCHAR(6),
    year INT,
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID) REFERENCES instructor(ID),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year)
);

-- takes table  --its ok
CREATE TABLE takes (
    ID VARCHAR(7),
    course_id VARCHAR(5),
    sec_id VARCHAR(3),
    semester VARCHAR(6),
    year INT,
    grade CHAR(1),
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID) REFERENCES student(ID),
    FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year)
);

-- prereq table -- its ok so all ok
CREATE TABLE prereq (
    course_id VARCHAR(5),
    prereq_id VARCHAR(5),
    PRIMARY KEY (course_id, prereq_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (prereq_id) REFERENCES course(course_id)
);