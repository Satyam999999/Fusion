--
-- PostgreSQL database dump
--

\restrict 9SA0G44HzMPTGercA4tMAmdfsYvOVxgIYk4dONEPZ0FGOB0HqBgrbsW5IbUTgek

-- Dumped from database version 15.17 (Homebrew)
-- Dumped by pg_dump version 15.17 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Bonafide; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Bonafide" (
    id integer NOT NULL,
    student_name character varying(50) NOT NULL,
    purpose character varying(100) NOT NULL,
    academic_year character varying(15) NOT NULL,
    enrolled_course character varying(10) NOT NULL,
    complaint_date timestamp with time zone NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public."Bonafide" OWNER TO fusion_admin;

--
-- Name: Bonafide_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Bonafide_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Bonafide_id_seq" OWNER TO fusion_admin;

--
-- Name: Bonafide_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Bonafide_id_seq" OWNED BY public."Bonafide".id;


--
-- Name: Calendar; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Calendar" (
    id integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    description character varying(40) NOT NULL
);


ALTER TABLE public."Calendar" OWNER TO fusion_admin;

--
-- Name: Calendar_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Calendar_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Calendar_id_seq" OWNER TO fusion_admin;

--
-- Name: Calendar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Calendar_id_seq" OWNED BY public."Calendar".id;


--
-- Name: Course; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Course" (
    id integer NOT NULL,
    course_name character varying(600) NOT NULL,
    course_details text NOT NULL
);


ALTER TABLE public."Course" OWNER TO fusion_admin;

--
-- Name: CourseRequested; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."CourseRequested" (
    id integer NOT NULL,
    course_id_id integer NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public."CourseRequested" OWNER TO fusion_admin;

--
-- Name: CourseRequested_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."CourseRequested_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CourseRequested_id_seq" OWNER TO fusion_admin;

--
-- Name: CourseRequested_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."CourseRequested_id_seq" OWNED BY public."CourseRequested".id;


--
-- Name: Course_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Course_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Course_id_seq" OWNER TO fusion_admin;

--
-- Name: Course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Course_id_seq" OWNED BY public."Course".id;


--
-- Name: Curriculum; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Curriculum" (
    curriculum_id integer NOT NULL,
    course_code character varying(20) NOT NULL,
    credits integer NOT NULL,
    course_type character varying(25) NOT NULL,
    programme character varying(10) NOT NULL,
    branch character varying(10) NOT NULL,
    batch integer NOT NULL,
    sem integer NOT NULL,
    optional boolean NOT NULL,
    floated boolean NOT NULL,
    course_id_id integer NOT NULL
);


ALTER TABLE public."Curriculum" OWNER TO fusion_admin;

--
-- Name: Curriculum_Instructor; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Curriculum_Instructor" (
    id integer NOT NULL,
    chief_inst boolean NOT NULL,
    curriculum_id_id integer NOT NULL,
    instructor_id_id character varying(20) NOT NULL
);


ALTER TABLE public."Curriculum_Instructor" OWNER TO fusion_admin;

--
-- Name: Curriculum_Instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Curriculum_Instructor_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Curriculum_Instructor_id_seq" OWNER TO fusion_admin;

--
-- Name: Curriculum_Instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Curriculum_Instructor_id_seq" OWNED BY public."Curriculum_Instructor".id;


--
-- Name: Curriculum_curriculum_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Curriculum_curriculum_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Curriculum_curriculum_id_seq" OWNER TO fusion_admin;

--
-- Name: Curriculum_curriculum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Curriculum_curriculum_id_seq" OWNED BY public."Curriculum".curriculum_id;


--
-- Name: Dues; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Dues" (
    id integer NOT NULL,
    mess_due integer NOT NULL,
    hostel_due integer NOT NULL,
    library_due integer NOT NULL,
    placement_cell_due integer NOT NULL,
    academic_due integer NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public."Dues" OWNER TO fusion_admin;

--
-- Name: Dues_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Dues_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Dues_id_seq" OWNER TO fusion_admin;

--
-- Name: Dues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Dues_id_seq" OWNED BY public."Dues".id;


--
-- Name: Exam_Timetable; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Exam_Timetable" (
    id integer NOT NULL,
    upload_date date NOT NULL,
    exam_time_table character varying(100) NOT NULL,
    batch integer NOT NULL,
    programme character varying(10) NOT NULL
);


ALTER TABLE public."Exam_Timetable" OWNER TO fusion_admin;

--
-- Name: Exam_Timetable_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Exam_Timetable_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Exam_Timetable_id_seq" OWNER TO fusion_admin;

--
-- Name: Exam_Timetable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Exam_Timetable_id_seq" OWNED BY public."Exam_Timetable".id;


--
-- Name: FeePayments; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."FeePayments" (
    id integer NOT NULL,
    mode character varying(20) NOT NULL,
    transaction_id character varying(40) NOT NULL,
    fee_receipt character varying(100),
    deposit_date date NOT NULL,
    utr_number character varying(40),
    fee_paid integer NOT NULL,
    reason character varying(20),
    actual_fee integer NOT NULL,
    semester_id_id integer NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public."FeePayments" OWNER TO fusion_admin;

--
-- Name: FeePayments_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."FeePayments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FeePayments_id_seq" OWNER TO fusion_admin;

--
-- Name: FeePayments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."FeePayments_id_seq" OWNED BY public."FeePayments".id;


--
-- Name: FinalRegistration; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."FinalRegistration" (
    id integer NOT NULL,
    verified boolean NOT NULL,
    course_id_id integer NOT NULL,
    course_slot_id_id integer,
    semester_id_id integer NOT NULL,
    student_id_id character varying(20) NOT NULL,
    registration_type character varying(20) NOT NULL,
    old_course_registration_id integer
);


ALTER TABLE public."FinalRegistration" OWNER TO fusion_admin;

--
-- Name: FinalRegistration_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."FinalRegistration_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FinalRegistration_id_seq" OWNER TO fusion_admin;

--
-- Name: FinalRegistration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."FinalRegistration_id_seq" OWNED BY public."FinalRegistration".id;


--
-- Name: FinalRegistrations; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."FinalRegistrations" (
    id integer NOT NULL,
    semester integer NOT NULL,
    batch integer NOT NULL,
    verified boolean NOT NULL,
    curr_id_id integer NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public."FinalRegistrations" OWNER TO fusion_admin;

--
-- Name: FinalRegistrations_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."FinalRegistrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FinalRegistrations_id_seq" OWNER TO fusion_admin;

--
-- Name: FinalRegistrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."FinalRegistrations_id_seq" OWNED BY public."FinalRegistrations".id;


--
-- Name: Grades; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Grades" (
    id integer NOT NULL,
    grade character varying(4) NOT NULL,
    verify boolean NOT NULL,
    curriculum_id_id integer NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public."Grades" OWNER TO fusion_admin;

--
-- Name: Grades_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Grades_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Grades_id_seq" OWNER TO fusion_admin;

--
-- Name: Grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Grades_id_seq" OWNED BY public."Grades".id;


--
-- Name: Holiday; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Holiday" (
    id integer NOT NULL,
    holiday_date date NOT NULL,
    holiday_name character varying(40) NOT NULL,
    holiday_type character varying(30) NOT NULL
);


ALTER TABLE public."Holiday" OWNER TO fusion_admin;

--
-- Name: Holiday_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Holiday_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Holiday_id_seq" OWNER TO fusion_admin;

--
-- Name: Holiday_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Holiday_id_seq" OWNED BY public."Holiday".id;


--
-- Name: InitialRegistration; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."InitialRegistration" (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    priority integer,
    course_id_id integer,
    course_slot_id_id integer,
    semester_id_id integer,
    student_id_id character varying(20),
    registration_type character varying(20) NOT NULL,
    old_course_registration_id integer
);


ALTER TABLE public."InitialRegistration" OWNER TO fusion_admin;

--
-- Name: InitialRegistration_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."InitialRegistration_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."InitialRegistration_id_seq" OWNER TO fusion_admin;

--
-- Name: InitialRegistration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."InitialRegistration_id_seq" OWNED BY public."InitialRegistration".id;


--
-- Name: InitialRegistrations; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."InitialRegistrations" (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    priority integer,
    course_id_id integer,
    course_slot_id_id integer,
    semester_id_id integer,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public."InitialRegistrations" OWNER TO fusion_admin;

--
-- Name: InitialRegistrations_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."InitialRegistrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."InitialRegistrations_id_seq" OWNER TO fusion_admin;

--
-- Name: InitialRegistrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."InitialRegistrations_id_seq" OWNED BY public."InitialRegistrations".id;


--
-- Name: MarkSubmissionCheck; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."MarkSubmissionCheck" (
    id integer NOT NULL,
    verified boolean NOT NULL,
    submitted boolean NOT NULL,
    announced boolean NOT NULL,
    curr_id_id integer NOT NULL
);


ALTER TABLE public."MarkSubmissionCheck" OWNER TO fusion_admin;

--
-- Name: MarkSubmissionCheck_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."MarkSubmissionCheck_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MarkSubmissionCheck_id_seq" OWNER TO fusion_admin;

--
-- Name: MarkSubmissionCheck_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."MarkSubmissionCheck_id_seq" OWNED BY public."MarkSubmissionCheck".id;


--
-- Name: Meeting; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Meeting" (
    id integer NOT NULL,
    venue character varying(50) NOT NULL,
    date date NOT NULL,
    "time" character varying(20) NOT NULL,
    agenda text NOT NULL,
    minutes_file character varying(40) NOT NULL
);


ALTER TABLE public."Meeting" OWNER TO fusion_admin;

--
-- Name: Meeting_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Meeting_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Meeting_id_seq" OWNER TO fusion_admin;

--
-- Name: Meeting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Meeting_id_seq" OWNED BY public."Meeting".id;


--
-- Name: Register; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Register" (
    id integer NOT NULL,
    year integer NOT NULL,
    semester integer NOT NULL,
    curr_id_id integer NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public."Register" OWNER TO fusion_admin;

--
-- Name: Register_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Register_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Register_id_seq" OWNER TO fusion_admin;

--
-- Name: Register_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Register_id_seq" OWNED BY public."Register".id;


--
-- Name: SemesterMarks; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."SemesterMarks" (
    id integer NOT NULL,
    q1 double precision NOT NULL,
    mid_term double precision NOT NULL,
    q2 double precision NOT NULL,
    end_term double precision NOT NULL,
    other double precision NOT NULL,
    grade character varying(5),
    curr_id_id integer NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public."SemesterMarks" OWNER TO fusion_admin;

--
-- Name: SemesterMarks_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."SemesterMarks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SemesterMarks_id_seq" OWNER TO fusion_admin;

--
-- Name: SemesterMarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."SemesterMarks_id_seq" OWNED BY public."SemesterMarks".id;


--
-- Name: Spi; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Spi" (
    id integer NOT NULL,
    sem integer NOT NULL,
    spi double precision NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public."Spi" OWNER TO fusion_admin;

--
-- Name: Spi_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Spi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Spi_id_seq" OWNER TO fusion_admin;

--
-- Name: Spi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Spi_id_seq" OWNED BY public."Spi".id;


--
-- Name: StudentRegistrationCheck; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."StudentRegistrationCheck" (
    id integer NOT NULL,
    pre_registration_flag boolean NOT NULL,
    final_registration_flag boolean NOT NULL,
    semester integer NOT NULL,
    student_id character varying(20) NOT NULL
);


ALTER TABLE public."StudentRegistrationCheck" OWNER TO fusion_admin;

--
-- Name: StudentRegistrationCheck_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."StudentRegistrationCheck_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."StudentRegistrationCheck_id_seq" OWNER TO fusion_admin;

--
-- Name: StudentRegistrationCheck_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."StudentRegistrationCheck_id_seq" OWNED BY public."StudentRegistrationCheck".id;


--
-- Name: StudentRegistrationChecks; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."StudentRegistrationChecks" (
    id integer NOT NULL,
    pre_registration_flag boolean NOT NULL,
    final_registration_flag boolean NOT NULL,
    semester_id_id integer NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public."StudentRegistrationChecks" OWNER TO fusion_admin;

--
-- Name: StudentRegistrationChecks_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."StudentRegistrationChecks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."StudentRegistrationChecks_id_seq" OWNER TO fusion_admin;

--
-- Name: StudentRegistrationChecks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."StudentRegistrationChecks_id_seq" OWNED BY public."StudentRegistrationChecks".id;


--
-- Name: Student_attendance; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Student_attendance" (
    id integer NOT NULL,
    date date NOT NULL,
    present boolean NOT NULL,
    instructor_id_id integer NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public."Student_attendance" OWNER TO fusion_admin;

--
-- Name: Student_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Student_attendance_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Student_attendance_id_seq" OWNER TO fusion_admin;

--
-- Name: Student_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Student_attendance_id_seq" OWNED BY public."Student_attendance".id;


--
-- Name: TeachingCreditRegistration; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."TeachingCreditRegistration" (
    id integer NOT NULL,
    req_pending boolean NOT NULL,
    course_completion boolean NOT NULL,
    approved_course_id integer,
    curr_1_id integer NOT NULL,
    curr_2_id integer NOT NULL,
    curr_3_id integer NOT NULL,
    curr_4_id integer NOT NULL,
    student_id_id character varying(20) NOT NULL,
    supervisor_id_id character varying(20)
);


ALTER TABLE public."TeachingCreditRegistration" OWNER TO fusion_admin;

--
-- Name: TeachingCreditRegistration_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."TeachingCreditRegistration_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TeachingCreditRegistration_id_seq" OWNER TO fusion_admin;

--
-- Name: TeachingCreditRegistration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."TeachingCreditRegistration_id_seq" OWNED BY public."TeachingCreditRegistration".id;


--
-- Name: Thesis; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Thesis" (
    id integer NOT NULL,
    topic character varying(1000) NOT NULL,
    reg_id_id character varying(20) NOT NULL,
    student_id_id character varying(20) NOT NULL,
    supervisor_id_id character varying(20) NOT NULL
);


ALTER TABLE public."Thesis" OWNER TO fusion_admin;

--
-- Name: ThesisTopicProcess; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."ThesisTopicProcess" (
    id integer NOT NULL,
    research_area character varying(50) NOT NULL,
    thesis_topic character varying(1000) NOT NULL,
    submission_by_student boolean NOT NULL,
    pending_supervisor boolean NOT NULL,
    approval_supervisor boolean NOT NULL,
    forwarded_to_hod boolean NOT NULL,
    pending_hod boolean NOT NULL,
    approval_by_hod boolean NOT NULL,
    date date NOT NULL,
    co_supervisor_id_id character varying(20),
    curr_id_id integer,
    member1_id character varying(20),
    member2_id character varying(20),
    member3_id character varying(20),
    student_id_id character varying(20) NOT NULL,
    supervisor_id_id character varying(20) NOT NULL
);


ALTER TABLE public."ThesisTopicProcess" OWNER TO fusion_admin;

--
-- Name: ThesisTopicProcess_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."ThesisTopicProcess_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ThesisTopicProcess_id_seq" OWNER TO fusion_admin;

--
-- Name: ThesisTopicProcess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."ThesisTopicProcess_id_seq" OWNED BY public."ThesisTopicProcess".id;


--
-- Name: Thesis_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Thesis_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Thesis_id_seq" OWNER TO fusion_admin;

--
-- Name: Thesis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Thesis_id_seq" OWNED BY public."Thesis".id;


--
-- Name: Timetable; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public."Timetable" (
    id integer NOT NULL,
    upload_date timestamp with time zone NOT NULL,
    time_table character varying(100) NOT NULL,
    batch integer NOT NULL,
    programme character varying(10) NOT NULL,
    branch character varying(10) NOT NULL
);


ALTER TABLE public."Timetable" OWNER TO fusion_admin;

--
-- Name: Timetable_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public."Timetable_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Timetable_id_seq" OWNER TO fusion_admin;

--
-- Name: Timetable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public."Timetable_id_seq" OWNED BY public."Timetable".id;


--
-- Name: academic_information_student; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_information_student (
    id_id character varying(20) NOT NULL,
    programme character varying(10) NOT NULL,
    batch integer NOT NULL,
    cpi double precision NOT NULL,
    category character varying(10) NOT NULL,
    father_name character varying(40),
    mother_name character varying(40),
    hall_no integer NOT NULL,
    room_no character varying(10),
    specialization character varying(40),
    curr_semester_no integer NOT NULL,
    batch_id_id integer
);


ALTER TABLE public.academic_information_student OWNER TO fusion_admin;

--
-- Name: academic_procedures_assignment; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_assignment (
    id integer NOT NULL,
    start_year integer NOT NULL,
    start_month integer NOT NULL,
    end_year integer NOT NULL,
    end_month integer NOT NULL,
    faculty_id character varying(20) NOT NULL,
    ta_id character varying(20) NOT NULL
);


ALTER TABLE public.academic_procedures_assignment OWNER TO fusion_admin;

--
-- Name: academic_procedures_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_assignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_assignment_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_assignment_id_seq OWNED BY public.academic_procedures_assignment.id;


--
-- Name: academic_procedures_assistantship_status; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_assistantship_status (
    id integer NOT NULL,
    student_status boolean NOT NULL,
    hod_status boolean NOT NULL,
    account_status boolean NOT NULL
);


ALTER TABLE public.academic_procedures_assistantship_status OWNER TO fusion_admin;

--
-- Name: academic_procedures_assistantship_status_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_assistantship_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_assistantship_status_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_assistantship_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_assistantship_status_id_seq OWNED BY public.academic_procedures_assistantship_status.id;


--
-- Name: academic_procedures_assistantshipclaim; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_assistantshipclaim (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    month character varying(10) NOT NULL,
    year integer NOT NULL,
    bank_account character varying(11) NOT NULL,
    applicability character varying(5) NOT NULL,
    ta_supervisor_remark boolean NOT NULL,
    thesis_supervisor_remark boolean NOT NULL,
    hod_approval boolean NOT NULL,
    acad_approval boolean NOT NULL,
    account_approval boolean NOT NULL,
    stipend integer NOT NULL,
    student_id character varying(20) NOT NULL,
    ta_supervisor_id character varying(20) NOT NULL,
    thesis_supervisor_id character varying(20) NOT NULL
);


ALTER TABLE public.academic_procedures_assistantshipclaim OWNER TO fusion_admin;

--
-- Name: academic_procedures_assistantshipclaim_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_assistantshipclaim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_assistantshipclaim_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_assistantshipclaim_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_assistantshipclaim_id_seq OWNED BY public.academic_procedures_assistantshipclaim.id;


--
-- Name: academic_procedures_backlog_course; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_backlog_course (
    id integer NOT NULL,
    is_summer_course boolean NOT NULL,
    course_id_id integer NOT NULL,
    semester_id_id integer NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public.academic_procedures_backlog_course OWNER TO fusion_admin;

--
-- Name: academic_procedures_backlog_course_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_backlog_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_backlog_course_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_backlog_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_backlog_course_id_seq OWNED BY public.academic_procedures_backlog_course.id;


--
-- Name: academic_procedures_batchchangehistory; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_batchchangehistory (
    id integer NOT NULL,
    changed_at timestamp with time zone NOT NULL,
    new_batch_id integer NOT NULL,
    old_batch_id integer NOT NULL,
    student_id character varying(20) NOT NULL
);


ALTER TABLE public.academic_procedures_batchchangehistory OWNER TO fusion_admin;

--
-- Name: academic_procedures_batchchangehistory_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_batchchangehistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_batchchangehistory_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_batchchangehistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_batchchangehistory_id_seq OWNED BY public.academic_procedures_batchchangehistory.id;


--
-- Name: academic_procedures_branchchange; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_branchchange (
    c_id integer NOT NULL,
    applied_date date NOT NULL,
    branches_id integer NOT NULL,
    user_id character varying(20) NOT NULL
);


ALTER TABLE public.academic_procedures_branchchange OWNER TO fusion_admin;

--
-- Name: academic_procedures_branchchange_c_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_branchchange_c_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_branchchange_c_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_branchchange_c_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_branchchange_c_id_seq OWNED BY public.academic_procedures_branchchange.c_id;


--
-- Name: academic_procedures_courseaddrequest; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_courseaddrequest (
    id integer NOT NULL,
    academic_year character varying(9) NOT NULL,
    semester_type character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    processed_at timestamp with time zone,
    course_id integer NOT NULL,
    course_slot_id integer NOT NULL,
    student_id character varying(20) NOT NULL,
    old_course_registration_id integer
);


ALTER TABLE public.academic_procedures_courseaddrequest OWNER TO fusion_admin;

--
-- Name: academic_procedures_courseaddrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_courseaddrequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_courseaddrequest_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_courseaddrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_courseaddrequest_id_seq OWNED BY public.academic_procedures_courseaddrequest.id;


--
-- Name: academic_procedures_coursedroprequest; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_coursedroprequest (
    id integer NOT NULL,
    academic_year character varying(9) NOT NULL,
    semester_type character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    processed_at timestamp with time zone,
    course_id integer NOT NULL,
    course_slot_id integer NOT NULL,
    student_id character varying(20) NOT NULL
);


ALTER TABLE public.academic_procedures_coursedroprequest OWNER TO fusion_admin;

--
-- Name: academic_procedures_coursedroprequest_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_coursedroprequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_coursedroprequest_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_coursedroprequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_coursedroprequest_id_seq OWNED BY public.academic_procedures_coursedroprequest.id;


--
-- Name: academic_procedures_coursereplacementrequest; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_coursereplacementrequest (
    id integer NOT NULL,
    academic_year character varying(9) NOT NULL,
    semester_type character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    processed_at timestamp with time zone,
    course_slot_id integer NOT NULL,
    new_course_id integer NOT NULL,
    old_course_id integer NOT NULL,
    student_id character varying(20) NOT NULL
);


ALTER TABLE public.academic_procedures_coursereplacementrequest OWNER TO fusion_admin;

--
-- Name: academic_procedures_coursereplacementrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_coursereplacementrequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_coursereplacementrequest_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_coursereplacementrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_coursereplacementrequest_id_seq OWNED BY public.academic_procedures_coursereplacementrequest.id;


--
-- Name: academic_procedures_coursesmtech; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_coursesmtech (
    id integer NOT NULL,
    specialization character varying(40) NOT NULL,
    c_id_id integer NOT NULL
);


ALTER TABLE public.academic_procedures_coursesmtech OWNER TO fusion_admin;

--
-- Name: academic_procedures_coursesmtech_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_coursesmtech_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_coursesmtech_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_coursesmtech_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_coursesmtech_id_seq OWNED BY public.academic_procedures_coursesmtech.id;


--
-- Name: academic_procedures_feedbackfilled; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_feedbackfilled (
    id integer NOT NULL,
    semester_no integer NOT NULL,
    filled_at timestamp with time zone NOT NULL,
    student_id character varying(20) NOT NULL,
    CONSTRAINT academic_procedures_feedbackfilled_semester_no_check CHECK ((semester_no >= 0))
);


ALTER TABLE public.academic_procedures_feedbackfilled OWNER TO fusion_admin;

--
-- Name: academic_procedures_feedbackfilled_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_feedbackfilled_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_feedbackfilled_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_feedbackfilled_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_feedbackfilled_id_seq OWNED BY public.academic_procedures_feedbackfilled.id;


--
-- Name: academic_procedures_feedbackoption; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_feedbackoption (
    id integer NOT NULL,
    text character varying(50) NOT NULL,
    "order" integer NOT NULL,
    question_id integer NOT NULL,
    CONSTRAINT academic_procedures_feedbackoption_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.academic_procedures_feedbackoption OWNER TO fusion_admin;

--
-- Name: academic_procedures_feedbackoption_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_feedbackoption_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_feedbackoption_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_feedbackoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_feedbackoption_id_seq OWNED BY public.academic_procedures_feedbackoption.id;


--
-- Name: academic_procedures_feedbackquestion; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_feedbackquestion (
    id integer NOT NULL,
    section character varying(20) NOT NULL,
    text text NOT NULL,
    "order" integer NOT NULL,
    CONSTRAINT academic_procedures_feedbackquestion_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.academic_procedures_feedbackquestion OWNER TO fusion_admin;

--
-- Name: academic_procedures_feedbackquestion_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_feedbackquestion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_feedbackquestion_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_feedbackquestion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_feedbackquestion_id_seq OWNED BY public.academic_procedures_feedbackquestion.id;


--
-- Name: academic_procedures_feedbackresponse; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_feedbackresponse (
    id integer NOT NULL,
    text_answer text NOT NULL,
    section character varying(20) NOT NULL,
    session character varying(9) NOT NULL,
    semester_type character varying(20) NOT NULL,
    submitted_at timestamp with time zone NOT NULL,
    course_id integer NOT NULL,
    option_id integer,
    question_id integer NOT NULL
);


ALTER TABLE public.academic_procedures_feedbackresponse OWNER TO fusion_admin;

--
-- Name: academic_procedures_feedbackresponse_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_feedbackresponse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_feedbackresponse_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_feedbackresponse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_feedbackresponse_id_seq OWNED BY public.academic_procedures_feedbackresponse.id;


--
-- Name: academic_procedures_feepayment; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_feepayment (
    id integer NOT NULL,
    semester integer NOT NULL,
    batch integer NOT NULL,
    mode character varying(20) NOT NULL,
    transaction_id character varying(40) NOT NULL,
    student_id_id character varying(20) NOT NULL
);


ALTER TABLE public.academic_procedures_feepayment OWNER TO fusion_admin;

--
-- Name: academic_procedures_feepayment_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_feepayment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_feepayment_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_feepayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_feepayment_id_seq OWNED BY public.academic_procedures_feepayment.id;


--
-- Name: academic_procedures_messdue; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_messdue (
    id integer NOT NULL,
    month character varying(10) NOT NULL,
    year integer NOT NULL,
    description character varying(15) NOT NULL,
    amount integer NOT NULL,
    remaining_amount integer NOT NULL,
    student_id character varying(20) NOT NULL
);


ALTER TABLE public.academic_procedures_messdue OWNER TO fusion_admin;

--
-- Name: academic_procedures_messdue_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_messdue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_messdue_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_messdue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_messdue_id_seq OWNED BY public.academic_procedures_messdue.id;


--
-- Name: academic_procedures_minimumcredits; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_minimumcredits (
    id integer NOT NULL,
    semester integer NOT NULL,
    credits integer NOT NULL
);


ALTER TABLE public.academic_procedures_minimumcredits OWNER TO fusion_admin;

--
-- Name: academic_procedures_minimumcredits_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_minimumcredits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_minimumcredits_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_minimumcredits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_minimumcredits_id_seq OWNED BY public.academic_procedures_minimumcredits.id;


--
-- Name: academic_procedures_mtechgraduateseminarreport; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_mtechgraduateseminarreport (
    id integer NOT NULL,
    theme_of_work text NOT NULL,
    date date NOT NULL,
    place character varying(30) NOT NULL,
    "time" time without time zone NOT NULL,
    work_done_till_previous_sem text NOT NULL,
    specific_contri_in_cur_sem text NOT NULL,
    future_plan text NOT NULL,
    brief_report character varying(100) NOT NULL,
    publication_submitted integer NOT NULL,
    publication_accepted integer NOT NULL,
    paper_presented integer NOT NULL,
    papers_under_review integer NOT NULL,
    quality_of_work character varying(20) NOT NULL,
    quantity_of_work character varying(15) NOT NULL,
    "Overall_grade" character varying(2) NOT NULL,
    panel_report character varying(15) NOT NULL,
    suggestion text,
    student_id character varying(20) NOT NULL
);


ALTER TABLE public.academic_procedures_mtechgraduateseminarreport OWNER TO fusion_admin;

--
-- Name: academic_procedures_mtechgraduateseminarreport_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_mtechgraduateseminarreport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_mtechgraduateseminarreport_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_mtechgraduateseminarreport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_mtechgraduateseminarreport_id_seq OWNED BY public.academic_procedures_mtechgraduateseminarreport.id;


--
-- Name: academic_procedures_phdprogressexamination; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_phdprogressexamination (
    id integer NOT NULL,
    theme character varying(50) NOT NULL,
    seminar_date_time timestamp with time zone NOT NULL,
    place character varying(30) NOT NULL,
    work_done text NOT NULL,
    specific_contri_curr_semester text NOT NULL,
    future_plan text NOT NULL,
    details character varying(100) NOT NULL,
    papers_published integer NOT NULL,
    presented_papers integer NOT NULL,
    papers_submitted integer NOT NULL,
    quality_of_work character varying(20) NOT NULL,
    quantity_of_work character varying(15) NOT NULL,
    "Overall_grade" character varying(2) NOT NULL,
    completion_period integer,
    panel_report text,
    continuation_enhancement_assistantship character varying(20),
    enhancement_assistantship character varying(15),
    annual_progress_seminar character varying(20),
    commments text,
    student_id character varying(20) NOT NULL
);


ALTER TABLE public.academic_procedures_phdprogressexamination OWNER TO fusion_admin;

--
-- Name: academic_procedures_phdprogressexamination_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_phdprogressexamination_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_phdprogressexamination_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_phdprogressexamination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_phdprogressexamination_id_seq OWNED BY public.academic_procedures_phdprogressexamination.id;


--
-- Name: academic_procedures_stipendrequest; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.academic_procedures_stipendrequest (
    id integer NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    status character varying(20) NOT NULL,
    faculty_remark text,
    hod_remark text,
    assignment_id integer NOT NULL
);


ALTER TABLE public.academic_procedures_stipendrequest OWNER TO fusion_admin;

--
-- Name: academic_procedures_stipendrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.academic_procedures_stipendrequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academic_procedures_stipendrequest_id_seq OWNER TO fusion_admin;

--
-- Name: academic_procedures_stipendrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.academic_procedures_stipendrequest_id_seq OWNED BY public.academic_procedures_stipendrequest.id;


--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO fusion_admin;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO fusion_admin;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO fusion_admin;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO fusion_admin;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO fusion_admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO fusion_admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO fusion_admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO fusion_admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO fusion_admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO fusion_admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO fusion_admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO fusion_admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO fusion_admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO fusion_admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO fusion_admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO fusion_admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO fusion_admin;

--
-- Name: bulk_password_email_operation; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.bulk_password_email_operation (
    id integer NOT NULL,
    operation_id character varying(100) NOT NULL,
    programme_type character varying(10),
    year integer,
    branch_filter character varying(200),
    total_students integer NOT NULL,
    emails_sent integer NOT NULL,
    emails_failed integer NOT NULL,
    emails_pending integer NOT NULL,
    operation_status character varying(15) NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone,
    duration_seconds integer,
    error_summary text,
    notes text,
    initiated_by_id integer
);


ALTER TABLE public.bulk_password_email_operation OWNER TO fusion_admin;

--
-- Name: bulk_password_email_operation_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.bulk_password_email_operation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bulk_password_email_operation_id_seq OWNER TO fusion_admin;

--
-- Name: bulk_password_email_operation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.bulk_password_email_operation_id_seq OWNED BY public.bulk_password_email_operation.id;


--
-- Name: course_registration; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.course_registration (
    id integer NOT NULL,
    working_year integer,
    course_id_id integer NOT NULL,
    course_slot_id_id integer,
    semester_id_id integer NOT NULL,
    student_id_id character varying(20) NOT NULL,
    registration_type character varying(20) NOT NULL,
    semester_type character varying(20),
    session character varying(9)
);


ALTER TABLE public.course_registration OWNER TO fusion_admin;

--
-- Name: course_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.course_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_registration_id_seq OWNER TO fusion_admin;

--
-- Name: course_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.course_registration_id_seq OWNED BY public.course_registration.id;


--
-- Name: course_replacement; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.course_replacement (
    id integer NOT NULL,
    new_course_registration_id integer NOT NULL,
    old_course_registration_id integer NOT NULL
);


ALTER TABLE public.course_replacement OWNER TO fusion_admin;

--
-- Name: course_replacement_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.course_replacement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_replacement_id_seq OWNER TO fusion_admin;

--
-- Name: course_replacement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.course_replacement_id_seq OWNED BY public.course_replacement.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO fusion_admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO fusion_admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO fusion_admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO fusion_admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO fusion_admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO fusion_admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO fusion_admin;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO fusion_admin;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO fusion_admin;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: email_template; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.email_template (
    id integer NOT NULL,
    template_type character varying(20) NOT NULL,
    subject_template character varying(255) NOT NULL,
    html_template text NOT NULL,
    text_template text,
    variables_info jsonb NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id integer
);


ALTER TABLE public.email_template OWNER TO fusion_admin;

--
-- Name: email_template_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.email_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_template_id_seq OWNER TO fusion_admin;

--
-- Name: email_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.email_template_id_seq OWNED BY public.email_template.id;


--
-- Name: globals_departmentinfo; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_departmentinfo (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.globals_departmentinfo OWNER TO fusion_admin;

--
-- Name: globals_departmentinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.globals_departmentinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globals_departmentinfo_id_seq OWNER TO fusion_admin;

--
-- Name: globals_departmentinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.globals_departmentinfo_id_seq OWNED BY public.globals_departmentinfo.id;


--
-- Name: globals_designation; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_designation (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    full_name character varying(100) NOT NULL,
    type character varying(30) NOT NULL
);


ALTER TABLE public.globals_designation OWNER TO fusion_admin;

--
-- Name: globals_designation_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.globals_designation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globals_designation_id_seq OWNER TO fusion_admin;

--
-- Name: globals_designation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.globals_designation_id_seq OWNED BY public.globals_designation.id;


--
-- Name: globals_extrainfo; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_extrainfo (
    id character varying(20) NOT NULL,
    title character varying(20) NOT NULL,
    sex character varying(2) NOT NULL,
    date_of_birth date NOT NULL,
    user_status character varying(50) NOT NULL,
    address text NOT NULL,
    phone_no bigint,
    user_type character varying(20) NOT NULL,
    profile_picture character varying(100),
    about_me text NOT NULL,
    date_modified timestamp with time zone,
    department_id integer,
    user_id integer NOT NULL,
    last_selected_role character varying(20)
);


ALTER TABLE public.globals_extrainfo OWNER TO fusion_admin;

--
-- Name: globals_faculty; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_faculty (
    id_id character varying(20) NOT NULL,
    is_permanent boolean NOT NULL
);


ALTER TABLE public.globals_faculty OWNER TO fusion_admin;

--
-- Name: globals_feedback; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_feedback (
    id integer NOT NULL,
    rating integer NOT NULL,
    feedback text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.globals_feedback OWNER TO fusion_admin;

--
-- Name: globals_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.globals_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globals_feedback_id_seq OWNER TO fusion_admin;

--
-- Name: globals_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.globals_feedback_id_seq OWNED BY public.globals_feedback.id;


--
-- Name: globals_holdsdesignation; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_holdsdesignation (
    id integer NOT NULL,
    held_at timestamp with time zone NOT NULL,
    designation_id integer NOT NULL,
    user_id integer NOT NULL,
    working_id integer NOT NULL
);


ALTER TABLE public.globals_holdsdesignation OWNER TO fusion_admin;

--
-- Name: globals_holdsdesignation_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.globals_holdsdesignation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globals_holdsdesignation_id_seq OWNER TO fusion_admin;

--
-- Name: globals_holdsdesignation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.globals_holdsdesignation_id_seq OWNED BY public.globals_holdsdesignation.id;


--
-- Name: globals_issue; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_issue (
    id integer NOT NULL,
    report_type character varying(63) NOT NULL,
    module character varying(63) NOT NULL,
    closed boolean NOT NULL,
    text text NOT NULL,
    title character varying(255) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    added_on timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.globals_issue OWNER TO fusion_admin;

--
-- Name: globals_issue_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.globals_issue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globals_issue_id_seq OWNER TO fusion_admin;

--
-- Name: globals_issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.globals_issue_id_seq OWNED BY public.globals_issue.id;


--
-- Name: globals_issue_images; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_issue_images (
    id integer NOT NULL,
    issue_id integer NOT NULL,
    issueimage_id integer NOT NULL
);


ALTER TABLE public.globals_issue_images OWNER TO fusion_admin;

--
-- Name: globals_issue_images_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.globals_issue_images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globals_issue_images_id_seq OWNER TO fusion_admin;

--
-- Name: globals_issue_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.globals_issue_images_id_seq OWNED BY public.globals_issue_images.id;


--
-- Name: globals_issue_support; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_issue_support (
    id integer NOT NULL,
    issue_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.globals_issue_support OWNER TO fusion_admin;

--
-- Name: globals_issue_support_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.globals_issue_support_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globals_issue_support_id_seq OWNER TO fusion_admin;

--
-- Name: globals_issue_support_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.globals_issue_support_id_seq OWNED BY public.globals_issue_support.id;


--
-- Name: globals_issueimage; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_issueimage (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.globals_issueimage OWNER TO fusion_admin;

--
-- Name: globals_issueimage_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.globals_issueimage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globals_issueimage_id_seq OWNER TO fusion_admin;

--
-- Name: globals_issueimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.globals_issueimage_id_seq OWNED BY public.globals_issueimage.id;


--
-- Name: globals_moduleaccess; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_moduleaccess (
    id integer NOT NULL,
    designation character varying(155) NOT NULL,
    program_and_curriculum boolean NOT NULL,
    course_registration boolean NOT NULL,
    course_management boolean NOT NULL,
    other_academics boolean NOT NULL,
    spacs boolean NOT NULL,
    department boolean NOT NULL,
    examinations boolean NOT NULL,
    hr boolean NOT NULL,
    iwd boolean NOT NULL,
    complaint_management boolean NOT NULL,
    fts boolean NOT NULL,
    purchase_and_store boolean NOT NULL,
    rspc boolean NOT NULL,
    hostel_management boolean NOT NULL,
    mess_management boolean NOT NULL,
    gymkhana boolean NOT NULL,
    placement_cell boolean NOT NULL,
    visitor_hostel boolean NOT NULL,
    phc boolean NOT NULL,
    database boolean NOT NULL
);


ALTER TABLE public.globals_moduleaccess OWNER TO fusion_admin;

--
-- Name: globals_moduleaccess_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.globals_moduleaccess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globals_moduleaccess_id_seq OWNER TO fusion_admin;

--
-- Name: globals_moduleaccess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.globals_moduleaccess_id_seq OWNED BY public.globals_moduleaccess.id;


--
-- Name: globals_passwordresettracker; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_passwordresettracker (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    last_reset timestamp with time zone
);


ALTER TABLE public.globals_passwordresettracker OWNER TO fusion_admin;

--
-- Name: globals_passwordresettracker_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.globals_passwordresettracker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.globals_passwordresettracker_id_seq OWNER TO fusion_admin;

--
-- Name: globals_passwordresettracker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.globals_passwordresettracker_id_seq OWNED BY public.globals_passwordresettracker.id;


--
-- Name: globals_staff; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.globals_staff (
    id_id character varying(20) NOT NULL
);


ALTER TABLE public.globals_staff OWNER TO fusion_admin;

--
-- Name: notifications_notification; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.notifications_notification (
    id integer NOT NULL,
    level character varying(20) NOT NULL,
    unread boolean NOT NULL,
    actor_object_id character varying(255) NOT NULL,
    verb character varying(255) NOT NULL,
    description text,
    target_object_id character varying(255),
    action_object_object_id character varying(255),
    "timestamp" timestamp with time zone NOT NULL,
    public boolean NOT NULL,
    action_object_content_type_id integer,
    actor_content_type_id integer NOT NULL,
    recipient_id integer NOT NULL,
    target_content_type_id integer,
    deleted boolean NOT NULL,
    emailed boolean NOT NULL,
    data text
);


ALTER TABLE public.notifications_notification OWNER TO fusion_admin;

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.notifications_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_notification_id_seq OWNER TO fusion_admin;

--
-- Name: notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications_notification.id;


--
-- Name: password_email_log; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.password_email_log (
    id integer NOT NULL,
    sent_to_email character varying(254) NOT NULL,
    email_status character varying(10) NOT NULL,
    password_generated character varying(100),
    email_subject character varying(255),
    email_content_preview text,
    error_message text,
    attempts_count integer NOT NULL,
    ip_address inet,
    user_agent text,
    sent_at timestamp with time zone NOT NULL,
    last_attempt_at timestamp with time zone NOT NULL,
    sent_by_id integer,
    student_id integer NOT NULL
);


ALTER TABLE public.password_email_log OWNER TO fusion_admin;

--
-- Name: password_email_log_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.password_email_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.password_email_log_id_seq OWNER TO fusion_admin;

--
-- Name: password_email_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.password_email_log_id_seq OWNED BY public.password_email_log.id;


--
-- Name: programme_curriculum_batch; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_batch (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    year integer NOT NULL,
    running_batch boolean NOT NULL,
    curriculum_id integer,
    discipline_id integer NOT NULL,
    total_seats integer NOT NULL,
    curriculum_options jsonb,
    CONSTRAINT programme_curriculum_batch_total_seats_check CHECK ((total_seats >= 0)),
    CONSTRAINT programme_curriculum_batch_year_check CHECK ((year >= 0))
);


ALTER TABLE public.programme_curriculum_batch OWNER TO fusion_admin;

--
-- Name: programme_curriculum_batch_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_batch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_batch_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_batch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_batch_id_seq OWNED BY public.programme_curriculum_batch.id;


--
-- Name: programme_curriculum_batchconfiguration; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_batchconfiguration (
    id integer NOT NULL,
    programme character varying(50) NOT NULL,
    discipline character varying(100) NOT NULL,
    year integer NOT NULL,
    total_seats integer NOT NULL,
    filled_seats integer NOT NULL,
    available_seats integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.programme_curriculum_batchconfiguration OWNER TO fusion_admin;

--
-- Name: programme_curriculum_batchconfiguration_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_batchconfiguration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_batchconfiguration_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_batchconfiguration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_batchconfiguration_id_seq OWNED BY public.programme_curriculum_batchconfiguration.id;


--
-- Name: programme_curriculum_course; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_course (
    id integer NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    version numeric(5,1) NOT NULL,
    credit integer NOT NULL,
    lecture_hours integer,
    tutorial_hours integer,
    pratical_hours integer,
    discussion_hours integer,
    project_hours integer,
    pre_requisits text,
    syllabus text NOT NULL,
    percent_quiz_1 integer NOT NULL,
    percent_midsem integer NOT NULL,
    percent_quiz_2 integer NOT NULL,
    percent_endsem integer NOT NULL,
    percent_project integer NOT NULL,
    percent_lab_evaluation integer NOT NULL,
    percent_course_attendance integer NOT NULL,
    ref_books text NOT NULL,
    working_course boolean NOT NULL,
    latest_version boolean NOT NULL,
    max_seats integer NOT NULL,
    CONSTRAINT programme_curriculum_course_credit_check CHECK ((credit >= 0)),
    CONSTRAINT programme_curriculum_course_discussion_hours_check CHECK ((discussion_hours >= 0)),
    CONSTRAINT programme_curriculum_course_lecture_hours_check CHECK ((lecture_hours >= 0)),
    CONSTRAINT programme_curriculum_course_percent_course_attendance_check CHECK ((percent_course_attendance >= 0)),
    CONSTRAINT programme_curriculum_course_percent_endsem_check CHECK ((percent_endsem >= 0)),
    CONSTRAINT programme_curriculum_course_percent_lab_evaluation_check CHECK ((percent_lab_evaluation >= 0)),
    CONSTRAINT programme_curriculum_course_percent_midsem_check CHECK ((percent_midsem >= 0)),
    CONSTRAINT programme_curriculum_course_percent_project_check CHECK ((percent_project >= 0)),
    CONSTRAINT programme_curriculum_course_percent_quiz_1_check CHECK ((percent_quiz_1 >= 0)),
    CONSTRAINT programme_curriculum_course_percent_quiz_2_check CHECK ((percent_quiz_2 >= 0)),
    CONSTRAINT programme_curriculum_course_pratical_hours_check CHECK ((pratical_hours >= 0)),
    CONSTRAINT programme_curriculum_course_project_hours_check CHECK ((project_hours >= 0)),
    CONSTRAINT programme_curriculum_course_tutorial_hours_check CHECK ((tutorial_hours >= 0))
);


ALTER TABLE public.programme_curriculum_course OWNER TO fusion_admin;

--
-- Name: programme_curriculum_course_disciplines; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_course_disciplines (
    id integer NOT NULL,
    course_id integer NOT NULL,
    discipline_id integer NOT NULL
);


ALTER TABLE public.programme_curriculum_course_disciplines OWNER TO fusion_admin;

--
-- Name: programme_curriculum_course_disciplines_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_course_disciplines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_course_disciplines_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_course_disciplines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_course_disciplines_id_seq OWNED BY public.programme_curriculum_course_disciplines.id;


--
-- Name: programme_curriculum_course_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_course_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_course_id_seq OWNED BY public.programme_curriculum_course.id;


--
-- Name: programme_curriculum_course_pre_requisit_courses; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_course_pre_requisit_courses (
    id integer NOT NULL,
    from_course_id integer NOT NULL,
    to_course_id integer NOT NULL
);


ALTER TABLE public.programme_curriculum_course_pre_requisit_courses OWNER TO fusion_admin;

--
-- Name: programme_curriculum_course_pre_requisit_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_course_pre_requisit_courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_course_pre_requisit_courses_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_course_pre_requisit_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_course_pre_requisit_courses_id_seq OWNED BY public.programme_curriculum_course_pre_requisit_courses.id;


--
-- Name: programme_curriculum_courseauditlog; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_courseauditlog (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    action character varying(20) NOT NULL,
    old_values jsonb,
    new_values jsonb,
    changed_fields jsonb NOT NULL,
    version_bump_type character varying(10) NOT NULL,
    old_version numeric(5,1),
    new_version numeric(5,1),
    admin_override boolean NOT NULL,
    reason text NOT NULL,
    course_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.programme_curriculum_courseauditlog OWNER TO fusion_admin;

--
-- Name: programme_curriculum_courseauditlog_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_courseauditlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_courseauditlog_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_courseauditlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_courseauditlog_id_seq OWNED BY public.programme_curriculum_courseauditlog.id;


--
-- Name: programme_curriculum_courseinstructor; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_courseinstructor (
    id integer NOT NULL,
    course_id_id integer NOT NULL,
    instructor_id_id character varying(20) NOT NULL,
    year integer NOT NULL,
    semester_type character varying(20)
);


ALTER TABLE public.programme_curriculum_courseinstructor OWNER TO fusion_admin;

--
-- Name: programme_curriculum_courseinstructor_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_courseinstructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_courseinstructor_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_courseinstructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_courseinstructor_id_seq OWNED BY public.programme_curriculum_courseinstructor.id;


--
-- Name: programme_curriculum_courseslot; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_courseslot (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(70) NOT NULL,
    course_slot_info text,
    duration integer NOT NULL,
    min_registration_limit integer NOT NULL,
    max_registration_limit integer NOT NULL,
    semester_id integer NOT NULL,
    CONSTRAINT programme_curriculum_courseslot_duration_check CHECK ((duration >= 0)),
    CONSTRAINT programme_curriculum_courseslot_max_registration_limit_check CHECK ((max_registration_limit >= 0)),
    CONSTRAINT programme_curriculum_courseslot_min_registration_limit_check CHECK ((min_registration_limit >= 0))
);


ALTER TABLE public.programme_curriculum_courseslot OWNER TO fusion_admin;

--
-- Name: programme_curriculum_courseslot_courses; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_courseslot_courses (
    id integer NOT NULL,
    courseslot_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.programme_curriculum_courseslot_courses OWNER TO fusion_admin;

--
-- Name: programme_curriculum_courseslot_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_courseslot_courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_courseslot_courses_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_courseslot_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_courseslot_courses_id_seq OWNED BY public.programme_curriculum_courseslot_courses.id;


--
-- Name: programme_curriculum_courseslot_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_courseslot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_courseslot_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_courseslot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_courseslot_id_seq OWNED BY public.programme_curriculum_courseslot.id;


--
-- Name: programme_curriculum_curriculum; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_curriculum (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    version numeric(5,1) NOT NULL,
    working_curriculum boolean NOT NULL,
    no_of_semester integer NOT NULL,
    min_credit integer NOT NULL,
    latest_version boolean NOT NULL,
    programme_id integer NOT NULL,
    CONSTRAINT programme_curriculum_curriculum_min_credit_check CHECK ((min_credit >= 0)),
    CONSTRAINT programme_curriculum_curriculum_no_of_semester_check CHECK ((no_of_semester >= 0))
);


ALTER TABLE public.programme_curriculum_curriculum OWNER TO fusion_admin;

--
-- Name: programme_curriculum_curriculum_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_curriculum_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_curriculum_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_curriculum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_curriculum_id_seq OWNED BY public.programme_curriculum_curriculum.id;


--
-- Name: programme_curriculum_discipline; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_discipline (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    acronym character varying(10) NOT NULL
);


ALTER TABLE public.programme_curriculum_discipline OWNER TO fusion_admin;

--
-- Name: programme_curriculum_discipline_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_discipline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_discipline_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_discipline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_discipline_id_seq OWNED BY public.programme_curriculum_discipline.id;


--
-- Name: programme_curriculum_discipline_programmes; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_discipline_programmes (
    id integer NOT NULL,
    discipline_id integer NOT NULL,
    programme_id integer NOT NULL
);


ALTER TABLE public.programme_curriculum_discipline_programmes OWNER TO fusion_admin;

--
-- Name: programme_curriculum_discipline_programmes_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_discipline_programmes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_discipline_programmes_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_discipline_programmes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_discipline_programmes_id_seq OWNED BY public.programme_curriculum_discipline_programmes.id;


--
-- Name: programme_curriculum_newproposalfile; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_newproposalfile (
    id integer NOT NULL,
    uploader character varying(100) NOT NULL,
    designation character varying(100) NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    credit integer NOT NULL,
    lecture_hours integer,
    tutorial_hours integer,
    pratical_hours integer,
    discussion_hours integer,
    project_hours integer,
    pre_requisits text,
    syllabus text NOT NULL,
    percent_quiz_1 integer NOT NULL,
    percent_midsem integer NOT NULL,
    percent_quiz_2 integer NOT NULL,
    percent_endsem integer NOT NULL,
    percent_project integer NOT NULL,
    percent_lab_evaluation integer NOT NULL,
    percent_course_attendance integer NOT NULL,
    ref_books text NOT NULL,
    subject character varying(100),
    description character varying(400),
    upload_date timestamp with time zone NOT NULL,
    is_read boolean NOT NULL,
    is_update boolean NOT NULL,
    is_archive boolean NOT NULL,
    max_seats integer NOT NULL,
    CONSTRAINT programme_curriculum_newproposa_percent_course_attendance_check CHECK ((percent_course_attendance >= 0)),
    CONSTRAINT programme_curriculum_newproposalfi_percent_lab_evaluation_check CHECK ((percent_lab_evaluation >= 0)),
    CONSTRAINT programme_curriculum_newproposalfile_credit_check CHECK ((credit >= 0)),
    CONSTRAINT programme_curriculum_newproposalfile_discussion_hours_check CHECK ((discussion_hours >= 0)),
    CONSTRAINT programme_curriculum_newproposalfile_lecture_hours_check CHECK ((lecture_hours >= 0)),
    CONSTRAINT programme_curriculum_newproposalfile_percent_endsem_check CHECK ((percent_endsem >= 0)),
    CONSTRAINT programme_curriculum_newproposalfile_percent_midsem_check CHECK ((percent_midsem >= 0)),
    CONSTRAINT programme_curriculum_newproposalfile_percent_project_check CHECK ((percent_project >= 0)),
    CONSTRAINT programme_curriculum_newproposalfile_percent_quiz_1_check CHECK ((percent_quiz_1 >= 0)),
    CONSTRAINT programme_curriculum_newproposalfile_percent_quiz_2_check CHECK ((percent_quiz_2 >= 0)),
    CONSTRAINT programme_curriculum_newproposalfile_pratical_hours_check CHECK ((pratical_hours >= 0)),
    CONSTRAINT programme_curriculum_newproposalfile_project_hours_check CHECK ((project_hours >= 0)),
    CONSTRAINT programme_curriculum_newproposalfile_tutorial_hours_check CHECK ((tutorial_hours >= 0))
);


ALTER TABLE public.programme_curriculum_newproposalfile OWNER TO fusion_admin;

--
-- Name: programme_curriculum_newproposalfile_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_newproposalfile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_newproposalfile_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_newproposalfile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_newproposalfile_id_seq OWNED BY public.programme_curriculum_newproposalfile.id;


--
-- Name: programme_curriculum_newproposalfile_pre_requisit_courses; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_newproposalfile_pre_requisit_courses (
    id integer NOT NULL,
    newproposalfile_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.programme_curriculum_newproposalfile_pre_requisit_courses OWNER TO fusion_admin;

--
-- Name: programme_curriculum_newproposalfile_pre_requisit_course_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_newproposalfile_pre_requisit_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_newproposalfile_pre_requisit_course_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_newproposalfile_pre_requisit_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_newproposalfile_pre_requisit_course_id_seq OWNED BY public.programme_curriculum_newproposalfile_pre_requisit_courses.id;


--
-- Name: programme_curriculum_programme; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_programme (
    id integer NOT NULL,
    category character varying(3) NOT NULL,
    name character varying(70) NOT NULL,
    programme_begin_year integer NOT NULL,
    CONSTRAINT programme_curriculum_programme_programme_begin_year_check CHECK ((programme_begin_year >= 0))
);


ALTER TABLE public.programme_curriculum_programme OWNER TO fusion_admin;

--
-- Name: programme_curriculum_programme_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_programme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_programme_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_programme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_programme_id_seq OWNED BY public.programme_curriculum_programme.id;


--
-- Name: programme_curriculum_proposal_tracking; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_proposal_tracking (
    id integer NOT NULL,
    file_id character varying(100) NOT NULL,
    current_id character varying(100) NOT NULL,
    current_design character varying(100) NOT NULL,
    receive_date timestamp with time zone NOT NULL,
    forward_date timestamp with time zone NOT NULL,
    remarks character varying(250),
    is_added boolean NOT NULL,
    is_submitted boolean NOT NULL,
    is_rejected boolean NOT NULL,
    sender_archive boolean NOT NULL,
    receiver_archive boolean NOT NULL,
    disciplines_id integer NOT NULL,
    receive_design_id integer NOT NULL,
    receive_id_id integer NOT NULL
);


ALTER TABLE public.programme_curriculum_proposal_tracking OWNER TO fusion_admin;

--
-- Name: programme_curriculum_proposal_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_proposal_tracking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_proposal_tracking_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_proposal_tracking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_proposal_tracking_id_seq OWNED BY public.programme_curriculum_proposal_tracking.id;


--
-- Name: programme_curriculum_semester; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_semester (
    id integer NOT NULL,
    semester_no integer NOT NULL,
    instigate_semester boolean,
    start_semester date,
    end_semester date,
    semester_info text,
    curriculum_id integer NOT NULL,
    CONSTRAINT programme_curriculum_semester_semester_no_check CHECK ((semester_no >= 0))
);


ALTER TABLE public.programme_curriculum_semester OWNER TO fusion_admin;

--
-- Name: programme_curriculum_semester_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_semester_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_semester_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_semester_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_semester_id_seq OWNED BY public.programme_curriculum_semester.id;


--
-- Name: programme_curriculum_studentbatchupload; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_studentbatchupload (
    id integer NOT NULL,
    jee_app_no character varying(50) NOT NULL,
    roll_number character varying(20),
    institute_email character varying(254),
    name character varying(200) NOT NULL,
    father_name character varying(200) NOT NULL,
    mother_name character varying(200) NOT NULL,
    gender character varying(10) NOT NULL,
    category character varying(10) NOT NULL,
    pwd character varying(3) NOT NULL,
    phone_number character varying(15),
    personal_email character varying(254),
    address text NOT NULL,
    state character varying(100),
    branch character varying(200) NOT NULL,
    date_of_birth date,
    jee_rank integer,
    category_rank integer,
    tenth_marks double precision,
    twelfth_marks double precision,
    father_occupation character varying(200),
    father_mobile character varying(15),
    mother_occupation character varying(200),
    mother_mobile character varying(15),
    aadhar_number character varying(12),
    allotted_category character varying(50),
    allotted_gender character varying(50),
    batch_year integer NOT NULL,
    programme_type character varying(10) NOT NULL,
    reported_status character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id integer,
    user_account_id integer,
    academic_year character varying(20) NOT NULL,
    allocation_status character varying(50) NOT NULL,
    email_password character varying(50),
    password_email_sent boolean NOT NULL,
    password_generated_at timestamp with time zone,
    source character varying(50) NOT NULL,
    minority text,
    admission_mode character varying(50),
    admission_mode_remarks text,
    blood_group character varying(10),
    blood_group_remarks text,
    country character varying(100),
    income numeric(10,2),
    income_group character varying(30),
    nationality character varying(100),
    parent_email character varying(254),
    pwd_category character varying(100),
    pwd_category_remarks text,
    specialization character varying(200)
);


ALTER TABLE public.programme_curriculum_studentbatchupload OWNER TO fusion_admin;

--
-- Name: programme_curriculum_studentbatchupload_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_studentbatchupload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_studentbatchupload_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_studentbatchupload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_studentbatchupload_id_seq OWNED BY public.programme_curriculum_studentbatchupload.id;


--
-- Name: programme_curriculum_studentstatuslog; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_studentstatuslog (
    id integer NOT NULL,
    old_reported_status character varying(20) NOT NULL,
    new_reported_status character varying(20) NOT NULL,
    change_reason text,
    ip_address inet,
    created_at timestamp with time zone NOT NULL,
    changed_by_id integer,
    student_id integer NOT NULL
);


ALTER TABLE public.programme_curriculum_studentstatuslog OWNER TO fusion_admin;

--
-- Name: programme_curriculum_studentstatuslog_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_studentstatuslog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_studentstatuslog_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_studentstatuslog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_studentstatuslog_id_seq OWNED BY public.programme_curriculum_studentstatuslog.id;


--
-- Name: programme_curriculum_uploadhistory; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.programme_curriculum_uploadhistory (
    id integer NOT NULL,
    upload_type character varying(20) NOT NULL,
    programme_type character varying(10) NOT NULL,
    total_records integer NOT NULL,
    successful_records integer NOT NULL,
    failed_records integer NOT NULL,
    file_name character varying(255),
    upload_notes text,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_id integer
);


ALTER TABLE public.programme_curriculum_uploadhistory OWNER TO fusion_admin;

--
-- Name: programme_curriculum_uploadhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.programme_curriculum_uploadhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_curriculum_uploadhistory_id_seq OWNER TO fusion_admin;

--
-- Name: programme_curriculum_uploadhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.programme_curriculum_uploadhistory_id_seq OWNED BY public.programme_curriculum_uploadhistory.id;


--
-- Name: research_procedures_consultancyproject; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_consultancyproject (
    id bigint NOT NULL,
    title character varying(500) NOT NULL,
    project_number character varying(50),
    description text,
    client_name character varying(200) NOT NULL,
    client_type character varying(50),
    client_contact text,
    client_email character varying(254),
    client_phone character varying(20),
    consultants character varying(150),
    contract_amount numeric(15,2) NOT NULL,
    faculty_share numeric(15,2) NOT NULL,
    institute_share numeric(15,2) NOT NULL,
    financial_outlay integer,
    currency character varying(3) NOT NULL,
    payment_received numeric(15,2) NOT NULL,
    start_date date NOT NULL,
    end_date date,
    actual_completion_date date,
    duration character varying(500),
    status character varying(20) NOT NULL,
    agreement_document character varying(100),
    completion_certificate character varying(100),
    pf_no integer,
    remarks character varying(1000),
    notes text,
    date_entry date,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    consultant_id character varying(20),
    user_id integer
);


ALTER TABLE public.research_procedures_consultancyproject OWNER TO fusion_admin;

--
-- Name: research_procedures_consultancyproject_co_consultants; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_consultancyproject_co_consultants (
    id integer NOT NULL,
    consultancyproject_id bigint NOT NULL,
    faculty_id character varying(20) NOT NULL
);


ALTER TABLE public.research_procedures_consultancyproject_co_consultants OWNER TO fusion_admin;

--
-- Name: research_procedures_consultancyproject_co_consultants_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_consultancyproject_co_consultants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_consultancyproject_co_consultants_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_consultancyproject_co_consultants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_consultancyproject_co_consultants_id_seq OWNED BY public.research_procedures_consultancyproject_co_consultants.id;


--
-- Name: research_procedures_consultancyproject_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_consultancyproject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_consultancyproject_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_consultancyproject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_consultancyproject_id_seq OWNED BY public.research_procedures_consultancyproject.id;


--
-- Name: research_procedures_fundingagency; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_fundingagency (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    acronym character varying(20),
    agency_type character varying(20) NOT NULL,
    country character varying(50) NOT NULL,
    website character varying(200),
    contact_info text,
    email character varying(254),
    phone character varying(20),
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.research_procedures_fundingagency OWNER TO fusion_admin;

--
-- Name: research_procedures_fundingagency_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_fundingagency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_fundingagency_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_fundingagency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_fundingagency_id_seq OWNED BY public.research_procedures_fundingagency.id;


--
-- Name: research_procedures_patent; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_patent (
    application_id integer NOT NULL,
    ipd_form_file text,
    project_details_file text,
    title character varying(500) NOT NULL,
    abstract text,
    patent_type character varying(20) NOT NULL,
    external_inventors text,
    application_number character varying(50),
    filing_date date,
    publication_number character varying(50),
    publication_date date,
    grant_number character varying(50),
    grant_date date,
    status character varying(20) NOT NULL,
    country character varying(50) NOT NULL,
    organization character varying(100),
    specification_document character varying(100),
    grant_certificate character varying(100),
    notes text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    faculty_id_id character varying(20),
    related_project_id bigint,
    ipd_form character varying(100),
    project_details character varying(100)
);


ALTER TABLE public.research_procedures_patent OWNER TO fusion_admin;

--
-- Name: research_procedures_patent_application_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_patent_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_patent_application_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_patent_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_patent_application_id_seq OWNED BY public.research_procedures_patent.application_id;


--
-- Name: research_procedures_patent_faculty_inventors; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_patent_faculty_inventors (
    id integer NOT NULL,
    patent_id integer NOT NULL,
    faculty_id character varying(20) NOT NULL
);


ALTER TABLE public.research_procedures_patent_faculty_inventors OWNER TO fusion_admin;

--
-- Name: research_procedures_patent_faculty_inventors_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_patent_faculty_inventors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_patent_faculty_inventors_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_patent_faculty_inventors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_patent_faculty_inventors_id_seq OWNED BY public.research_procedures_patent_faculty_inventors.id;


--
-- Name: research_procedures_patent_student_inventors; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_patent_student_inventors (
    id integer NOT NULL,
    patent_id integer NOT NULL,
    student_id character varying(20) NOT NULL
);


ALTER TABLE public.research_procedures_patent_student_inventors OWNER TO fusion_admin;

--
-- Name: research_procedures_patent_student_inventors_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_patent_student_inventors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_patent_student_inventors_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_patent_student_inventors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_patent_student_inventors_id_seq OWNED BY public.research_procedures_patent_student_inventors.id;


--
-- Name: research_procedures_patentstatusnotification; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_patentstatusnotification (
    id bigint NOT NULL,
    previous_status character varying(50) NOT NULL,
    new_status character varying(50) NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    faculty_id character varying(20),
    patent_id integer NOT NULL
);


ALTER TABLE public.research_procedures_patentstatusnotification OWNER TO fusion_admin;

--
-- Name: research_procedures_patentstatusnotification_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_patentstatusnotification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_patentstatusnotification_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_patentstatusnotification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_patentstatusnotification_id_seq OWNED BY public.research_procedures_patentstatusnotification.id;


--
-- Name: research_procedures_projectexpenditure; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_projectexpenditure (
    id bigint NOT NULL,
    expenditure_head character varying(20) NOT NULL,
    description text NOT NULL,
    amount numeric(15,2) NOT NULL,
    date date NOT NULL,
    voucher_number character varying(50),
    bill_document character varying(100),
    status character varying(20) NOT NULL,
    approval_date date,
    remarks text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id bigint NOT NULL,
    approved_by_id character varying(20),
    last_date date
);


ALTER TABLE public.research_procedures_projectexpenditure OWNER TO fusion_admin;

--
-- Name: research_procedures_projectexpenditure_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_projectexpenditure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_projectexpenditure_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_projectexpenditure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_projectexpenditure_id_seq OWNED BY public.research_procedures_projectexpenditure.id;


--
-- Name: research_procedures_projectmilestone; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_projectmilestone (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    due_date date NOT NULL,
    completed_date date,
    status character varying(20) NOT NULL,
    deliverables text,
    deliverable_file character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id bigint NOT NULL
);


ALTER TABLE public.research_procedures_projectmilestone OWNER TO fusion_admin;

--
-- Name: research_procedures_projectmilestone_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_projectmilestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_projectmilestone_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_projectmilestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_projectmilestone_id_seq OWNED BY public.research_procedures_projectmilestone.id;


--
-- Name: research_procedures_projectreport; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_projectreport (
    id bigint NOT NULL,
    report_type character varying(20) NOT NULL,
    period_from date NOT NULL,
    period_to date NOT NULL,
    summary text NOT NULL,
    achievements text,
    challenges text,
    next_steps text,
    report_file character varying(100) NOT NULL,
    status character varying(20) NOT NULL,
    submitted_date date,
    approved_date date,
    comments text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    project_id bigint NOT NULL
);


ALTER TABLE public.research_procedures_projectreport OWNER TO fusion_admin;

--
-- Name: research_procedures_projectreport_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_projectreport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_projectreport_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_projectreport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_projectreport_id_seq OWNED BY public.research_procedures_projectreport.id;


--
-- Name: research_procedures_publication; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_publication (
    id bigint NOT NULL,
    title character varying(500) NOT NULL,
    publication_type character varying(20) NOT NULL,
    external_authors text,
    journal_conference_name character varying(300) NOT NULL,
    publisher character varying(200),
    volume character varying(20),
    issue character varying(20),
    pages character varying(20),
    year integer NOT NULL,
    month integer,
    index_type character varying(20) NOT NULL,
    impact_factor numeric(6,3),
    doi character varying(100),
    issn character varying(20),
    isbn character varying(20),
    url character varying(200),
    pdf_file character varying(100),
    abstract text,
    keywords character varying(500),
    is_verified boolean NOT NULL,
    verification_date date,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    associated_project_id bigint,
    verified_by_id character varying(20)
);


ALTER TABLE public.research_procedures_publication OWNER TO fusion_admin;

--
-- Name: research_procedures_publication_faculty_authors; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_publication_faculty_authors (
    id integer NOT NULL,
    publication_id bigint NOT NULL,
    faculty_id character varying(20) NOT NULL
);


ALTER TABLE public.research_procedures_publication_faculty_authors OWNER TO fusion_admin;

--
-- Name: research_procedures_publication_faculty_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_publication_faculty_authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_publication_faculty_authors_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_publication_faculty_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_publication_faculty_authors_id_seq OWNED BY public.research_procedures_publication_faculty_authors.id;


--
-- Name: research_procedures_publication_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_publication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_publication_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_publication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_publication_id_seq OWNED BY public.research_procedures_publication.id;


--
-- Name: research_procedures_publication_student_authors; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_publication_student_authors (
    id integer NOT NULL,
    publication_id bigint NOT NULL,
    student_id character varying(20) NOT NULL
);


ALTER TABLE public.research_procedures_publication_student_authors OWNER TO fusion_admin;

--
-- Name: research_procedures_publication_student_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_publication_student_authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_publication_student_authors_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_publication_student_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_publication_student_authors_id_seq OWNED BY public.research_procedures_publication_student_authors.id;


--
-- Name: research_procedures_researcharea; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_researcharea (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    description text,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    discipline_id integer,
    parent_area_id bigint
);


ALTER TABLE public.research_procedures_researcharea OWNER TO fusion_admin;

--
-- Name: research_procedures_researcharea_faculty_experts; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_researcharea_faculty_experts (
    id integer NOT NULL,
    researcharea_id bigint NOT NULL,
    faculty_id character varying(20) NOT NULL
);


ALTER TABLE public.research_procedures_researcharea_faculty_experts OWNER TO fusion_admin;

--
-- Name: research_procedures_researcharea_faculty_experts_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_researcharea_faculty_experts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_researcharea_faculty_experts_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_researcharea_faculty_experts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_researcharea_faculty_experts_id_seq OWNED BY public.research_procedures_researcharea_faculty_experts.id;


--
-- Name: research_procedures_researcharea_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_researcharea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_researcharea_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_researcharea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_researcharea_id_seq OWNED BY public.research_procedures_researcharea.id;


--
-- Name: research_procedures_researchgroup; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_researchgroup (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    acronym character varying(20),
    description text,
    established_date date,
    website character varying(200),
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    discipline_id integer,
    head_id character varying(20)
);


ALTER TABLE public.research_procedures_researchgroup OWNER TO fusion_admin;

--
-- Name: research_procedures_researchgroup_faculty_under_group; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_researchgroup_faculty_under_group (
    id integer NOT NULL,
    researchgroup_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.research_procedures_researchgroup_faculty_under_group OWNER TO fusion_admin;

--
-- Name: research_procedures_researchgroup_faculty_under_group_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_researchgroup_faculty_under_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_researchgroup_faculty_under_group_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_researchgroup_faculty_under_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_researchgroup_faculty_under_group_id_seq OWNED BY public.research_procedures_researchgroup_faculty_under_group.id;


--
-- Name: research_procedures_researchgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_researchgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_researchgroup_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_researchgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_researchgroup_id_seq OWNED BY public.research_procedures_researchgroup.id;


--
-- Name: research_procedures_researchgroup_members; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_researchgroup_members (
    id integer NOT NULL,
    researchgroup_id bigint NOT NULL,
    faculty_id character varying(20) NOT NULL
);


ALTER TABLE public.research_procedures_researchgroup_members OWNER TO fusion_admin;

--
-- Name: research_procedures_researchgroup_members_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_researchgroup_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_researchgroup_members_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_researchgroup_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_researchgroup_members_id_seq OWNED BY public.research_procedures_researchgroup_members.id;


--
-- Name: research_procedures_researchgroup_students_under_group; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_researchgroup_students_under_group (
    id integer NOT NULL,
    researchgroup_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.research_procedures_researchgroup_students_under_group OWNER TO fusion_admin;

--
-- Name: research_procedures_researchgroup_students_under_group_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_researchgroup_students_under_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_researchgroup_students_under_group_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_researchgroup_students_under_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_researchgroup_students_under_group_id_seq OWNED BY public.research_procedures_researchgroup_students_under_group.id;


--
-- Name: research_procedures_researchproject; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_researchproject (
    id bigint NOT NULL,
    pf_no integer NOT NULL,
    ptype character varying(100) NOT NULL,
    pi character varying(1000) NOT NULL,
    co_pi character varying(1500) NOT NULL,
    title text NOT NULL,
    funding_agency character varying(250),
    financial_outlay character varying(150),
    status character varying(10) NOT NULL,
    start_date date,
    finish_date date,
    date_submission date,
    date_entry date,
    user_id integer
);


ALTER TABLE public.research_procedures_researchproject OWNER TO fusion_admin;

--
-- Name: research_procedures_researchproject_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_researchproject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_researchproject_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_researchproject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_researchproject_id_seq OWNED BY public.research_procedures_researchproject.id;


--
-- Name: research_procedures_researchscholar; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_researchscholar (
    id bigint NOT NULL,
    enrollment_date date NOT NULL,
    expected_completion date,
    fellowship_type character varying(50),
    fellowship_amount numeric(10,2),
    fellowship_start_date date,
    fellowship_end_date date,
    progress_status character varying(20) NOT NULL,
    coursework_completed boolean NOT NULL,
    coursework_completion_date date,
    comprehensive_exam_passed boolean NOT NULL,
    comprehensive_exam_date date,
    comprehensive_exam_score numeric(5,2),
    synopsis_submitted boolean NOT NULL,
    synopsis_date date,
    synopsis_approved boolean NOT NULL,
    synopsis_approval_date date,
    thesis_submitted boolean NOT NULL,
    thesis_submission_date date,
    thesis_title character varying(500),
    defense_date date,
    defense_result character varying(50),
    degree_awarded_date date,
    publications_count integer NOT NULL,
    patents_count integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    student_id character varying(20)
);


ALTER TABLE public.research_procedures_researchscholar OWNER TO fusion_admin;

--
-- Name: research_procedures_researchscholar_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_researchscholar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_researchscholar_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_researchscholar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_researchscholar_id_seq OWNED BY public.research_procedures_researchscholar.id;


--
-- Name: research_procedures_sponsoredproject; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_sponsoredproject (
    id bigint NOT NULL,
    title character varying(500) NOT NULL,
    project_number character varying(50) NOT NULL,
    description text NOT NULL,
    sanctioned_amount numeric(15,2) NOT NULL,
    utilized_amount numeric(15,2) NOT NULL,
    currency character varying(3) NOT NULL,
    submission_date date,
    sanction_date date,
    start_date date,
    finish_date date,
    original_end_date date,
    extended_end_date date,
    actual_end_date date,
    duration_months integer,
    status character varying(30) NOT NULL,
    proposal_document character varying(100),
    sanction_letter character varying(100),
    completion_report character varying(100),
    pf_no integer,
    ptype character varying(100),
    pi character varying(1000),
    co_pi character varying(1500),
    financial_outlay character varying(150),
    notes text,
    date_entry date,
    date_submission date,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    funding_agency_id bigint,
    principal_investigator_id character varying(20),
    research_area_id bigint,
    research_group_id bigint,
    user_id integer
);


ALTER TABLE public.research_procedures_sponsoredproject OWNER TO fusion_admin;

--
-- Name: research_procedures_sponsoredproject_co_principal_investigators; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_sponsoredproject_co_principal_investigators (
    id integer NOT NULL,
    sponsoredproject_id bigint NOT NULL,
    faculty_id character varying(20) NOT NULL
);


ALTER TABLE public.research_procedures_sponsoredproject_co_principal_investigators OWNER TO fusion_admin;

--
-- Name: research_procedures_sponsoredproject_co_principal_invest_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_sponsoredproject_co_principal_invest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_sponsoredproject_co_principal_invest_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_sponsoredproject_co_principal_invest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_sponsoredproject_co_principal_invest_id_seq OWNED BY public.research_procedures_sponsoredproject_co_principal_investigators.id;


--
-- Name: research_procedures_sponsoredproject_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_sponsoredproject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_sponsoredproject_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_sponsoredproject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_sponsoredproject_id_seq OWNED BY public.research_procedures_sponsoredproject.id;


--
-- Name: research_procedures_sponsoredproject_research_scholars; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_sponsoredproject_research_scholars (
    id integer NOT NULL,
    sponsoredproject_id bigint NOT NULL,
    student_id character varying(20) NOT NULL
);


ALTER TABLE public.research_procedures_sponsoredproject_research_scholars OWNER TO fusion_admin;

--
-- Name: research_procedures_sponsoredproject_research_scholars_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_sponsoredproject_research_scholars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_sponsoredproject_research_scholars_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_sponsoredproject_research_scholars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_sponsoredproject_research_scholars_id_seq OWNED BY public.research_procedures_sponsoredproject_research_scholars.id;


--
-- Name: research_procedures_techtransfer; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.research_procedures_techtransfer (
    id bigint NOT NULL,
    pf_no integer NOT NULL,
    details character varying(500) NOT NULL,
    date_entry date,
    start_date date,
    end_date date,
    user_id integer
);


ALTER TABLE public.research_procedures_techtransfer OWNER TO fusion_admin;

--
-- Name: research_procedures_techtransfer_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.research_procedures_techtransfer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.research_procedures_techtransfer_id_seq OWNER TO fusion_admin;

--
-- Name: research_procedures_techtransfer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.research_procedures_techtransfer_id_seq OWNED BY public.research_procedures_techtransfer.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO fusion_admin;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO fusion_admin;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO fusion_admin;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO fusion_admin;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO fusion_admin;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO fusion_admin;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO fusion_admin;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO fusion_admin;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: student_password_history; Type: TABLE; Schema: public; Owner: fusion_admin
--

CREATE TABLE public.student_password_history (
    id integer NOT NULL,
    password_hash character varying(128) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    is_initial_password boolean NOT NULL,
    is_active boolean NOT NULL,
    password_changed_at timestamp with time zone,
    change_reason character varying(100),
    created_by_id integer,
    student_id integer NOT NULL
);


ALTER TABLE public.student_password_history OWNER TO fusion_admin;

--
-- Name: student_password_history_id_seq; Type: SEQUENCE; Schema: public; Owner: fusion_admin
--

CREATE SEQUENCE public.student_password_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_password_history_id_seq OWNER TO fusion_admin;

--
-- Name: student_password_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fusion_admin
--

ALTER SEQUENCE public.student_password_history_id_seq OWNED BY public.student_password_history.id;


--
-- Name: Bonafide id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Bonafide" ALTER COLUMN id SET DEFAULT nextval('public."Bonafide_id_seq"'::regclass);


--
-- Name: Calendar id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Calendar" ALTER COLUMN id SET DEFAULT nextval('public."Calendar_id_seq"'::regclass);


--
-- Name: Course id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Course" ALTER COLUMN id SET DEFAULT nextval('public."Course_id_seq"'::regclass);


--
-- Name: CourseRequested id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."CourseRequested" ALTER COLUMN id SET DEFAULT nextval('public."CourseRequested_id_seq"'::regclass);


--
-- Name: Curriculum curriculum_id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Curriculum" ALTER COLUMN curriculum_id SET DEFAULT nextval('public."Curriculum_curriculum_id_seq"'::regclass);


--
-- Name: Curriculum_Instructor id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Curriculum_Instructor" ALTER COLUMN id SET DEFAULT nextval('public."Curriculum_Instructor_id_seq"'::regclass);


--
-- Name: Dues id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Dues" ALTER COLUMN id SET DEFAULT nextval('public."Dues_id_seq"'::regclass);


--
-- Name: Exam_Timetable id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Exam_Timetable" ALTER COLUMN id SET DEFAULT nextval('public."Exam_Timetable_id_seq"'::regclass);


--
-- Name: FeePayments id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FeePayments" ALTER COLUMN id SET DEFAULT nextval('public."FeePayments_id_seq"'::regclass);


--
-- Name: FinalRegistration id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FinalRegistration" ALTER COLUMN id SET DEFAULT nextval('public."FinalRegistration_id_seq"'::regclass);


--
-- Name: FinalRegistrations id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FinalRegistrations" ALTER COLUMN id SET DEFAULT nextval('public."FinalRegistrations_id_seq"'::regclass);


--
-- Name: Grades id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Grades" ALTER COLUMN id SET DEFAULT nextval('public."Grades_id_seq"'::regclass);


--
-- Name: Holiday id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Holiday" ALTER COLUMN id SET DEFAULT nextval('public."Holiday_id_seq"'::regclass);


--
-- Name: InitialRegistration id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistration" ALTER COLUMN id SET DEFAULT nextval('public."InitialRegistration_id_seq"'::regclass);


--
-- Name: InitialRegistrations id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistrations" ALTER COLUMN id SET DEFAULT nextval('public."InitialRegistrations_id_seq"'::regclass);


--
-- Name: MarkSubmissionCheck id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."MarkSubmissionCheck" ALTER COLUMN id SET DEFAULT nextval('public."MarkSubmissionCheck_id_seq"'::regclass);


--
-- Name: Meeting id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Meeting" ALTER COLUMN id SET DEFAULT nextval('public."Meeting_id_seq"'::regclass);


--
-- Name: Register id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Register" ALTER COLUMN id SET DEFAULT nextval('public."Register_id_seq"'::regclass);


--
-- Name: SemesterMarks id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."SemesterMarks" ALTER COLUMN id SET DEFAULT nextval('public."SemesterMarks_id_seq"'::regclass);


--
-- Name: Spi id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Spi" ALTER COLUMN id SET DEFAULT nextval('public."Spi_id_seq"'::regclass);


--
-- Name: StudentRegistrationCheck id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."StudentRegistrationCheck" ALTER COLUMN id SET DEFAULT nextval('public."StudentRegistrationCheck_id_seq"'::regclass);


--
-- Name: StudentRegistrationChecks id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."StudentRegistrationChecks" ALTER COLUMN id SET DEFAULT nextval('public."StudentRegistrationChecks_id_seq"'::regclass);


--
-- Name: Student_attendance id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Student_attendance" ALTER COLUMN id SET DEFAULT nextval('public."Student_attendance_id_seq"'::regclass);


--
-- Name: TeachingCreditRegistration id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."TeachingCreditRegistration" ALTER COLUMN id SET DEFAULT nextval('public."TeachingCreditRegistration_id_seq"'::regclass);


--
-- Name: Thesis id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Thesis" ALTER COLUMN id SET DEFAULT nextval('public."Thesis_id_seq"'::regclass);


--
-- Name: ThesisTopicProcess id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."ThesisTopicProcess" ALTER COLUMN id SET DEFAULT nextval('public."ThesisTopicProcess_id_seq"'::regclass);


--
-- Name: Timetable id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Timetable" ALTER COLUMN id SET DEFAULT nextval('public."Timetable_id_seq"'::regclass);


--
-- Name: academic_procedures_assignment id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_assignment ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_assignment_id_seq'::regclass);


--
-- Name: academic_procedures_assistantship_status id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_assistantship_status ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_assistantship_status_id_seq'::regclass);


--
-- Name: academic_procedures_assistantshipclaim id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_assistantshipclaim ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_assistantshipclaim_id_seq'::regclass);


--
-- Name: academic_procedures_backlog_course id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_backlog_course ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_backlog_course_id_seq'::regclass);


--
-- Name: academic_procedures_batchchangehistory id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_batchchangehistory ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_batchchangehistory_id_seq'::regclass);


--
-- Name: academic_procedures_branchchange c_id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_branchchange ALTER COLUMN c_id SET DEFAULT nextval('public.academic_procedures_branchchange_c_id_seq'::regclass);


--
-- Name: academic_procedures_courseaddrequest id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_courseaddrequest ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_courseaddrequest_id_seq'::regclass);


--
-- Name: academic_procedures_coursedroprequest id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursedroprequest ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_coursedroprequest_id_seq'::regclass);


--
-- Name: academic_procedures_coursereplacementrequest id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursereplacementrequest ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_coursereplacementrequest_id_seq'::regclass);


--
-- Name: academic_procedures_coursesmtech id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursesmtech ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_coursesmtech_id_seq'::regclass);


--
-- Name: academic_procedures_feedbackfilled id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackfilled ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_feedbackfilled_id_seq'::regclass);


--
-- Name: academic_procedures_feedbackoption id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackoption ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_feedbackoption_id_seq'::regclass);


--
-- Name: academic_procedures_feedbackquestion id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackquestion ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_feedbackquestion_id_seq'::regclass);


--
-- Name: academic_procedures_feedbackresponse id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackresponse ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_feedbackresponse_id_seq'::regclass);


--
-- Name: academic_procedures_feepayment id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feepayment ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_feepayment_id_seq'::regclass);


--
-- Name: academic_procedures_messdue id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_messdue ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_messdue_id_seq'::regclass);


--
-- Name: academic_procedures_minimumcredits id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_minimumcredits ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_minimumcredits_id_seq'::regclass);


--
-- Name: academic_procedures_mtechgraduateseminarreport id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_mtechgraduateseminarreport ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_mtechgraduateseminarreport_id_seq'::regclass);


--
-- Name: academic_procedures_phdprogressexamination id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_phdprogressexamination ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_phdprogressexamination_id_seq'::regclass);


--
-- Name: academic_procedures_stipendrequest id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_stipendrequest ALTER COLUMN id SET DEFAULT nextval('public.academic_procedures_stipendrequest_id_seq'::regclass);


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: bulk_password_email_operation id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.bulk_password_email_operation ALTER COLUMN id SET DEFAULT nextval('public.bulk_password_email_operation_id_seq'::regclass);


--
-- Name: course_registration id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.course_registration ALTER COLUMN id SET DEFAULT nextval('public.course_registration_id_seq'::regclass);


--
-- Name: course_replacement id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.course_replacement ALTER COLUMN id SET DEFAULT nextval('public.course_replacement_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: email_template id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.email_template ALTER COLUMN id SET DEFAULT nextval('public.email_template_id_seq'::regclass);


--
-- Name: globals_departmentinfo id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_departmentinfo ALTER COLUMN id SET DEFAULT nextval('public.globals_departmentinfo_id_seq'::regclass);


--
-- Name: globals_designation id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_designation ALTER COLUMN id SET DEFAULT nextval('public.globals_designation_id_seq'::regclass);


--
-- Name: globals_feedback id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_feedback ALTER COLUMN id SET DEFAULT nextval('public.globals_feedback_id_seq'::regclass);


--
-- Name: globals_holdsdesignation id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_holdsdesignation ALTER COLUMN id SET DEFAULT nextval('public.globals_holdsdesignation_id_seq'::regclass);


--
-- Name: globals_issue id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue ALTER COLUMN id SET DEFAULT nextval('public.globals_issue_id_seq'::regclass);


--
-- Name: globals_issue_images id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue_images ALTER COLUMN id SET DEFAULT nextval('public.globals_issue_images_id_seq'::regclass);


--
-- Name: globals_issue_support id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue_support ALTER COLUMN id SET DEFAULT nextval('public.globals_issue_support_id_seq'::regclass);


--
-- Name: globals_issueimage id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issueimage ALTER COLUMN id SET DEFAULT nextval('public.globals_issueimage_id_seq'::regclass);


--
-- Name: globals_moduleaccess id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_moduleaccess ALTER COLUMN id SET DEFAULT nextval('public.globals_moduleaccess_id_seq'::regclass);


--
-- Name: globals_passwordresettracker id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_passwordresettracker ALTER COLUMN id SET DEFAULT nextval('public.globals_passwordresettracker_id_seq'::regclass);


--
-- Name: notifications_notification id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.notifications_notification ALTER COLUMN id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);


--
-- Name: password_email_log id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.password_email_log ALTER COLUMN id SET DEFAULT nextval('public.password_email_log_id_seq'::regclass);


--
-- Name: programme_curriculum_batch id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_batch ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_batch_id_seq'::regclass);


--
-- Name: programme_curriculum_batchconfiguration id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_batchconfiguration ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_batchconfiguration_id_seq'::regclass);


--
-- Name: programme_curriculum_course id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_course_id_seq'::regclass);


--
-- Name: programme_curriculum_course_disciplines id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course_disciplines ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_course_disciplines_id_seq'::regclass);


--
-- Name: programme_curriculum_course_pre_requisit_courses id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course_pre_requisit_courses ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_course_pre_requisit_courses_id_seq'::regclass);


--
-- Name: programme_curriculum_courseauditlog id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseauditlog ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_courseauditlog_id_seq'::regclass);


--
-- Name: programme_curriculum_courseinstructor id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseinstructor ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_courseinstructor_id_seq'::regclass);


--
-- Name: programme_curriculum_courseslot id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseslot ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_courseslot_id_seq'::regclass);


--
-- Name: programme_curriculum_courseslot_courses id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseslot_courses ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_courseslot_courses_id_seq'::regclass);


--
-- Name: programme_curriculum_curriculum id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_curriculum ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_curriculum_id_seq'::regclass);


--
-- Name: programme_curriculum_discipline id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_discipline ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_discipline_id_seq'::regclass);


--
-- Name: programme_curriculum_discipline_programmes id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_discipline_programmes ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_discipline_programmes_id_seq'::regclass);


--
-- Name: programme_curriculum_newproposalfile id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_newproposalfile ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_newproposalfile_id_seq'::regclass);


--
-- Name: programme_curriculum_newproposalfile_pre_requisit_courses id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_newproposalfile_pre_requisit_courses ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_newproposalfile_pre_requisit_course_id_seq'::regclass);


--
-- Name: programme_curriculum_programme id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_programme ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_programme_id_seq'::regclass);


--
-- Name: programme_curriculum_proposal_tracking id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_proposal_tracking ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_proposal_tracking_id_seq'::regclass);


--
-- Name: programme_curriculum_semester id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_semester ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_semester_id_seq'::regclass);


--
-- Name: programme_curriculum_studentbatchupload id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_studentbatchupload ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_studentbatchupload_id_seq'::regclass);


--
-- Name: programme_curriculum_studentstatuslog id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_studentstatuslog ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_studentstatuslog_id_seq'::regclass);


--
-- Name: programme_curriculum_uploadhistory id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_uploadhistory ALTER COLUMN id SET DEFAULT nextval('public.programme_curriculum_uploadhistory_id_seq'::regclass);


--
-- Name: research_procedures_consultancyproject id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_consultancyproject ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_consultancyproject_id_seq'::regclass);


--
-- Name: research_procedures_consultancyproject_co_consultants id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_consultancyproject_co_consultants ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_consultancyproject_co_consultants_id_seq'::regclass);


--
-- Name: research_procedures_fundingagency id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_fundingagency ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_fundingagency_id_seq'::regclass);


--
-- Name: research_procedures_patent application_id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent ALTER COLUMN application_id SET DEFAULT nextval('public.research_procedures_patent_application_id_seq'::regclass);


--
-- Name: research_procedures_patent_faculty_inventors id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent_faculty_inventors ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_patent_faculty_inventors_id_seq'::regclass);


--
-- Name: research_procedures_patent_student_inventors id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent_student_inventors ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_patent_student_inventors_id_seq'::regclass);


--
-- Name: research_procedures_patentstatusnotification id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patentstatusnotification ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_patentstatusnotification_id_seq'::regclass);


--
-- Name: research_procedures_projectexpenditure id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_projectexpenditure ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_projectexpenditure_id_seq'::regclass);


--
-- Name: research_procedures_projectmilestone id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_projectmilestone ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_projectmilestone_id_seq'::regclass);


--
-- Name: research_procedures_projectreport id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_projectreport ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_projectreport_id_seq'::regclass);


--
-- Name: research_procedures_publication id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_publication_id_seq'::regclass);


--
-- Name: research_procedures_publication_faculty_authors id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication_faculty_authors ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_publication_faculty_authors_id_seq'::regclass);


--
-- Name: research_procedures_publication_student_authors id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication_student_authors ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_publication_student_authors_id_seq'::regclass);


--
-- Name: research_procedures_researcharea id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researcharea ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_researcharea_id_seq'::regclass);


--
-- Name: research_procedures_researcharea_faculty_experts id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researcharea_faculty_experts ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_researcharea_faculty_experts_id_seq'::regclass);


--
-- Name: research_procedures_researchgroup id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_researchgroup_id_seq'::regclass);


--
-- Name: research_procedures_researchgroup_faculty_under_group id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_faculty_under_group ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_researchgroup_faculty_under_group_id_seq'::regclass);


--
-- Name: research_procedures_researchgroup_members id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_members ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_researchgroup_members_id_seq'::regclass);


--
-- Name: research_procedures_researchgroup_students_under_group id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_students_under_group ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_researchgroup_students_under_group_id_seq'::regclass);


--
-- Name: research_procedures_researchproject id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchproject ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_researchproject_id_seq'::regclass);


--
-- Name: research_procedures_researchscholar id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchscholar ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_researchscholar_id_seq'::regclass);


--
-- Name: research_procedures_sponsoredproject id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_sponsoredproject_id_seq'::regclass);


--
-- Name: research_procedures_sponsoredproject_co_principal_investigators id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject_co_principal_investigators ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_sponsoredproject_co_principal_invest_id_seq'::regclass);


--
-- Name: research_procedures_sponsoredproject_research_scholars id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject_research_scholars ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_sponsoredproject_research_scholars_id_seq'::regclass);


--
-- Name: research_procedures_techtransfer id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_techtransfer ALTER COLUMN id SET DEFAULT nextval('public.research_procedures_techtransfer_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: student_password_history id; Type: DEFAULT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.student_password_history ALTER COLUMN id SET DEFAULT nextval('public.student_password_history_id_seq'::regclass);


--
-- Data for Name: Bonafide; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Bonafide" (id, student_name, purpose, academic_year, enrolled_course, complaint_date, student_id_id) FROM stdin;
\.


--
-- Data for Name: Calendar; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Calendar" (id, from_date, to_date, description) FROM stdin;
\.


--
-- Data for Name: Course; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Course" (id, course_name, course_details) FROM stdin;
\.


--
-- Data for Name: CourseRequested; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."CourseRequested" (id, course_id_id, student_id_id) FROM stdin;
\.


--
-- Data for Name: Curriculum; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Curriculum" (curriculum_id, course_code, credits, course_type, programme, branch, batch, sem, optional, floated, course_id_id) FROM stdin;
\.


--
-- Data for Name: Curriculum_Instructor; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Curriculum_Instructor" (id, chief_inst, curriculum_id_id, instructor_id_id) FROM stdin;
\.


--
-- Data for Name: Dues; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Dues" (id, mess_due, hostel_due, library_due, placement_cell_due, academic_due, student_id_id) FROM stdin;
\.


--
-- Data for Name: Exam_Timetable; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Exam_Timetable" (id, upload_date, exam_time_table, batch, programme) FROM stdin;
\.


--
-- Data for Name: FeePayments; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."FeePayments" (id, mode, transaction_id, fee_receipt, deposit_date, utr_number, fee_paid, reason, actual_fee, semester_id_id, student_id_id) FROM stdin;
\.


--
-- Data for Name: FinalRegistration; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."FinalRegistration" (id, verified, course_id_id, course_slot_id_id, semester_id_id, student_id_id, registration_type, old_course_registration_id) FROM stdin;
\.


--
-- Data for Name: FinalRegistrations; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."FinalRegistrations" (id, semester, batch, verified, curr_id_id, student_id_id) FROM stdin;
\.


--
-- Data for Name: Grades; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Grades" (id, grade, verify, curriculum_id_id, student_id_id) FROM stdin;
\.


--
-- Data for Name: Holiday; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Holiday" (id, holiday_date, holiday_name, holiday_type) FROM stdin;
\.


--
-- Data for Name: InitialRegistration; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."InitialRegistration" (id, "timestamp", priority, course_id_id, course_slot_id_id, semester_id_id, student_id_id, registration_type, old_course_registration_id) FROM stdin;
\.


--
-- Data for Name: InitialRegistrations; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."InitialRegistrations" (id, "timestamp", priority, course_id_id, course_slot_id_id, semester_id_id, student_id_id) FROM stdin;
\.


--
-- Data for Name: MarkSubmissionCheck; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."MarkSubmissionCheck" (id, verified, submitted, announced, curr_id_id) FROM stdin;
\.


--
-- Data for Name: Meeting; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Meeting" (id, venue, date, "time", agenda, minutes_file) FROM stdin;
\.


--
-- Data for Name: Register; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Register" (id, year, semester, curr_id_id, student_id_id) FROM stdin;
\.


--
-- Data for Name: SemesterMarks; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."SemesterMarks" (id, q1, mid_term, q2, end_term, other, grade, curr_id_id, student_id_id) FROM stdin;
\.


--
-- Data for Name: Spi; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Spi" (id, sem, spi, student_id_id) FROM stdin;
\.


--
-- Data for Name: StudentRegistrationCheck; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."StudentRegistrationCheck" (id, pre_registration_flag, final_registration_flag, semester, student_id) FROM stdin;
\.


--
-- Data for Name: StudentRegistrationChecks; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."StudentRegistrationChecks" (id, pre_registration_flag, final_registration_flag, semester_id_id, student_id_id) FROM stdin;
\.


--
-- Data for Name: Student_attendance; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Student_attendance" (id, date, present, instructor_id_id, student_id_id) FROM stdin;
\.


--
-- Data for Name: TeachingCreditRegistration; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."TeachingCreditRegistration" (id, req_pending, course_completion, approved_course_id, curr_1_id, curr_2_id, curr_3_id, curr_4_id, student_id_id, supervisor_id_id) FROM stdin;
\.


--
-- Data for Name: Thesis; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Thesis" (id, topic, reg_id_id, student_id_id, supervisor_id_id) FROM stdin;
\.


--
-- Data for Name: ThesisTopicProcess; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."ThesisTopicProcess" (id, research_area, thesis_topic, submission_by_student, pending_supervisor, approval_supervisor, forwarded_to_hod, pending_hod, approval_by_hod, date, co_supervisor_id_id, curr_id_id, member1_id, member2_id, member3_id, student_id_id, supervisor_id_id) FROM stdin;
\.


--
-- Data for Name: Timetable; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public."Timetable" (id, upload_date, time_table, batch, programme, branch) FROM stdin;
\.


--
-- Data for Name: academic_information_student; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_information_student (id_id, programme, batch, cpi, category, father_name, mother_name, hall_no, room_no, specialization, curr_semester_no, batch_id_id) FROM stdin;
S3c057d8c	PhD	2016	0	GEN			0	\N		1	\N
Sd6c9682c	PhD	2016	0	GEN			0	\N		1	\N
\.


--
-- Data for Name: academic_procedures_assignment; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_assignment (id, start_year, start_month, end_year, end_month, faculty_id, ta_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_assistantship_status; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_assistantship_status (id, student_status, hod_status, account_status) FROM stdin;
\.


--
-- Data for Name: academic_procedures_assistantshipclaim; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_assistantshipclaim (id, date, month, year, bank_account, applicability, ta_supervisor_remark, thesis_supervisor_remark, hod_approval, acad_approval, account_approval, stipend, student_id, ta_supervisor_id, thesis_supervisor_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_backlog_course; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_backlog_course (id, is_summer_course, course_id_id, semester_id_id, student_id_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_batchchangehistory; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_batchchangehistory (id, changed_at, new_batch_id, old_batch_id, student_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_branchchange; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_branchchange (c_id, applied_date, branches_id, user_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_courseaddrequest; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_courseaddrequest (id, academic_year, semester_type, status, created_at, processed_at, course_id, course_slot_id, student_id, old_course_registration_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_coursedroprequest; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_coursedroprequest (id, academic_year, semester_type, status, created_at, processed_at, course_id, course_slot_id, student_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_coursereplacementrequest; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_coursereplacementrequest (id, academic_year, semester_type, status, created_at, processed_at, course_slot_id, new_course_id, old_course_id, student_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_coursesmtech; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_coursesmtech (id, specialization, c_id_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_feedbackfilled; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_feedbackfilled (id, semester_no, filled_at, student_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_feedbackoption; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_feedbackoption (id, text, "order", question_id) FROM stdin;
1	None	1	1
2	Less than 5	2	1
3	Between 5 - 10	3	1
4	Between 10 - 15	4	1
5	More than 15	5	1
6	Excellent	1	2
7	Good	2	2
8	Average	3	2
9	Poor	4	2
10	Excellent	1	3
11	Good	2	3
12	Average	3	3
13	Poor	4	3
14	Excellent	1	4
15	Good	2	4
16	Average	3	4
17	Poor	4	4
18	Excellent	1	5
19	Good	2	5
20	Average	3	5
21	Poor	4	5
22	< 80%	1	7
23	80% - 90%	2	7
24	90% - 95%	3	7
25	95% - 100%	4	7
26	< 80%	1	8
27	80% - 90%	2	8
28	90% - 95%	3	8
29	95% - 100%	4	8
30	< 80%	1	9
31	80% - 90%	2	9
32	90% - 95%	3	9
33	95% - 100%	4	9
34	< 80%	1	10
35	80% - 90%	2	10
36	90% - 95%	3	10
37	95% - 100%	4	10
38	Excellent	1	11
39	Good	2	11
40	Average	3	11
41	Poor	4	11
42	Excellent	1	12
43	Good	2	12
44	Average	3	12
45	Poor	4	12
46	Excellent	1	13
47	Good	2	13
48	Average	3	13
49	Poor	4	13
50	Excellent	1	14
51	Good	2	14
52	Average	3	14
53	Poor	4	14
54	Excellent	1	15
55	Good	2	15
56	Average	3	15
57	Poor	4	15
58	Excellent	1	16
59	Good	2	16
60	Average	3	16
61	Poor	4	16
62	Excellent	1	18
63	Good	2	18
64	Average	3	18
65	Poor	4	18
66	Excellent	1	19
67	Good	2	19
68	Average	3	19
69	Poor	4	19
70	Excellent	1	20
71	Good	2	20
72	Average	3	20
73	Poor	4	20
74	Excellent	1	21
75	Good	2	21
76	Average	3	21
77	Poor	4	21
78	Excellent	1	22
79	Good	2	22
80	Average	3	22
81	Poor	4	22
82	Excellent	1	23
83	Good	2	23
84	Average	3	23
85	Poor	4	23
86	Less than 5 lab	1	25
87	5 to 10 lab	2	25
88	More than 10 lab	3	25
89	Not present any lab	4	25
90	Excellent	1	26
91	Good	2	26
92	Average	3	26
93	Poor	4	26
94	Excellent	1	27
95	Good	2	27
96	Average	3	27
97	Poor	4	27
98	Excellent	1	28
99	Good	2	28
100	Average	3	28
101	Poor	4	28
\.


--
-- Data for Name: academic_procedures_feedbackquestion; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_feedbackquestion (id, section, text, "order") FROM stdin;
1	attendance	Number of classes you missed	1
2	contents	Amount of materials covered in this course was just right	1
3	contents	Texts/Reference material/Class notes were easily available	2
4	contents	Learning material was relevant and well organized	3
5	contents	All the contents were covered	4
6	contents	Any Suggestion Regarding Course Contents [Overall]	5
7	instructor	Number of classes actually engaged by the instructor	1
8	instructor	Instructor was punctual in coming to the classes	2
9	instructor	Duration of most of the classes was as per schedule	3
10	instructor	All the allocated classes were held on scheduled time and duration	4
11	instructor	Topics were covered in a logical sequence with even pace.	5
12	instructor	Effective use of teaching aids (Board work/ Presentation/ Audio-Visual aids)	6
13	instructor	Evaluation schema (Quizzes/ exams/  Assignments) Covered the entire course material.	7
14	instructor	The evaluation Assignments/ Quizzes etc. was done fairly and on time.	8
15	instructor	The questions raised in the class were satisfactorily answered.	9
16	instructor	The Overall effectiveness of the instructor	10
17	instructor	Strengths and Weaknesses of the Instructor	11
18	tutorial	The Tutorials helped in better understanding of the course.	1
19	tutorial	All allocated tutorials were conducted.	2
20	tutorial	Doubts were clarified effectively.	3
21	tutorial	Questions were encouraged.	4
22	tutorial	The evaluation of Assignment/ Quizzes etc was done fairly and on time.	5
23	tutorial	Overall the tutor was effective.	6
24	tutorial	Any Constructive Suggestion for Improving the Tutorials	7
25	lab	Course Instructor present in the lab	1
26	lab	Equipment's available in the laboratory were functioning.	2
27	lab	Lab Instructor ensured the smooth conduct of experiments.	3
28	lab	Laboratory reports were corrected weekly and in time	4
\.


--
-- Data for Name: academic_procedures_feedbackresponse; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_feedbackresponse (id, text_answer, section, session, semester_type, submitted_at, course_id, option_id, question_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_feepayment; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_feepayment (id, semester, batch, mode, transaction_id, student_id_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_messdue; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_messdue (id, month, year, description, amount, remaining_amount, student_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_minimumcredits; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_minimumcredits (id, semester, credits) FROM stdin;
\.


--
-- Data for Name: academic_procedures_mtechgraduateseminarreport; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_mtechgraduateseminarreport (id, theme_of_work, date, place, "time", work_done_till_previous_sem, specific_contri_in_cur_sem, future_plan, brief_report, publication_submitted, publication_accepted, paper_presented, papers_under_review, quality_of_work, quantity_of_work, "Overall_grade", panel_report, suggestion, student_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_phdprogressexamination; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_phdprogressexamination (id, theme, seminar_date_time, place, work_done, specific_contri_curr_semester, future_plan, details, papers_published, presented_papers, papers_submitted, quality_of_work, quantity_of_work, "Overall_grade", completion_period, panel_report, continuation_enhancement_assistantship, enhancement_assistantship, annual_progress_seminar, commments, student_id) FROM stdin;
\.


--
-- Data for Name: academic_procedures_stipendrequest; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.academic_procedures_stipendrequest (id, year, month, status, faculty_remark, hod_remark, assignment_id) FROM stdin;
\.


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add user	3	add_user
10	Can change user	3	change_user
11	Can delete user	3	delete_user
12	Can view user	3	view_user
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add site	5	add_site
18	Can change site	5	change_site
19	Can delete site	5	delete_site
20	Can view site	5	view_site
21	Can add calendar	6	add_calendar
22	Can change calendar	6	change_calendar
23	Can delete calendar	6	delete_calendar
24	Can view calendar	6	view_calendar
25	Can add course	7	add_course
26	Can change course	7	change_course
27	Can delete course	7	delete_course
28	Can view course	7	view_course
29	Can add curriculum	8	add_curriculum
30	Can change curriculum	8	change_curriculum
31	Can delete curriculum	8	delete_curriculum
32	Can view curriculum	8	view_curriculum
33	Can add curriculum_ instructor	9	add_curriculum_instructor
34	Can change curriculum_ instructor	9	change_curriculum_instructor
35	Can delete curriculum_ instructor	9	delete_curriculum_instructor
36	Can view curriculum_ instructor	9	view_curriculum_instructor
37	Can add exam_timetable	10	add_exam_timetable
38	Can change exam_timetable	10	change_exam_timetable
39	Can delete exam_timetable	10	delete_exam_timetable
40	Can view exam_timetable	10	view_exam_timetable
41	Can add holiday	11	add_holiday
42	Can change holiday	11	change_holiday
43	Can delete holiday	11	delete_holiday
44	Can view holiday	11	view_holiday
45	Can add meeting	12	add_meeting
46	Can change meeting	12	change_meeting
47	Can delete meeting	12	delete_meeting
48	Can view meeting	12	view_meeting
49	Can add student	13	add_student
50	Can change student	13	change_student
51	Can delete student	13	delete_student
52	Can view student	13	view_student
53	Can add timetable	14	add_timetable
54	Can change timetable	14	change_timetable
55	Can delete timetable	14	delete_timetable
56	Can view timetable	14	view_timetable
57	Can add student_attendance	15	add_student_attendance
58	Can change student_attendance	15	change_student_attendance
59	Can delete student_attendance	15	delete_student_attendance
60	Can view student_attendance	15	view_student_attendance
61	Can add grades	16	add_grades
62	Can change grades	16	change_grades
63	Can delete grades	16	delete_grades
64	Can view grades	16	view_grades
65	Can add spi	17	add_spi
66	Can change spi	17	change_spi
67	Can delete spi	17	delete_spi
68	Can view spi	17	view_spi
69	Can add department info	18	add_departmentinfo
70	Can change department info	18	change_departmentinfo
71	Can delete department info	18	delete_departmentinfo
72	Can view department info	18	view_departmentinfo
73	Can add designation	19	add_designation
74	Can change designation	19	change_designation
75	Can delete designation	19	delete_designation
76	Can view designation	19	view_designation
77	Can add extra info	20	add_extrainfo
78	Can change extra info	20	change_extrainfo
79	Can delete extra info	20	delete_extrainfo
80	Can view extra info	20	view_extrainfo
81	Can add faculty	21	add_faculty
82	Can change faculty	21	change_faculty
83	Can delete faculty	21	delete_faculty
84	Can view faculty	21	view_faculty
85	Can add staff	22	add_staff
86	Can change staff	22	change_staff
87	Can delete staff	22	delete_staff
88	Can view staff	22	view_staff
89	Can add issue image	23	add_issueimage
90	Can change issue image	23	change_issueimage
91	Can delete issue image	23	delete_issueimage
92	Can view issue image	23	view_issueimage
93	Can add issue	24	add_issue
94	Can change issue	24	change_issue
95	Can delete issue	24	delete_issue
96	Can view issue	24	view_issue
97	Can add feedback	25	add_feedback
98	Can change feedback	25	change_feedback
99	Can delete feedback	25	delete_feedback
100	Can view feedback	25	view_feedback
101	Can add holds designation	26	add_holdsdesignation
102	Can change holds designation	26	change_holdsdesignation
103	Can delete holds designation	26	delete_holdsdesignation
104	Can view holds designation	26	view_holdsdesignation
105	Can add module access	27	add_moduleaccess
106	Can change module access	27	change_moduleaccess
107	Can delete module access	27	delete_moduleaccess
108	Can view module access	27	view_moduleaccess
109	Can add password reset tracker	28	add_passwordresettracker
110	Can change password reset tracker	28	change_passwordresettracker
111	Can delete password reset tracker	28	delete_passwordresettracker
112	Can view password reset tracker	28	view_passwordresettracker
113	Can add curriculum	29	add_curriculum
114	Can change curriculum	29	change_curriculum
115	Can delete curriculum	29	delete_curriculum
116	Can view curriculum	29	view_curriculum
117	Can add programme	30	add_programme
118	Can change programme	30	change_programme
119	Can delete programme	30	delete_programme
120	Can view programme	30	view_programme
121	Can add semester	31	add_semester
122	Can change semester	31	change_semester
123	Can delete semester	31	delete_semester
124	Can view semester	31	view_semester
125	Can add discipline	32	add_discipline
126	Can change discipline	32	change_discipline
127	Can delete discipline	32	delete_discipline
128	Can view discipline	32	view_discipline
129	Can add course	33	add_course
130	Can change course	33	change_course
131	Can delete course	33	delete_course
132	Can view course	33	view_course
133	Can add batch	34	add_batch
134	Can change batch	34	change_batch
135	Can delete batch	34	delete_batch
136	Can view batch	34	view_batch
137	Can add proposal_ tracking	35	add_proposal_tracking
138	Can change proposal_ tracking	35	change_proposal_tracking
139	Can delete proposal_ tracking	35	delete_proposal_tracking
140	Can view proposal_ tracking	35	view_proposal_tracking
141	Can add new proposal file	36	add_newproposalfile
142	Can change new proposal file	36	change_newproposalfile
143	Can delete new proposal file	36	delete_newproposalfile
144	Can view new proposal file	36	view_newproposalfile
145	Can add course slot	37	add_courseslot
146	Can change course slot	37	change_courseslot
147	Can delete course slot	37	delete_courseslot
148	Can view course slot	37	view_courseslot
149	Can add course instructor	38	add_courseinstructor
150	Can change course instructor	38	change_courseinstructor
151	Can delete course instructor	38	delete_courseinstructor
152	Can view course instructor	38	view_courseinstructor
153	Can add Student Batch Upload	39	add_studentbatchupload
154	Can change Student Batch Upload	39	change_studentbatchupload
155	Can delete Student Batch Upload	39	delete_studentbatchupload
156	Can view Student Batch Upload	39	view_studentbatchupload
157	Can add Upload History	40	add_uploadhistory
158	Can change Upload History	40	change_uploadhistory
159	Can delete Upload History	40	delete_uploadhistory
160	Can view Upload History	40	view_uploadhistory
161	Can add Student Status Log	41	add_studentstatuslog
162	Can change Student Status Log	41	change_studentstatuslog
163	Can delete Student Status Log	41	delete_studentstatuslog
164	Can view Student Status Log	41	view_studentstatuslog
165	Can add Batch Configuration	42	add_batchconfiguration
166	Can change Batch Configuration	42	change_batchconfiguration
167	Can delete Batch Configuration	42	delete_batchconfiguration
168	Can view Batch Configuration	42	view_batchconfiguration
169	Can add Student Password History	43	add_studentpasswordhistory
170	Can change Student Password History	43	change_studentpasswordhistory
171	Can delete Student Password History	43	delete_studentpasswordhistory
172	Can view Student Password History	43	view_studentpasswordhistory
173	Can add Password Email Log	44	add_passwordemaillog
174	Can change Password Email Log	44	change_passwordemaillog
175	Can delete Password Email Log	44	delete_passwordemaillog
176	Can view Password Email Log	44	view_passwordemaillog
177	Can add Email Template	45	add_emailtemplate
178	Can change Email Template	45	change_emailtemplate
179	Can delete Email Template	45	delete_emailtemplate
180	Can view Email Template	45	view_emailtemplate
181	Can add Bulk Password Email Operation	46	add_bulkpasswordemailoperation
182	Can change Bulk Password Email Operation	46	change_bulkpasswordemailoperation
183	Can delete Bulk Password Email Operation	46	delete_bulkpasswordemailoperation
184	Can view Bulk Password Email Operation	46	view_bulkpasswordemailoperation
185	Can add course audit log	47	add_courseauditlog
186	Can change course audit log	47	change_courseauditlog
187	Can delete course audit log	47	delete_courseauditlog
188	Can view course audit log	47	view_courseauditlog
189	Can add email address	48	add_emailaddress
190	Can change email address	48	change_emailaddress
191	Can delete email address	48	delete_emailaddress
192	Can view email address	48	view_emailaddress
193	Can add email confirmation	49	add_emailconfirmation
194	Can change email confirmation	49	change_emailconfirmation
195	Can delete email confirmation	49	delete_emailconfirmation
196	Can view email confirmation	49	view_emailconfirmation
197	Can add social account	50	add_socialaccount
198	Can change social account	50	change_socialaccount
199	Can delete social account	50	delete_socialaccount
200	Can view social account	50	view_socialaccount
201	Can add social application	51	add_socialapp
202	Can change social application	51	change_socialapp
203	Can delete social application	51	delete_socialapp
204	Can view social application	51	view_socialapp
205	Can add social application token	52	add_socialtoken
206	Can change social application token	52	change_socialtoken
207	Can delete social application token	52	delete_socialtoken
208	Can view social application token	52	view_socialtoken
209	Can add Token	53	add_token
210	Can change Token	53	change_token
211	Can delete Token	53	delete_token
212	Can view Token	53	view_token
213	Can add token	54	add_tokenproxy
214	Can change token	54	change_tokenproxy
215	Can delete token	54	delete_tokenproxy
216	Can view token	54	view_tokenproxy
217	Can add session	55	add_session
218	Can change session	55	change_session
219	Can delete session	55	delete_session
220	Can view session	55	view_session
221	Can add Funding Agency	56	add_fundingagency
222	Can change Funding Agency	56	change_fundingagency
223	Can delete Funding Agency	56	delete_fundingagency
224	Can view Funding Agency	56	view_fundingagency
225	Can add Research Area	57	add_researcharea
226	Can change Research Area	57	change_researcharea
227	Can delete Research Area	57	delete_researcharea
228	Can view Research Area	57	view_researcharea
229	Can add research group	58	add_researchgroup
230	Can change research group	58	change_researchgroup
231	Can delete research group	58	delete_researchgroup
232	Can view research group	58	view_researchgroup
233	Can add Sponsored Project	59	add_sponsoredproject
234	Can change Sponsored Project	59	change_sponsoredproject
235	Can delete Sponsored Project	59	delete_sponsoredproject
236	Can view Sponsored Project	59	view_sponsoredproject
237	Can add Project Expenditure	60	add_projectexpenditure
238	Can change Project Expenditure	60	change_projectexpenditure
239	Can delete Project Expenditure	60	delete_projectexpenditure
240	Can view Project Expenditure	60	view_projectexpenditure
241	Can add Project Milestone	61	add_projectmilestone
242	Can change Project Milestone	61	change_projectmilestone
243	Can delete Project Milestone	61	delete_projectmilestone
244	Can view Project Milestone	61	view_projectmilestone
245	Can add Project Report	62	add_projectreport
246	Can change Project Report	62	change_projectreport
247	Can delete Project Report	62	delete_projectreport
248	Can view Project Report	62	view_projectreport
249	Can add Consultancy Project	63	add_consultancyproject
250	Can change Consultancy Project	63	change_consultancyproject
251	Can delete Consultancy Project	63	delete_consultancyproject
252	Can view Consultancy Project	63	view_consultancyproject
253	Can add Publication	64	add_publication
254	Can change Publication	64	change_publication
255	Can delete Publication	64	delete_publication
256	Can view Publication	64	view_publication
257	Can add Patent	65	add_patent
258	Can change Patent	65	change_patent
259	Can delete Patent	65	delete_patent
260	Can view Patent	65	view_patent
261	Can add Research Scholar	66	add_researchscholar
262	Can change Research Scholar	66	change_researchscholar
263	Can delete Research Scholar	66	delete_researchscholar
264	Can view Research Scholar	66	view_researchscholar
265	Can add tech transfer	67	add_techtransfer
266	Can change tech transfer	67	change_techtransfer
267	Can delete tech transfer	67	delete_techtransfer
268	Can view tech transfer	67	view_techtransfer
269	Can add research project	68	add_researchproject
270	Can change research project	68	change_researchproject
271	Can delete research project	68	delete_researchproject
272	Can view research project	68	view_researchproject
273	Can add patent status notification	69	add_patentstatusnotification
274	Can change patent status notification	69	change_patentstatusnotification
275	Can delete patent status notification	69	delete_patentstatusnotification
276	Can view patent status notification	69	view_patentstatusnotification
277	Can add log entry	70	add_logentry
278	Can change log entry	70	change_logentry
279	Can delete log entry	70	delete_logentry
280	Can view log entry	70	view_logentry
281	Can add notification	71	add_notification
282	Can change notification	71	change_notification
283	Can delete notification	71	delete_notification
284	Can view notification	71	view_notification
285	Can add assistantship_status	72	add_assistantship_status
286	Can change assistantship_status	72	change_assistantship_status
287	Can delete assistantship_status	72	delete_assistantship_status
288	Can view assistantship_status	72	view_assistantship_status
289	Can add minimum credits	73	add_minimumcredits
290	Can change minimum credits	73	change_minimumcredits
291	Can delete minimum credits	73	delete_minimumcredits
292	Can view minimum credits	73	view_minimumcredits
293	Can add thesis topic process	74	add_thesistopicprocess
294	Can change thesis topic process	74	change_thesistopicprocess
295	Can delete thesis topic process	74	delete_thesistopicprocess
296	Can view thesis topic process	74	view_thesistopicprocess
297	Can add thesis	75	add_thesis
298	Can change thesis	75	change_thesis
299	Can delete thesis	75	delete_thesis
300	Can view thesis	75	view_thesis
301	Can add teaching credit registration	76	add_teachingcreditregistration
302	Can change teaching credit registration	76	change_teachingcreditregistration
303	Can delete teaching credit registration	76	delete_teachingcreditregistration
304	Can view teaching credit registration	76	view_teachingcreditregistration
305	Can add student registration checks	77	add_studentregistrationchecks
306	Can change student registration checks	77	change_studentregistrationchecks
307	Can delete student registration checks	77	delete_studentregistrationchecks
308	Can view student registration checks	77	view_studentregistrationchecks
309	Can add student registration check	78	add_studentregistrationcheck
310	Can change student registration check	78	change_studentregistrationcheck
311	Can delete student registration check	78	delete_studentregistrationcheck
312	Can view student registration check	78	view_studentregistrationcheck
313	Can add semester marks	79	add_semestermarks
314	Can change semester marks	79	change_semestermarks
315	Can delete semester marks	79	delete_semestermarks
316	Can view semester marks	79	view_semestermarks
317	Can add ph d progress examination	80	add_phdprogressexamination
318	Can change ph d progress examination	80	change_phdprogressexamination
319	Can delete ph d progress examination	80	delete_phdprogressexamination
320	Can view ph d progress examination	80	view_phdprogressexamination
321	Can add m tech graduate seminar report	81	add_mtechgraduateseminarreport
322	Can change m tech graduate seminar report	81	change_mtechgraduateseminarreport
323	Can delete m tech graduate seminar report	81	delete_mtechgraduateseminarreport
324	Can view m tech graduate seminar report	81	view_mtechgraduateseminarreport
325	Can add mess due	82	add_messdue
326	Can change mess due	82	change_messdue
327	Can delete mess due	82	delete_messdue
328	Can view mess due	82	view_messdue
329	Can add mark submission check	83	add_marksubmissioncheck
330	Can change mark submission check	83	change_marksubmissioncheck
331	Can delete mark submission check	83	delete_marksubmissioncheck
332	Can view mark submission check	83	view_marksubmissioncheck
333	Can add initial registrations	84	add_initialregistrations
334	Can change initial registrations	84	change_initialregistrations
335	Can delete initial registrations	84	delete_initialregistrations
336	Can view initial registrations	84	view_initialregistrations
337	Can add initial registration	85	add_initialregistration
338	Can change initial registration	85	change_initialregistration
339	Can delete initial registration	85	delete_initialregistration
340	Can view initial registration	85	view_initialregistration
341	Can add final registrations	86	add_finalregistrations
342	Can change final registrations	86	change_finalregistrations
343	Can delete final registrations	86	delete_finalregistrations
344	Can view final registrations	86	view_finalregistrations
345	Can add final registration	87	add_finalregistration
346	Can change final registration	87	change_finalregistration
347	Can delete final registration	87	delete_finalregistration
348	Can view final registration	87	view_finalregistration
349	Can add fee payments	88	add_feepayments
350	Can change fee payments	88	change_feepayments
351	Can delete fee payments	88	delete_feepayments
352	Can view fee payments	88	view_feepayments
353	Can add fee payment	89	add_feepayment
354	Can change fee payment	89	change_feepayment
355	Can delete fee payment	89	delete_feepayment
356	Can view fee payment	89	view_feepayment
357	Can add dues	90	add_dues
358	Can change dues	90	change_dues
359	Can delete dues	90	delete_dues
360	Can view dues	90	view_dues
361	Can add courses mtech	91	add_coursesmtech
362	Can change courses mtech	91	change_coursesmtech
363	Can delete courses mtech	91	delete_coursesmtech
364	Can view courses mtech	91	view_coursesmtech
365	Can add course requested	92	add_courserequested
366	Can change course requested	92	change_courserequested
367	Can delete course requested	92	delete_courserequested
368	Can view course requested	92	view_courserequested
369	Can add course_registration	93	add_course_registration
370	Can change course_registration	93	change_course_registration
371	Can delete course_registration	93	delete_course_registration
372	Can view course_registration	93	view_course_registration
373	Can add branch change	94	add_branchchange
374	Can change branch change	94	change_branchchange
375	Can delete branch change	94	delete_branchchange
376	Can view branch change	94	view_branchchange
377	Can add bonafide	95	add_bonafide
378	Can change bonafide	95	change_bonafide
379	Can delete bonafide	95	delete_bonafide
380	Can view bonafide	95	view_bonafide
381	Can add backlog_course	96	add_backlog_course
382	Can change backlog_course	96	change_backlog_course
383	Can delete backlog_course	96	delete_backlog_course
384	Can view backlog_course	96	view_backlog_course
385	Can add assistantship claim	97	add_assistantshipclaim
386	Can change assistantship claim	97	change_assistantshipclaim
387	Can delete assistantship claim	97	delete_assistantshipclaim
388	Can view assistantship claim	97	view_assistantshipclaim
389	Can add register	98	add_register
390	Can change register	98	change_register
391	Can delete register	98	delete_register
392	Can view register	98	view_register
393	Can add course_replacement	99	add_course_replacement
394	Can change course_replacement	99	change_course_replacement
395	Can delete course_replacement	99	delete_course_replacement
396	Can view course_replacement	99	view_course_replacement
397	Can add assignment	100	add_assignment
398	Can change assignment	100	change_assignment
399	Can delete assignment	100	delete_assignment
400	Can view assignment	100	view_assignment
401	Can add stipend request	101	add_stipendrequest
402	Can change stipend request	101	change_stipendrequest
403	Can delete stipend request	101	delete_stipendrequest
404	Can view stipend request	101	view_stipendrequest
405	Can add course replacement request	102	add_coursereplacementrequest
406	Can change course replacement request	102	change_coursereplacementrequest
407	Can delete course replacement request	102	delete_coursereplacementrequest
408	Can view course replacement request	102	view_coursereplacementrequest
409	Can add feedback option	103	add_feedbackoption
410	Can change feedback option	103	change_feedbackoption
411	Can delete feedback option	103	delete_feedbackoption
412	Can view feedback option	103	view_feedbackoption
413	Can add feedback question	104	add_feedbackquestion
414	Can change feedback question	104	change_feedbackquestion
415	Can delete feedback question	104	delete_feedbackquestion
416	Can view feedback question	104	view_feedbackquestion
417	Can add feedback response	105	add_feedbackresponse
418	Can change feedback response	105	change_feedbackresponse
419	Can delete feedback response	105	delete_feedbackresponse
420	Can view feedback response	105	view_feedbackresponse
421	Can add batch change history	106	add_batchchangehistory
422	Can change batch change history	106	change_batchchangehistory
423	Can delete batch change history	106	delete_batchchangehistory
424	Can view batch change history	106	view_batchchangehistory
425	Can add feedback filled	107	add_feedbackfilled
426	Can change feedback filled	107	change_feedbackfilled
427	Can delete feedback filled	107	delete_feedbackfilled
428	Can view feedback filled	107	view_feedbackfilled
429	Can add course drop request	108	add_coursedroprequest
430	Can change course drop request	108	change_coursedroprequest
431	Can delete course drop request	108	delete_coursedroprequest
432	Can view course drop request	108	view_coursedroprequest
433	Can add course add request	109	add_courseaddrequest
434	Can change course add request	109	change_courseaddrequest
435	Can delete course add request	109	delete_courseaddrequest
436	Can view course add request	109	view_courseaddrequest
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$216000$tAWlSQ0F1rPB$Km/LFsWL3tLOPNQFYrdbNR+MRxLLbw6TNOdn0b5Drgc=	2026-04-18 00:49:15.617827+05:30	t	admin			admin@rspc.edu	t	t	2026-04-18 00:49:15.642945+05:30
4	pbkdf2_sha256$216000$XeACJatvD7al$o+mqx+08MErDI19JnBsiGxrM5/5YXspPsucpS/aGT4o=	2026-04-18 01:04:04.640856+05:30	f	faculty1	Arun	Kumar	arun.kumar@rspc.edu	f	t	2026-04-18 01:04:04.650655+05:30
5	pbkdf2_sha256$216000$dvjk3C1MAQoL$XqFo54Br5QtZ3V8ZgsL0QJOOjQw5NmIWLONxx6PxMZk=	2026-04-18 01:04:04.853945+05:30	f	faculty2	Bhavna	Sharma	bhavna.sharma@rspc.edu	f	t	2026-04-18 01:04:04.855192+05:30
11	pbkdf2_sha256$216000$HAaWS15p2APR$Z3Oi1vB1Q/qXzeXDezDj+KH3cuk3GIJuaqHM9bZU9ag=	\N	f	faculty-f0df3688				f	t	2026-04-20 00:37:38.757268+05:30
12	pbkdf2_sha256$216000$RBjfrkzBc9Gl$zaghEKuJWOWJutFwcv04evBQem0xU6OqPPrumzoJh08=	\N	f	faculty-3c057d8c				f	t	2026-04-20 00:45:38.626301+05:30
13	pbkdf2_sha256$216000$QxlF0688Y0BK$pgZzXkZtBaQO9483zSGXUMS/YXRLEvFGqtCrOiOsaPY=	\N	f	student-3c057d8c				f	t	2026-04-20 00:45:38.716619+05:30
14	pbkdf2_sha256$216000$tlAjY5n3KSDk$DZuYs7zPEBwb7UDei3ucfuY34nybr+JOmvHXmBdSLLA=	\N	f	faculty-d6c9682c				f	t	2026-04-20 00:46:05.222213+05:30
15	pbkdf2_sha256$216000$N9LOkicsIfNv$/CN/8JN01GQI7COJrny7x87K+dyXTY708TUpe4kg/9w=	\N	f	student-d6c9682c				f	t	2026-04-20 00:46:05.301929+05:30
6	pbkdf2_sha256$216000$Ttca1BxWYnWs$XUhbY8pOWFpj9U7IpbObVPhqW5uDbyAEKEqrG94yqe8=	\N	f	faculty_pi	Arjun	Sharma	faculty_pi@iiitdmj.ac.in	f	t	2026-04-19 00:21:29.496128+05:30
7	pbkdf2_sha256$216000$IORVEDzibO9s$NISRDylxWnhpcDBz2rg41BeFifMYLCOSLQMv8SIcq6I=	\N	f	dept_head	Meena	Desai	dept_head@iiitdmj.ac.in	f	t	2026-04-19 00:21:30.155065+05:30
8	pbkdf2_sha256$216000$U2fZFn93KGXH$L7Rz7wF5C5wBvT7tF6QtKVJLEz2ZxwbSDr8VpVlQ5YU=	\N	f	rspc_admin	Rajiv	Verma	rspc_admin@iiitdmj.ac.in	f	t	2026-04-19 00:21:30.209244+05:30
9	pbkdf2_sha256$216000$qHlY0jyFxsvE$y4mS3MCzn2eO+dsVEZIjjoSJD9v7GU5HVDkb8v95zbg=	\N	f	dean_rspc	Priya	Nair	dean_rspc@iiitdmj.ac.in	f	t	2026-04-19 00:21:30.286578+05:30
10	pbkdf2_sha256$216000$itpMPqWwlgtB$UkL2GkD37To6rnafU23l4u/I8mbKUwNhKo4JqsSJz14=	\N	f	director	Suresh	Kulkarni	director@iiitdmj.ac.in	f	t	2026-04-19 00:21:30.36176+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
7f7cf0c731117b443d743eb8906bbc3ae4bb7af9	2026-04-20 11:50:51.299626+05:30	7
7ab17ba92990af624f7b38a330a6f23bd5cc743f	2026-04-20 13:56:43.054624+05:30	8
b90e3b1392f0505f5081b5ae8cb2f20fbce2ae0d	2026-04-20 14:03:54.368285+05:30	9
ad68a4462702905c7de490528679c1f62911bb7a	2026-04-20 14:03:54.378182+05:30	10
\.


--
-- Data for Name: bulk_password_email_operation; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.bulk_password_email_operation (id, operation_id, programme_type, year, branch_filter, total_students, emails_sent, emails_failed, emails_pending, operation_status, start_time, end_time, duration_seconds, error_summary, notes, initiated_by_id) FROM stdin;
\.


--
-- Data for Name: course_registration; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.course_registration (id, working_year, course_id_id, course_slot_id_id, semester_id_id, student_id_id, registration_type, semester_type, session) FROM stdin;
\.


--
-- Data for Name: course_replacement; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.course_replacement (id, new_course_registration_id, old_course_registration_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	contenttypes	contenttype
5	sites	site
6	academic_information	calendar
7	academic_information	course
8	academic_information	curriculum
9	academic_information	curriculum_instructor
10	academic_information	exam_timetable
11	academic_information	holiday
12	academic_information	meeting
13	academic_information	student
14	academic_information	timetable
15	academic_information	student_attendance
16	academic_information	grades
17	academic_information	spi
18	globals	departmentinfo
19	globals	designation
20	globals	extrainfo
21	globals	faculty
22	globals	staff
23	globals	issueimage
24	globals	issue
25	globals	feedback
26	globals	holdsdesignation
27	globals	moduleaccess
28	globals	passwordresettracker
29	programme_curriculum	curriculum
30	programme_curriculum	programme
31	programme_curriculum	semester
32	programme_curriculum	discipline
33	programme_curriculum	course
34	programme_curriculum	batch
35	programme_curriculum	proposal_tracking
36	programme_curriculum	newproposalfile
37	programme_curriculum	courseslot
38	programme_curriculum	courseinstructor
39	programme_curriculum	studentbatchupload
40	programme_curriculum	uploadhistory
41	programme_curriculum	studentstatuslog
42	programme_curriculum	batchconfiguration
43	programme_curriculum	studentpasswordhistory
44	programme_curriculum	passwordemaillog
45	programme_curriculum	emailtemplate
46	programme_curriculum	bulkpasswordemailoperation
47	programme_curriculum	courseauditlog
48	account	emailaddress
49	account	emailconfirmation
50	socialaccount	socialaccount
51	socialaccount	socialapp
52	socialaccount	socialtoken
53	authtoken	token
54	authtoken	tokenproxy
55	sessions	session
56	research_procedures	fundingagency
57	research_procedures	researcharea
58	research_procedures	researchgroup
59	research_procedures	sponsoredproject
60	research_procedures	projectexpenditure
61	research_procedures	projectmilestone
62	research_procedures	projectreport
63	research_procedures	consultancyproject
64	research_procedures	publication
65	research_procedures	patent
66	research_procedures	researchscholar
67	research_procedures	techtransfer
68	research_procedures	researchproject
69	research_procedures	patentstatusnotification
70	admin	logentry
71	notifications	notification
72	academic_procedures	assistantship_status
73	academic_procedures	minimumcredits
74	academic_procedures	thesistopicprocess
75	academic_procedures	thesis
76	academic_procedures	teachingcreditregistration
77	academic_procedures	studentregistrationchecks
78	academic_procedures	studentregistrationcheck
79	academic_procedures	semestermarks
80	academic_procedures	phdprogressexamination
81	academic_procedures	mtechgraduateseminarreport
82	academic_procedures	messdue
83	academic_procedures	marksubmissioncheck
84	academic_procedures	initialregistrations
85	academic_procedures	initialregistration
86	academic_procedures	finalregistrations
87	academic_procedures	finalregistration
88	academic_procedures	feepayments
89	academic_procedures	feepayment
90	academic_procedures	dues
91	academic_procedures	coursesmtech
92	academic_procedures	courserequested
93	academic_procedures	course_registration
94	academic_procedures	branchchange
95	academic_procedures	bonafide
96	academic_procedures	backlog_course
97	academic_procedures	assistantshipclaim
98	academic_procedures	register
99	academic_procedures	course_replacement
100	academic_procedures	assignment
101	academic_procedures	stipendrequest
102	academic_procedures	coursereplacementrequest
103	academic_procedures	feedbackoption
104	academic_procedures	feedbackquestion
105	academic_procedures	feedbackresponse
106	academic_procedures	batchchangehistory
107	academic_procedures	feedbackfilled
108	academic_procedures	coursedroprequest
109	academic_procedures	courseaddrequest
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-04-18 00:47:33.594513+05:30
2	auth	0001_initial	2026-04-18 00:47:33.632314+05:30
3	globals	0001_initial	2026-04-18 00:47:33.759126+05:30
4	programme_curriculum	0001_initial	2026-04-18 00:47:33.95128+05:30
5	academic_information	0001_initial	2026-04-18 00:47:34.11595+05:30
6	programme_curriculum	0002_course_max_seats	2026-04-18 00:47:34.157423+05:30
7	globals	0002_moduleaccess	2026-04-18 00:47:34.162341+05:30
8	programme_curriculum	0003_auto_20241115_1545	2026-04-18 00:47:34.269508+05:30
9	programme_curriculum	0004_auto_20241117_0137	2026-04-18 00:47:34.287023+05:30
10	programme_curriculum	0005_auto_20250201_2228	2026-04-18 00:47:34.326746+05:30
11	programme_curriculum	0006_newproposalfile_max_seats	2026-04-18 00:47:34.336687+05:30
12	programme_curriculum	0007_auto_20250421_0900	2026-04-18 00:47:34.346604+05:30
13	programme_curriculum	0008_populate_semester_type	2026-04-18 00:47:34.434434+05:30
14	globals	0003_passwordresettracker	2026-04-18 00:47:34.440194+05:30
15	globals	0004_extrainfo_last_selected_role	2026-04-18 00:47:34.453776+05:30
16	programme_curriculum	0009_auto_20250503_1355	2026-04-18 00:47:34.47012+05:30
17	programme_curriculum	0010_auto_20250824_1342	2026-04-18 00:47:34.609385+05:30
18	programme_curriculum	0011_auto_20250824_2024	2026-04-18 00:47:34.649397+05:30
19	programme_curriculum	0012_add_password_email_models	2026-04-18 00:47:34.789961+05:30
20	programme_curriculum	0013_remove_password_field_add_user_link	2026-04-18 00:47:34.923812+05:30
21	programme_curriculum	0014_auto_20250825_2048	2026-04-18 00:47:35.157013+05:30
22	programme_curriculum	0015_add_email_password_fields	2026-04-18 00:47:35.197003+05:30
23	programme_curriculum	0016_batch_total_seats	2026-04-18 00:47:35.206746+05:30
24	programme_curriculum	0017_fix_curriculum_unique_constraint	2026-04-18 00:47:35.218119+05:30
25	programme_curriculum	0018_studentbatchupload_source	2026-04-18 00:47:35.234382+05:30
26	programme_curriculum	0019_add_withdrawal_status	2026-04-18 00:47:35.26195+05:30
27	programme_curriculum	0020_auto_20250830_0100	2026-04-18 00:47:35.290292+05:30
28	programme_curriculum	0021_auto_20250830_0126	2026-04-18 00:47:35.318105+05:30
29	programme_curriculum	0022_batch_total_seats	2026-04-18 00:47:35.376383+05:30
30	programme_curriculum	0023_courseauditlog	2026-04-18 00:47:35.404423+05:30
31	programme_curriculum	0024_add_minority_field	2026-04-18 00:47:35.424514+05:30
32	programme_curriculum	0025_update_minority_values	2026-04-18 00:47:35.480156+05:30
33	sites	0001_initial	2026-04-18 00:48:44.442817+05:30
34	sites	0002_alter_domain_unique	2026-04-18 00:48:44.449782+05:30
35	account	0001_initial	2026-04-18 00:48:45.509647+05:30
36	account	0002_email_max_length	2026-04-18 00:48:45.547168+05:30
37	socialaccount	0001_initial	2026-04-18 00:48:46.616611+05:30
38	socialaccount	0002_token_max_lengths	2026-04-18 00:48:46.661837+05:30
39	socialaccount	0003_extra_data_default_dict	2026-04-18 00:48:46.678249+05:30
40	authtoken	0001_initial	2026-04-18 00:48:47.666167+05:30
41	authtoken	0002_auto_20160226_1747	2026-04-18 00:48:47.779762+05:30
42	authtoken	0003_tokenproxy	2026-04-18 00:48:47.78395+05:30
43	sessions	0001_initial	2026-04-18 00:48:48.74678+05:30
44	research_procedures	0001_initial	2026-04-18 01:00:32.951273+05:30
45	research_procedures	0002_alter_consultancyproject_options_and_more	2026-04-18 01:00:34.333046+05:30
46	research_procedures	0003_projectexpenditure_last_date_and_more	2026-04-18 01:00:34.407289+05:30
47	research_procedures	0004_alter_sponsoredproject_status_length	2026-04-18 01:00:34.494024+05:30
48	research_procedures	0005_alter_consultancyproject_status	2026-04-18 01:00:34.663898+05:30
49	research_procedures	0002_auto_20241020_1126	2026-04-18 01:00:57.008761+05:30
50	research_procedures	0006_merge_20260418_0047	2026-04-18 01:01:15.056595+05:30
51	programme_curriculum	0026_add_database_indexes	2026-04-18 09:52:16.144327+05:30
52	programme_curriculum	0027_auto_20250918_1616	2026-04-18 09:52:16.187299+05:30
53	programme_curriculum	0028_add_new_student_fields	2026-04-18 09:52:16.510722+05:30
54	programme_curriculum	0029_increase_allotted_field_lengths	2026-04-18 09:52:16.554011+05:30
55	programme_curriculum	0030_add_specialization_field	2026-04-18 09:52:16.598063+05:30
56	programme_curriculum	0031_add_curriculum_options_to_batch	2026-04-18 09:52:16.618772+05:30
57	academic_procedures	0001_initial	2026-04-18 09:52:18.232353+05:30
58	academic_procedures	0002_initialregistration_registration_type	2026-04-18 09:52:18.392157+05:30
59	academic_procedures	0003_finalregistration_registration_type	2026-04-18 09:52:18.421848+05:30
60	academic_procedures	0004_course_registration_registration_type	2026-04-18 09:52:18.451277+05:30
61	academic_procedures	0005_auto_20241202_1439	2026-04-18 09:52:18.483053+05:30
62	academic_procedures	0006_auto_20250114_0326	2026-04-18 09:52:18.739891+05:30
63	academic_procedures	0007_auto_20250203_1619	2026-04-18 09:52:18.801026+05:30
64	academic_procedures	0008_course_replacement	2026-04-18 09:52:18.858048+05:30
65	academic_procedures	0009_auto_20250409_2128	2026-04-18 09:52:18.927684+05:30
66	academic_procedures	0010_populate_session_and_type	2026-04-18 09:52:18.983246+05:30
67	academic_procedures	0009_auto_20250420_1221	2026-04-18 09:52:19.093952+05:30
68	academic_procedures	0011_merge_20250420_1513	2026-04-18 09:52:19.100758+05:30
69	academic_procedures	0012_auto_20250422_0230	2026-04-18 09:52:19.282223+05:30
70	academic_procedures	0013_auto_20250423_1401	2026-04-18 09:52:19.39171+05:30
71	academic_procedures	0014_assignment_coursereplacementrequest_stipendrequest	2026-04-18 09:52:19.559354+05:30
72	academic_procedures	0015_auto_20250709_1240	2026-04-18 09:52:20.036928+05:30
73	academic_procedures	0016_coursedroprequest	2026-04-18 09:52:20.121922+05:30
74	academic_procedures	0017_courseaddrequest	2026-04-18 09:52:20.225757+05:30
75	academic_procedures	0018_auto_20260106_1355	2026-04-18 09:52:20.539706+05:30
76	admin	0001_initial	2026-04-18 09:52:20.609612+05:30
77	admin	0002_logentry_remove_auto_add	2026-04-18 09:52:20.645421+05:30
78	admin	0003_logentry_add_action_flag_choices	2026-04-18 09:52:20.670853+05:30
79	contenttypes	0002_remove_content_type_name	2026-04-18 09:52:20.758632+05:30
80	auth	0002_alter_permission_name_max_length	2026-04-18 09:52:20.822267+05:30
81	auth	0003_alter_user_email_max_length	2026-04-18 09:52:20.889986+05:30
82	auth	0004_alter_user_username_opts	2026-04-18 09:52:20.962209+05:30
83	auth	0005_alter_user_last_login_null	2026-04-18 09:52:21.200488+05:30
84	auth	0006_require_contenttypes_0002	2026-04-18 09:52:21.203341+05:30
85	auth	0007_alter_validators_add_error_messages	2026-04-18 09:52:21.305976+05:30
86	auth	0008_alter_user_username_max_length	2026-04-18 09:52:21.423363+05:30
87	auth	0009_alter_user_last_name_max_length	2026-04-18 09:52:21.539881+05:30
88	auth	0010_alter_group_name_max_length	2026-04-18 09:52:21.635266+05:30
89	auth	0011_update_proxy_permissions	2026-04-18 09:52:21.728777+05:30
90	auth	0012_alter_user_first_name_max_length	2026-04-18 09:52:21.822022+05:30
91	notifications	0001_initial	2026-04-18 14:52:47.267041+05:30
92	notifications	0002_auto_20150224_1134	2026-04-18 14:52:47.342224+05:30
93	notifications	0003_notification_data	2026-04-18 14:52:47.370618+05:30
94	notifications	0004_auto_20150826_1508	2026-04-18 14:52:47.397883+05:30
95	notifications	0005_auto_20160504_1520	2026-04-18 14:52:47.427016+05:30
96	notifications	0006_indexes	2026-04-18 14:52:47.528698+05:30
97	notifications	0007_add_timestamp_index	2026-04-18 14:52:47.56135+05:30
98	notifications	0008_index_together_recipient_unread	2026-04-18 14:52:47.589034+05:30
99	globals	0005_moduleaccess_database	2026-04-19 00:29:15.479338+05:30
100	globals	0006_faculty_is_permanent	2026-04-20 00:42:18.697543+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: email_template; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.email_template (id, template_type, subject_template, html_template, text_template, variables_info, is_active, created_at, updated_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: globals_departmentinfo; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_departmentinfo (id, name) FROM stdin;
1	Computer Science & Engineering
2	CSE-f0df3688
3	CSE-3c057d8c
4	CSE-d6c9682c
\.


--
-- Data for Name: globals_designation; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_designation (id, name, full_name, type) FROM stdin;
1	faculty	Faculty (PI)	academic
2	hod	Head of Department	academic
3	rspc_admin	RSPC Admin	academic
4	dean_rspc	Dean RSPC	academic
5	director	Director	academic
\.


--
-- Data for Name: globals_extrainfo; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_extrainfo (id, title, sex, date_of_birth, user_status, address, phone_no, user_type, profile_picture, about_me, date_modified, department_id, user_id, last_selected_role) FROM stdin;
admin	Dr.	M	1970-01-01	PRESENT		9999999999	faculty		NA	\N	1	2	\N
FAC001	Dr.	M	1970-01-01	PRESENT	IIIT Campus	9999999999	faculty		RSPC seeded profile	\N	1	4	\N
FAC002	Dr.	M	1970-01-01	PRESENT	IIIT Campus	9999999999	faculty		RSPC seeded profile	\N	1	5	\N
Ff0df3688	Professor	M	1970-01-01	PRESENT		9999999999	faculty		NA	\N	2	11	\N
F3c057d8c	Professor	M	1970-01-01	PRESENT		9999999999	faculty		NA	\N	3	12	\N
S3c057d8c	Dr.	M	1970-01-01	PRESENT		9999999999	student		NA	\N	3	13	\N
Fd6c9682c	Professor	M	1970-01-01	PRESENT		9999999999	faculty		NA	\N	4	14	\N
Sd6c9682c	Dr.	M	1970-01-01	PRESENT		9999999999	student		NA	\N	4	15	\N
faculty_pi	Dr.	M	1970-01-01	PRESENT		9999999999	faculty		NA	\N	\N	6	\N
dept_head	Dr.	M	1970-01-01	PRESENT		9999999999	faculty		NA	\N	\N	7	\N
rspc_admin	Dr.	M	1970-01-01	PRESENT		9999999999	faculty		NA	\N	\N	8	\N
dean_rspc	Dr.	M	1970-01-01	PRESENT		9999999999	faculty		NA	\N	\N	9	\N
director	Dr.	M	1970-01-01	PRESENT		9999999999	faculty		NA	\N	\N	10	\N
\.


--
-- Data for Name: globals_faculty; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_faculty (id_id, is_permanent) FROM stdin;
FAC001	t
FAC002	t
F3c057d8c	t
Fd6c9682c	t
\.


--
-- Data for Name: globals_feedback; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_feedback (id, rating, feedback, "timestamp", user_id) FROM stdin;
\.


--
-- Data for Name: globals_holdsdesignation; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_holdsdesignation (id, held_at, designation_id, user_id, working_id) FROM stdin;
1	2026-04-20 11:50:02.908308+05:30	1	6	6
2	2026-04-20 11:50:03.001383+05:30	2	7	7
3	2026-04-20 11:50:03.090177+05:30	3	8	8
4	2026-04-20 11:50:03.17777+05:30	4	9	9
5	2026-04-20 11:50:03.269426+05:30	5	10	10
\.


--
-- Data for Name: globals_issue; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_issue (id, report_type, module, closed, text, title, "timestamp", added_on, user_id) FROM stdin;
\.


--
-- Data for Name: globals_issue_images; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_issue_images (id, issue_id, issueimage_id) FROM stdin;
\.


--
-- Data for Name: globals_issue_support; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_issue_support (id, issue_id, user_id) FROM stdin;
\.


--
-- Data for Name: globals_issueimage; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_issueimage (id, image, user_id) FROM stdin;
\.


--
-- Data for Name: globals_moduleaccess; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_moduleaccess (id, designation, program_and_curriculum, course_registration, course_management, other_academics, spacs, department, examinations, hr, iwd, complaint_management, fts, purchase_and_store, rspc, hostel_management, mess_management, gymkhana, placement_cell, visitor_hostel, phc, database) FROM stdin;
\.


--
-- Data for Name: globals_passwordresettracker; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_passwordresettracker (id, email, last_reset) FROM stdin;
\.


--
-- Data for Name: globals_staff; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.globals_staff (id_id) FROM stdin;
\.


--
-- Data for Name: notifications_notification; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.notifications_notification (id, level, unread, actor_object_id, verb, description, target_object_id, action_object_object_id, "timestamp", public, action_object_content_type_id, actor_content_type_id, recipient_id, target_content_type_id, deleted, emailed, data) FROM stdin;
1	info	t	9	Expenditure for 'AI for Smart Agriculture' has been approved	\N	\N	\N	2026-04-20 12:23:46.682981+05:30	t	\N	3	4	\N	f	f	{"url": "research_procedures:project_details", "module": "Research Procedures"}
2	info	t	10	Expenditure for 'AI for Smart Agriculture' has been approved	\N	\N	\N	2026-04-20 12:24:03.637756+05:30	t	\N	3	4	\N	f	f	{"url": "research_procedures:project_details", "module": "Research Procedures"}
3	info	t	8	Expenditure for 'NLP for Regional Languages' has been rejected	\N	\N	\N	2026-04-20 14:04:14.382042+05:30	t	\N	3	5	\N	f	f	{"url": "research_procedures:project_details", "module": "Research Procedures"}
4	info	t	9	Expenditure for 'NLP for Regional Languages' has been rejected	\N	\N	\N	2026-04-20 14:04:14.852625+05:30	t	\N	3	5	\N	f	f	{"url": "research_procedures:project_details", "module": "Research Procedures"}
5	info	t	10	Expenditure for 'NLP for Regional Languages' has been rejected	\N	\N	\N	2026-04-20 14:04:15.274825+05:30	t	\N	3	5	\N	f	f	{"url": "research_procedures:project_details", "module": "Research Procedures"}
\.


--
-- Data for Name: password_email_log; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.password_email_log (id, sent_to_email, email_status, password_generated, email_subject, email_content_preview, error_message, attempts_count, ip_address, user_agent, sent_at, last_attempt_at, sent_by_id, student_id) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_batch; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_batch (id, name, year, running_batch, curriculum_id, discipline_id, total_seats, curriculum_options) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_batchconfiguration; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_batchconfiguration (id, programme, discipline, year, total_seats, filled_seats, available_seats, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_course; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_course (id, code, name, version, credit, lecture_hours, tutorial_hours, pratical_hours, discussion_hours, project_hours, pre_requisits, syllabus, percent_quiz_1, percent_midsem, percent_quiz_2, percent_endsem, percent_project, percent_lab_evaluation, percent_course_attendance, ref_books, working_course, latest_version, max_seats) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_course_disciplines; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_course_disciplines (id, course_id, discipline_id) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_course_pre_requisit_courses; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_course_pre_requisit_courses (id, from_course_id, to_course_id) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_courseauditlog; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_courseauditlog (id, "timestamp", action, old_values, new_values, changed_fields, version_bump_type, old_version, new_version, admin_override, reason, course_id, user_id) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_courseinstructor; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_courseinstructor (id, course_id_id, instructor_id_id, year, semester_type) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_courseslot; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_courseslot (id, name, type, course_slot_info, duration, min_registration_limit, max_registration_limit, semester_id) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_courseslot_courses; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_courseslot_courses (id, courseslot_id, course_id) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_curriculum; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_curriculum (id, name, version, working_curriculum, no_of_semester, min_credit, latest_version, programme_id) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_discipline; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_discipline (id, name, acronym) FROM stdin;
1	Computer Science	CSE
\.


--
-- Data for Name: programme_curriculum_discipline_programmes; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_discipline_programmes (id, discipline_id, programme_id) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_newproposalfile; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_newproposalfile (id, uploader, designation, code, name, credit, lecture_hours, tutorial_hours, pratical_hours, discussion_hours, project_hours, pre_requisits, syllabus, percent_quiz_1, percent_midsem, percent_quiz_2, percent_endsem, percent_project, percent_lab_evaluation, percent_course_attendance, ref_books, subject, description, upload_date, is_read, is_update, is_archive, max_seats) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_newproposalfile_pre_requisit_courses; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_newproposalfile_pre_requisit_courses (id, newproposalfile_id, course_id) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_programme; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_programme (id, category, name, programme_begin_year) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_proposal_tracking; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_proposal_tracking (id, file_id, current_id, current_design, receive_date, forward_date, remarks, is_added, is_submitted, is_rejected, sender_archive, receiver_archive, disciplines_id, receive_design_id, receive_id_id) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_semester; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_semester (id, semester_no, instigate_semester, start_semester, end_semester, semester_info, curriculum_id) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_studentbatchupload; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_studentbatchupload (id, jee_app_no, roll_number, institute_email, name, father_name, mother_name, gender, category, pwd, phone_number, personal_email, address, state, branch, date_of_birth, jee_rank, category_rank, tenth_marks, twelfth_marks, father_occupation, father_mobile, mother_occupation, mother_mobile, aadhar_number, allotted_category, allotted_gender, batch_year, programme_type, reported_status, created_at, updated_at, created_by_id, user_account_id, academic_year, allocation_status, email_password, password_email_sent, password_generated_at, source, minority, admission_mode, admission_mode_remarks, blood_group, blood_group_remarks, country, income, income_group, nationality, parent_email, pwd_category, pwd_category_remarks, specialization) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_studentstatuslog; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_studentstatuslog (id, old_reported_status, new_reported_status, change_reason, ip_address, created_at, changed_by_id, student_id) FROM stdin;
\.


--
-- Data for Name: programme_curriculum_uploadhistory; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.programme_curriculum_uploadhistory (id, upload_type, programme_type, total_records, successful_records, failed_records, file_name, upload_notes, created_at, uploaded_by_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_consultancyproject; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_consultancyproject (id, title, project_number, description, client_name, client_type, client_contact, client_email, client_phone, consultants, contract_amount, faculty_share, institute_share, financial_outlay, currency, payment_received, start_date, end_date, actual_completion_date, duration, status, agreement_document, completion_certificate, pf_no, remarks, notes, date_entry, created_at, updated_at, consultant_id, user_id) FROM stdin;
1	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:55:28.55193+05:30	2026-04-20 11:55:28.551956+05:30	\N	6
2	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:55:30.664001+05:30	2026-04-20 11:55:30.664033+05:30	\N	7
3	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:55:34.519093+05:30	2026-04-20 11:55:34.519116+05:30	\N	8
4	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:55:35.133647+05:30	2026-04-20 11:55:35.133671+05:30	\N	9
5	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:55:35.966442+05:30	2026-04-20 11:55:35.966464+05:30	\N	10
6	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:55:45.908609+05:30	2026-04-20 11:55:45.908646+05:30	\N	6
7	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:55:46.533187+05:30	2026-04-20 11:55:46.53321+05:30	\N	7
8	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:55:47.200653+05:30	2026-04-20 11:55:47.200668+05:30	\N	8
9	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:55:47.855836+05:30	2026-04-20 11:55:47.855857+05:30	\N	9
10	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:55:48.473071+05:30	2026-04-20 11:55:48.473091+05:30	\N	10
11	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:56:21.123358+05:30	2026-04-20 11:56:21.123392+05:30	\N	6
12	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:56:21.432489+05:30	2026-04-20 11:56:21.43251+05:30	\N	7
13	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:56:21.711107+05:30	2026-04-20 11:56:21.711127+05:30	\N	8
14	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:56:21.979781+05:30	2026-04-20 11:56:21.979806+05:30	\N	9
15	Matrix Consultancy	\N	\N	Test Client	\N	\N	\N	\N	\N	50000.00	30000.00	20000.00	\N	INR	0.00	2026-04-20	\N	\N	\N	DRAFT			\N	\N	\N	2026-04-20	2026-04-20 11:56:22.307663+05:30	2026-04-20 11:56:22.307686+05:30	\N	10
\.


--
-- Data for Name: research_procedures_consultancyproject_co_consultants; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_consultancyproject_co_consultants (id, consultancyproject_id, faculty_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_fundingagency; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_fundingagency (id, name, acronym, agency_type, country, website, contact_info, email, phone, is_active, created_at, updated_at) FROM stdin;
1	Department of Science and Technology	DST	GOVERNMENT	India	\N	\N	\N	\N	t	2026-04-18 01:04:04.976027+05:30	2026-04-18 01:04:04.976142+05:30
2	Science and Engineering Research Board	SERB	GOVERNMENT	India	\N	\N	\N	\N	t	2026-04-18 01:04:04.997645+05:30	2026-04-18 01:04:04.997661+05:30
3	DST-3c057d8c	\N	GOVERNMENT	India	\N	\N	\N	\N	t	2026-04-20 00:45:38.786287+05:30	2026-04-20 00:45:38.786298+05:30
4	DST-d6c9682c	\N	GOVERNMENT	India	\N	\N	\N	\N	t	2026-04-20 00:46:05.352957+05:30	2026-04-20 00:46:05.35297+05:30
\.


--
-- Data for Name: research_procedures_patent; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_patent (application_id, ipd_form_file, project_details_file, title, abstract, patent_type, external_inventors, application_number, filing_date, publication_number, publication_date, grant_number, grant_date, status, country, organization, specification_document, grant_certificate, notes, created_at, updated_at, faculty_id_id, related_project_id, ipd_form, project_details) FROM stdin;
1	\N	\N	AI-enabled Crop Monitoring System	\N	NATIONAL	\N	IN2026000123	2026-03-01	\N	\N	\N	\N	FILED	India	\N			\N	2026-04-18 01:04:05.295394+05:30	2026-04-18 01:04:05.29541+05:30	\N	1		
2	\N	\N	xx	xx	NATIONAL	xx	123	2026-04-18	\N	\N	\N	\N	PUBLISHED	India	\N			\N	2026-04-18 10:10:23.451686+05:30	2026-04-18 10:10:28.036666+05:30	\N	\N		
\.


--
-- Data for Name: research_procedures_patent_faculty_inventors; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_patent_faculty_inventors (id, patent_id, faculty_id) FROM stdin;
1	1	FAC001
\.


--
-- Data for Name: research_procedures_patent_student_inventors; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_patent_student_inventors (id, patent_id, student_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_patentstatusnotification; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_patentstatusnotification (id, previous_status, new_status, message, created_at, faculty_id, patent_id) FROM stdin;
1	DRAFT	PUBLISHED	Patent 'xx' status changed from DRAFT to PUBLISHED.	2026-04-18 10:10:28.061583+05:30	\N	2
\.


--
-- Data for Name: research_procedures_projectexpenditure; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_projectexpenditure (id, expenditure_head, description, amount, date, voucher_number, bill_document, status, approval_date, remarks, created_at, updated_at, project_id, approved_by_id, last_date) FROM stdin;
1	EQUIPMENT	GPU workstation purchase	420000.00	2026-02-10	\N		APPROVED	\N	\N	2026-04-18 01:04:05.131899+05:30	2026-04-18 01:04:05.131917+05:30	1	\N	\N
3	TRAVEL	Conference	25000.00	2025-02-01	\N		PENDING	\N	\N	2026-04-20 00:46:05.374735+05:30	2026-04-20 00:46:05.374749+05:30	7	\N	\N
4	CONSUMABLES	Parts	25000.00	2025-02-01	\N		PENDING	\N	\N	2026-04-20 00:46:05.387649+05:30	2026-04-20 00:46:05.387654+05:30	8	\N	\N
5	TRAVEL	Faculty test expense valid	25000.00	2026-04-27	\N		APPROVED	2026-04-20	\N	2026-04-20 12:21:34.260849+05:30	2026-04-20 12:23:46.273525+05:30	3	rspc_admin	\N
2	MANPOWER	RA stipend for Q1	120000.00	2026-03-05	\N		APPROVED	2026-04-20	\N	2026-04-18 01:04:05.1398+05:30	2026-04-20 12:23:46.654167+05:30	1	dean_rspc	\N
6	EQUIPMENT	High value equipment tier test	250001.00	2026-04-20	\N		APPROVED	2026-04-20	\N	2026-04-20 12:24:03.338636+05:30	2026-04-20 12:24:03.609546+05:30	1	director	\N
7	MANPOWER	xx	49000.00	2026-04-20	xx		REJECTED	\N		2026-04-20 12:37:00.968988+05:30	2026-04-20 14:04:14.356209+05:30	2	\N	2026-04-23
8	EQUIPMENT	xx	51000.00	2026-04-20	xx		REJECTED	\N		2026-04-20 12:37:26.172887+05:30	2026-04-20 14:04:14.835823+05:30	2	\N	2026-04-30
9	MANPOWER	xx	210000.00	2026-04-20	xx		REJECTED	\N		2026-04-20 12:38:01.694197+05:30	2026-04-20 14:04:15.256931+05:30	2	\N	2026-04-23
\.


--
-- Data for Name: research_procedures_projectmilestone; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_projectmilestone (id, title, description, due_date, completed_date, status, deliverables, deliverable_file, created_at, updated_at, project_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_projectreport; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_projectreport (id, report_type, period_from, period_to, summary, achievements, challenges, next_steps, report_file, status, submitted_date, approved_date, comments, created_at, updated_at, project_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_publication; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_publication (id, title, publication_type, external_authors, journal_conference_name, publisher, volume, issue, pages, year, month, index_type, impact_factor, doi, issn, isbn, url, pdf_file, abstract, keywords, is_verified, verification_date, created_at, updated_at, associated_project_id, verified_by_id) FROM stdin;
1	Deep Learning for Crop Disease Detection	JOURNAL	\N	IEEE Access	\N	\N	\N	\N	2026	\N	SCOPUS	\N	\N	\N	\N	\N		\N	\N	t	\N	2026-04-18 01:04:05.214687+05:30	2026-04-18 01:04:05.214779+05:30	1	\N
2	Transformer Models for Low-Resource Indic NLP	CONFERENCE	\N	ACL Workshop	\N	\N	\N	\N	2026	\N	SCOPUS	\N	\N	\N	\N	\N		\N	\N	f	\N	2026-04-18 01:04:05.277455+05:30	2026-04-18 01:04:05.277481+05:30	2	\N
\.


--
-- Data for Name: research_procedures_publication_faculty_authors; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_publication_faculty_authors (id, publication_id, faculty_id) FROM stdin;
1	1	FAC001
2	2	FAC002
\.


--
-- Data for Name: research_procedures_publication_student_authors; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_publication_student_authors (id, publication_id, student_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_researcharea; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_researcharea (id, name, description, is_active, created_at, updated_at, discipline_id, parent_area_id) FROM stdin;
1	Artificial Intelligence	ML and AI systems research	t	2026-04-18 01:04:05.017055+05:30	2026-04-18 01:04:05.017073+05:30	1	\N
\.


--
-- Data for Name: research_procedures_researcharea_faculty_experts; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_researcharea_faculty_experts (id, researcharea_id, faculty_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_researchgroup; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_researchgroup (id, name, acronym, description, established_date, website, is_active, created_at, updated_at, discipline_id, head_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_researchgroup_faculty_under_group; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_researchgroup_faculty_under_group (id, researchgroup_id, user_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_researchgroup_members; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_researchgroup_members (id, researchgroup_id, faculty_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_researchgroup_students_under_group; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_researchgroup_students_under_group (id, researchgroup_id, user_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_researchproject; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_researchproject (id, pf_no, ptype, pi, co_pi, title, funding_agency, financial_outlay, status, start_date, finish_date, date_submission, date_entry, user_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_researchscholar; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_researchscholar (id, enrollment_date, expected_completion, fellowship_type, fellowship_amount, fellowship_start_date, fellowship_end_date, progress_status, coursework_completed, coursework_completion_date, comprehensive_exam_passed, comprehensive_exam_date, comprehensive_exam_score, synopsis_submitted, synopsis_date, synopsis_approved, synopsis_approval_date, thesis_submitted, thesis_submission_date, thesis_title, defense_date, defense_result, degree_awarded_date, publications_count, patents_count, created_at, updated_at, student_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_sponsoredproject; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_sponsoredproject (id, title, project_number, description, sanctioned_amount, utilized_amount, currency, submission_date, sanction_date, start_date, finish_date, original_end_date, extended_end_date, actual_end_date, duration_months, status, proposal_document, sanction_letter, completion_report, pf_no, ptype, pi, co_pi, financial_outlay, notes, date_entry, date_submission, created_at, updated_at, funding_agency_id, principal_investigator_id, research_area_id, research_group_id, user_id) FROM stdin;
2	NLP for Regional Languages	RSPC-2026-002	Low-resource NLP for Indic languages	1800000.00	0.00	INR	\N	\N	2026-02-01	\N	2028-01-31	\N	\N	\N	SANCTIONED				\N	Research	 	 	 	\N	2026-04-18	\N	2026-04-18 01:04:05.080311+05:30	2026-04-18 01:04:05.080323+05:30	2	FAC002	1	\N	\N
4	xx	xx	xx	49000.00	0.00	INR	\N	\N	2026-04-12	\N	2026-04-21	\N	\N	\N	SUBMITTED				\N	Research	 	 	 	\N	2026-04-19	\N	2026-04-19 09:32:05.212948+05:30	2026-04-19 09:32:05.212964+05:30	1	\N	\N	\N	\N
5	123	23	xx	49000.00	0.00	INR	\N	\N	2026-04-26	\N	2026-04-28	\N	\N	\N	SUBMITTED				\N	Research	 	 	 	\N	2026-04-19	\N	2026-04-19 11:07:49.72996+05:30	2026-04-19 11:07:49.730188+05:30	1	\N	\N	\N	\N
6	xx	123	xx	49000.00	0.00	INR	\N	\N	2026-04-19	\N	2026-04-23	\N	\N	\N	SUBMITTED				\N	Research	 	 	 	\N	2026-04-19	\N	2026-04-19 11:12:00.661717+05:30	2026-04-19 11:12:00.661738+05:30	1	\N	\N	\N	\N
7	AI Systems	RSPC-X2-d6c9682c	Test project	100000.00	0.00	INR	\N	\N	2025-01-01	\N	2025-12-31	\N	\N	\N	ONGOING				\N	Research	 	 	 	\N	2026-04-20	\N	2026-04-20 00:46:05.363326+05:30	2026-04-20 00:46:05.363335+05:30	4	Fd6c9682c	\N	\N	\N
8	Robotics	RSPC-X3-d6c9682c	Test project	50000.00	0.00	INR	\N	\N	2025-01-01	\N	2025-12-31	\N	\N	\N	ONGOING				\N	Research	 	 	 	\N	2026-04-20	\N	2026-04-20 00:46:05.385143+05:30	2026-04-20 00:46:05.385148+05:30	4	Fd6c9682c	\N	\N	\N
9	xx	1234	xx	23400.00	0.00	INR	\N	\N	2026-04-20	\N	2026-04-22	\N	\N	\N	SUBMITTED				\N	Research	 	 	 	\N	2026-04-20	\N	2026-04-20 11:59:15.872101+05:30	2026-04-20 11:59:15.872138+05:30	1	\N	\N	\N	\N
3	12	12	xx	49000.00	25000.00	INR	\N	\N	2026-04-26	\N	2026-04-20	\N	\N	\N	SUBMITTED				\N	Research	 	 	 	\N	2026-04-19	\N	2026-04-19 00:54:12.866872+05:30	2026-04-20 12:23:46.307824+05:30	1	\N	\N	\N	\N
1	AI for Smart Agriculture	RSPC-2026-001	Computer vision and AI for crop disease detection	2500000.00	790001.00	INR	\N	\N	2026-01-01	\N	2028-12-31	\N	\N	\N	ONGOING				\N	Research	 	 	 	\N	2026-04-18	\N	2026-04-18 01:04:05.057185+05:30	2026-04-20 12:24:03.621782+05:30	1	FAC001	1	\N	\N
\.


--
-- Data for Name: research_procedures_sponsoredproject_co_principal_investigators; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_sponsoredproject_co_principal_investigators (id, sponsoredproject_id, faculty_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_sponsoredproject_research_scholars; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_sponsoredproject_research_scholars (id, sponsoredproject_id, student_id) FROM stdin;
\.


--
-- Data for Name: research_procedures_techtransfer; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.research_procedures_techtransfer (id, pf_no, details, date_entry, start_date, end_date, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: student_password_history; Type: TABLE DATA; Schema: public; Owner: fusion_admin
--

COPY public.student_password_history (id, password_hash, created_at, is_initial_password, is_active, password_changed_at, change_reason, created_by_id, student_id) FROM stdin;
\.


--
-- Name: Bonafide_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Bonafide_id_seq"', 1, false);


--
-- Name: Calendar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Calendar_id_seq"', 1, false);


--
-- Name: CourseRequested_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."CourseRequested_id_seq"', 1, false);


--
-- Name: Course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Course_id_seq"', 1, false);


--
-- Name: Curriculum_Instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Curriculum_Instructor_id_seq"', 1, false);


--
-- Name: Curriculum_curriculum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Curriculum_curriculum_id_seq"', 1, false);


--
-- Name: Dues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Dues_id_seq"', 1, false);


--
-- Name: Exam_Timetable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Exam_Timetable_id_seq"', 1, false);


--
-- Name: FeePayments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."FeePayments_id_seq"', 1, false);


--
-- Name: FinalRegistration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."FinalRegistration_id_seq"', 1, false);


--
-- Name: FinalRegistrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."FinalRegistrations_id_seq"', 1, false);


--
-- Name: Grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Grades_id_seq"', 1, false);


--
-- Name: Holiday_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Holiday_id_seq"', 1, false);


--
-- Name: InitialRegistration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."InitialRegistration_id_seq"', 1, false);


--
-- Name: InitialRegistrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."InitialRegistrations_id_seq"', 1, false);


--
-- Name: MarkSubmissionCheck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."MarkSubmissionCheck_id_seq"', 1, false);


--
-- Name: Meeting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Meeting_id_seq"', 1, false);


--
-- Name: Register_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Register_id_seq"', 1, false);


--
-- Name: SemesterMarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."SemesterMarks_id_seq"', 1, false);


--
-- Name: Spi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Spi_id_seq"', 1, false);


--
-- Name: StudentRegistrationCheck_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."StudentRegistrationCheck_id_seq"', 1, false);


--
-- Name: StudentRegistrationChecks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."StudentRegistrationChecks_id_seq"', 1, false);


--
-- Name: Student_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Student_attendance_id_seq"', 1, false);


--
-- Name: TeachingCreditRegistration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."TeachingCreditRegistration_id_seq"', 1, false);


--
-- Name: ThesisTopicProcess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."ThesisTopicProcess_id_seq"', 1, false);


--
-- Name: Thesis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Thesis_id_seq"', 1, false);


--
-- Name: Timetable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public."Timetable_id_seq"', 1, false);


--
-- Name: academic_procedures_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_assignment_id_seq', 1, false);


--
-- Name: academic_procedures_assistantship_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_assistantship_status_id_seq', 1, false);


--
-- Name: academic_procedures_assistantshipclaim_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_assistantshipclaim_id_seq', 1, false);


--
-- Name: academic_procedures_backlog_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_backlog_course_id_seq', 1, false);


--
-- Name: academic_procedures_batchchangehistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_batchchangehistory_id_seq', 1, false);


--
-- Name: academic_procedures_branchchange_c_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_branchchange_c_id_seq', 1, false);


--
-- Name: academic_procedures_courseaddrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_courseaddrequest_id_seq', 1, false);


--
-- Name: academic_procedures_coursedroprequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_coursedroprequest_id_seq', 1, false);


--
-- Name: academic_procedures_coursereplacementrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_coursereplacementrequest_id_seq', 1, false);


--
-- Name: academic_procedures_coursesmtech_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_coursesmtech_id_seq', 1, false);


--
-- Name: academic_procedures_feedbackfilled_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_feedbackfilled_id_seq', 1, false);


--
-- Name: academic_procedures_feedbackoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_feedbackoption_id_seq', 101, true);


--
-- Name: academic_procedures_feedbackquestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_feedbackquestion_id_seq', 28, true);


--
-- Name: academic_procedures_feedbackresponse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_feedbackresponse_id_seq', 1, false);


--
-- Name: academic_procedures_feepayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_feepayment_id_seq', 1, false);


--
-- Name: academic_procedures_messdue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_messdue_id_seq', 1, false);


--
-- Name: academic_procedures_minimumcredits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_minimumcredits_id_seq', 1, false);


--
-- Name: academic_procedures_mtechgraduateseminarreport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_mtechgraduateseminarreport_id_seq', 1, false);


--
-- Name: academic_procedures_phdprogressexamination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_phdprogressexamination_id_seq', 1, false);


--
-- Name: academic_procedures_stipendrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.academic_procedures_stipendrequest_id_seq', 1, false);


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 436, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 15, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: bulk_password_email_operation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.bulk_password_email_operation_id_seq', 1, false);


--
-- Name: course_registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.course_registration_id_seq', 1, false);


--
-- Name: course_replacement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.course_replacement_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 109, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 100, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: email_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.email_template_id_seq', 1, false);


--
-- Name: globals_departmentinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.globals_departmentinfo_id_seq', 4, true);


--
-- Name: globals_designation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.globals_designation_id_seq', 5, true);


--
-- Name: globals_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.globals_feedback_id_seq', 1, false);


--
-- Name: globals_holdsdesignation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.globals_holdsdesignation_id_seq', 5, true);


--
-- Name: globals_issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.globals_issue_id_seq', 1, false);


--
-- Name: globals_issue_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.globals_issue_images_id_seq', 1, false);


--
-- Name: globals_issue_support_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.globals_issue_support_id_seq', 1, false);


--
-- Name: globals_issueimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.globals_issueimage_id_seq', 1, false);


--
-- Name: globals_moduleaccess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.globals_moduleaccess_id_seq', 1, false);


--
-- Name: globals_passwordresettracker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.globals_passwordresettracker_id_seq', 1, false);


--
-- Name: notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.notifications_notification_id_seq', 5, true);


--
-- Name: password_email_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.password_email_log_id_seq', 1, false);


--
-- Name: programme_curriculum_batch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_batch_id_seq', 1, false);


--
-- Name: programme_curriculum_batchconfiguration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_batchconfiguration_id_seq', 1, false);


--
-- Name: programme_curriculum_course_disciplines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_course_disciplines_id_seq', 1, false);


--
-- Name: programme_curriculum_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_course_id_seq', 1, false);


--
-- Name: programme_curriculum_course_pre_requisit_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_course_pre_requisit_courses_id_seq', 1, false);


--
-- Name: programme_curriculum_courseauditlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_courseauditlog_id_seq', 1, false);


--
-- Name: programme_curriculum_courseinstructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_courseinstructor_id_seq', 1, false);


--
-- Name: programme_curriculum_courseslot_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_courseslot_courses_id_seq', 1, false);


--
-- Name: programme_curriculum_courseslot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_courseslot_id_seq', 1, false);


--
-- Name: programme_curriculum_curriculum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_curriculum_id_seq', 1, false);


--
-- Name: programme_curriculum_discipline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_discipline_id_seq', 1, true);


--
-- Name: programme_curriculum_discipline_programmes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_discipline_programmes_id_seq', 1, false);


--
-- Name: programme_curriculum_newproposalfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_newproposalfile_id_seq', 1, false);


--
-- Name: programme_curriculum_newproposalfile_pre_requisit_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_newproposalfile_pre_requisit_course_id_seq', 1, false);


--
-- Name: programme_curriculum_programme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_programme_id_seq', 1, false);


--
-- Name: programme_curriculum_proposal_tracking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_proposal_tracking_id_seq', 1, false);


--
-- Name: programme_curriculum_semester_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_semester_id_seq', 1, false);


--
-- Name: programme_curriculum_studentbatchupload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_studentbatchupload_id_seq', 1, false);


--
-- Name: programme_curriculum_studentstatuslog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_studentstatuslog_id_seq', 1, false);


--
-- Name: programme_curriculum_uploadhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.programme_curriculum_uploadhistory_id_seq', 1, false);


--
-- Name: research_procedures_consultancyproject_co_consultants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_consultancyproject_co_consultants_id_seq', 1, false);


--
-- Name: research_procedures_consultancyproject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_consultancyproject_id_seq', 15, true);


--
-- Name: research_procedures_fundingagency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_fundingagency_id_seq', 4, true);


--
-- Name: research_procedures_patent_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_patent_application_id_seq', 2, true);


--
-- Name: research_procedures_patent_faculty_inventors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_patent_faculty_inventors_id_seq', 2, true);


--
-- Name: research_procedures_patent_student_inventors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_patent_student_inventors_id_seq', 1, false);


--
-- Name: research_procedures_patentstatusnotification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_patentstatusnotification_id_seq', 1, true);


--
-- Name: research_procedures_projectexpenditure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_projectexpenditure_id_seq', 9, true);


--
-- Name: research_procedures_projectmilestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_projectmilestone_id_seq', 1, false);


--
-- Name: research_procedures_projectreport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_projectreport_id_seq', 1, false);


--
-- Name: research_procedures_publication_faculty_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_publication_faculty_authors_id_seq', 4, true);


--
-- Name: research_procedures_publication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_publication_id_seq', 2, true);


--
-- Name: research_procedures_publication_student_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_publication_student_authors_id_seq', 1, false);


--
-- Name: research_procedures_researcharea_faculty_experts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_researcharea_faculty_experts_id_seq', 1, false);


--
-- Name: research_procedures_researcharea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_researcharea_id_seq', 1, true);


--
-- Name: research_procedures_researchgroup_faculty_under_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_researchgroup_faculty_under_group_id_seq', 1, false);


--
-- Name: research_procedures_researchgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_researchgroup_id_seq', 1, false);


--
-- Name: research_procedures_researchgroup_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_researchgroup_members_id_seq', 1, false);


--
-- Name: research_procedures_researchgroup_students_under_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_researchgroup_students_under_group_id_seq', 1, false);


--
-- Name: research_procedures_researchproject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_researchproject_id_seq', 1, false);


--
-- Name: research_procedures_researchscholar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_researchscholar_id_seq', 1, false);


--
-- Name: research_procedures_sponsoredproject_co_principal_invest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_sponsoredproject_co_principal_invest_id_seq', 1, false);


--
-- Name: research_procedures_sponsoredproject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_sponsoredproject_id_seq', 9, true);


--
-- Name: research_procedures_sponsoredproject_research_scholars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_sponsoredproject_research_scholars_id_seq', 1, false);


--
-- Name: research_procedures_techtransfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.research_procedures_techtransfer_id_seq', 1, false);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: student_password_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fusion_admin
--

SELECT pg_catalog.setval('public.student_password_history_id_seq', 1, false);


--
-- Name: Bonafide Bonafide_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Bonafide"
    ADD CONSTRAINT "Bonafide_pkey" PRIMARY KEY (id);


--
-- Name: Calendar Calendar_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Calendar"
    ADD CONSTRAINT "Calendar_pkey" PRIMARY KEY (id);


--
-- Name: CourseRequested CourseRequested_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."CourseRequested"
    ADD CONSTRAINT "CourseRequested_pkey" PRIMARY KEY (id);


--
-- Name: Course Course_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Course"
    ADD CONSTRAINT "Course_pkey" PRIMARY KEY (id);


--
-- Name: Curriculum_Instructor Curriculum_Instructor_curriculum_id_id_instruc_21464b43_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Curriculum_Instructor"
    ADD CONSTRAINT "Curriculum_Instructor_curriculum_id_id_instruc_21464b43_uniq" UNIQUE (curriculum_id_id, instructor_id_id);


--
-- Name: Curriculum_Instructor Curriculum_Instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Curriculum_Instructor"
    ADD CONSTRAINT "Curriculum_Instructor_pkey" PRIMARY KEY (id);


--
-- Name: Curriculum Curriculum_course_code_batch_programme_b966b415_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Curriculum"
    ADD CONSTRAINT "Curriculum_course_code_batch_programme_b966b415_uniq" UNIQUE (course_code, batch, programme);


--
-- Name: Curriculum Curriculum_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Curriculum"
    ADD CONSTRAINT "Curriculum_pkey" PRIMARY KEY (curriculum_id);


--
-- Name: Dues Dues_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Dues"
    ADD CONSTRAINT "Dues_pkey" PRIMARY KEY (id);


--
-- Name: Exam_Timetable Exam_Timetable_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Exam_Timetable"
    ADD CONSTRAINT "Exam_Timetable_pkey" PRIMARY KEY (id);


--
-- Name: FeePayments FeePayments_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FeePayments"
    ADD CONSTRAINT "FeePayments_pkey" PRIMARY KEY (id);


--
-- Name: FinalRegistration FinalRegistration_course_id_id_student_id__3ef50427_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FinalRegistration"
    ADD CONSTRAINT "FinalRegistration_course_id_id_student_id__3ef50427_uniq" UNIQUE (course_id_id, student_id_id, semester_id_id, registration_type);


--
-- Name: FinalRegistration FinalRegistration_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FinalRegistration"
    ADD CONSTRAINT "FinalRegistration_pkey" PRIMARY KEY (id);


--
-- Name: FinalRegistrations FinalRegistrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FinalRegistrations"
    ADD CONSTRAINT "FinalRegistrations_pkey" PRIMARY KEY (id);


--
-- Name: Grades Grades_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Grades"
    ADD CONSTRAINT "Grades_pkey" PRIMARY KEY (id);


--
-- Name: Holiday Holiday_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Holiday"
    ADD CONSTRAINT "Holiday_pkey" PRIMARY KEY (id);


--
-- Name: InitialRegistration InitialRegistration_course_id_id_student_id__1e253a0e_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistration"
    ADD CONSTRAINT "InitialRegistration_course_id_id_student_id__1e253a0e_uniq" UNIQUE (course_id_id, student_id_id, semester_id_id, registration_type);


--
-- Name: InitialRegistration InitialRegistration_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistration"
    ADD CONSTRAINT "InitialRegistration_pkey" PRIMARY KEY (id);


--
-- Name: InitialRegistrations InitialRegistrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistrations"
    ADD CONSTRAINT "InitialRegistrations_pkey" PRIMARY KEY (id);


--
-- Name: MarkSubmissionCheck MarkSubmissionCheck_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."MarkSubmissionCheck"
    ADD CONSTRAINT "MarkSubmissionCheck_pkey" PRIMARY KEY (id);


--
-- Name: Meeting Meeting_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Meeting"
    ADD CONSTRAINT "Meeting_pkey" PRIMARY KEY (id);


--
-- Name: Register Register_curr_id_id_student_id_id_a47d25bf_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Register"
    ADD CONSTRAINT "Register_curr_id_id_student_id_id_a47d25bf_uniq" UNIQUE (curr_id_id, student_id_id);


--
-- Name: Register Register_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Register"
    ADD CONSTRAINT "Register_pkey" PRIMARY KEY (id);


--
-- Name: SemesterMarks SemesterMarks_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."SemesterMarks"
    ADD CONSTRAINT "SemesterMarks_pkey" PRIMARY KEY (id);


--
-- Name: Spi Spi_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Spi"
    ADD CONSTRAINT "Spi_pkey" PRIMARY KEY (id);


--
-- Name: Spi Spi_student_id_id_sem_d19bf544_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Spi"
    ADD CONSTRAINT "Spi_student_id_id_sem_d19bf544_uniq" UNIQUE (student_id_id, sem);


--
-- Name: StudentRegistrationCheck StudentRegistrationCheck_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."StudentRegistrationCheck"
    ADD CONSTRAINT "StudentRegistrationCheck_pkey" PRIMARY KEY (id);


--
-- Name: StudentRegistrationChecks StudentRegistrationChecks_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."StudentRegistrationChecks"
    ADD CONSTRAINT "StudentRegistrationChecks_pkey" PRIMARY KEY (id);


--
-- Name: Student_attendance Student_attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Student_attendance"
    ADD CONSTRAINT "Student_attendance_pkey" PRIMARY KEY (id);


--
-- Name: TeachingCreditRegistration TeachingCreditRegistration_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."TeachingCreditRegistration"
    ADD CONSTRAINT "TeachingCreditRegistration_pkey" PRIMARY KEY (id);


--
-- Name: ThesisTopicProcess ThesisTopicProcess_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."ThesisTopicProcess"
    ADD CONSTRAINT "ThesisTopicProcess_pkey" PRIMARY KEY (id);


--
-- Name: Thesis Thesis_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Thesis"
    ADD CONSTRAINT "Thesis_pkey" PRIMARY KEY (id);


--
-- Name: Timetable Timetable_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Timetable"
    ADD CONSTRAINT "Timetable_pkey" PRIMARY KEY (id);


--
-- Name: academic_information_student academic_information_student_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_information_student
    ADD CONSTRAINT academic_information_student_pkey PRIMARY KEY (id_id);


--
-- Name: academic_procedures_assignment academic_procedures_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_assignment
    ADD CONSTRAINT academic_procedures_assignment_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_assistantship_status academic_procedures_assistantship_status_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_assistantship_status
    ADD CONSTRAINT academic_procedures_assistantship_status_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_assistantshipclaim academic_procedures_assistantshipclaim_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_assistantshipclaim
    ADD CONSTRAINT academic_procedures_assistantshipclaim_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_backlog_course academic_procedures_backlog_course_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_backlog_course
    ADD CONSTRAINT academic_procedures_backlog_course_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_batchchangehistory academic_procedures_batchchangehistory_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_batchchangehistory
    ADD CONSTRAINT academic_procedures_batchchangehistory_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_branchchange academic_procedures_branchchange_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_branchchange
    ADD CONSTRAINT academic_procedures_branchchange_pkey PRIMARY KEY (c_id);


--
-- Name: academic_procedures_courseaddrequest academic_procedures_cour_student_id_course_slot_i_00f85c00_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_courseaddrequest
    ADD CONSTRAINT academic_procedures_cour_student_id_course_slot_i_00f85c00_uniq UNIQUE (student_id, course_slot_id, academic_year, semester_type);


--
-- Name: academic_procedures_coursedroprequest academic_procedures_cour_student_id_course_slot_i_b74558bc_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursedroprequest
    ADD CONSTRAINT academic_procedures_cour_student_id_course_slot_i_b74558bc_uniq UNIQUE (student_id, course_slot_id, academic_year, semester_type);


--
-- Name: academic_procedures_coursereplacementrequest academic_procedures_cour_student_id_course_slot_i_c73f483f_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursereplacementrequest
    ADD CONSTRAINT academic_procedures_cour_student_id_course_slot_i_c73f483f_uniq UNIQUE (student_id, course_slot_id, academic_year, semester_type);


--
-- Name: academic_procedures_courseaddrequest academic_procedures_courseaddrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_courseaddrequest
    ADD CONSTRAINT academic_procedures_courseaddrequest_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_coursedroprequest academic_procedures_coursedroprequest_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursedroprequest
    ADD CONSTRAINT academic_procedures_coursedroprequest_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_coursereplacementrequest academic_procedures_coursereplacementrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursereplacementrequest
    ADD CONSTRAINT academic_procedures_coursereplacementrequest_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_coursesmtech academic_procedures_coursesmtech_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursesmtech
    ADD CONSTRAINT academic_procedures_coursesmtech_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_feedbackfilled academic_procedures_feed_student_id_semester_no_b625c611_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackfilled
    ADD CONSTRAINT academic_procedures_feed_student_id_semester_no_b625c611_uniq UNIQUE (student_id, semester_no);


--
-- Name: academic_procedures_feedbackfilled academic_procedures_feedbackfilled_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackfilled
    ADD CONSTRAINT academic_procedures_feedbackfilled_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_feedbackoption academic_procedures_feedbackoption_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackoption
    ADD CONSTRAINT academic_procedures_feedbackoption_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_feedbackquestion academic_procedures_feedbackquestion_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackquestion
    ADD CONSTRAINT academic_procedures_feedbackquestion_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_feedbackresponse academic_procedures_feedbackresponse_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackresponse
    ADD CONSTRAINT academic_procedures_feedbackresponse_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_feepayment academic_procedures_feepayment_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feepayment
    ADD CONSTRAINT academic_procedures_feepayment_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_messdue academic_procedures_messdue_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_messdue
    ADD CONSTRAINT academic_procedures_messdue_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_minimumcredits academic_procedures_minimumcredits_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_minimumcredits
    ADD CONSTRAINT academic_procedures_minimumcredits_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_mtechgraduateseminarreport academic_procedures_mtechgraduateseminarreport_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_mtechgraduateseminarreport
    ADD CONSTRAINT academic_procedures_mtechgraduateseminarreport_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_phdprogressexamination academic_procedures_phdprogressexamination_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_phdprogressexamination
    ADD CONSTRAINT academic_procedures_phdprogressexamination_pkey PRIMARY KEY (id);


--
-- Name: academic_procedures_stipendrequest academic_procedures_stip_assignment_id_year_month_c5a788f1_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_stipendrequest
    ADD CONSTRAINT academic_procedures_stip_assignment_id_year_month_c5a788f1_uniq UNIQUE (assignment_id, year, month);


--
-- Name: academic_procedures_stipendrequest academic_procedures_stipendrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_stipendrequest
    ADD CONSTRAINT academic_procedures_stipendrequest_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: bulk_password_email_operation bulk_password_email_operation_operation_id_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.bulk_password_email_operation
    ADD CONSTRAINT bulk_password_email_operation_operation_id_key UNIQUE (operation_id);


--
-- Name: bulk_password_email_operation bulk_password_email_operation_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.bulk_password_email_operation
    ADD CONSTRAINT bulk_password_email_operation_pkey PRIMARY KEY (id);


--
-- Name: course_registration course_registration_course_id_id_student_id__d21decae_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.course_registration
    ADD CONSTRAINT course_registration_course_id_id_student_id__d21decae_uniq UNIQUE (course_id_id, student_id_id, semester_id_id, registration_type);


--
-- Name: course_registration course_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.course_registration
    ADD CONSTRAINT course_registration_pkey PRIMARY KEY (id);


--
-- Name: course_replacement course_replacement_old_course_registration__b8081e4b_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.course_replacement
    ADD CONSTRAINT course_replacement_old_course_registration__b8081e4b_uniq UNIQUE (old_course_registration_id, new_course_registration_id);


--
-- Name: course_replacement course_replacement_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.course_replacement
    ADD CONSTRAINT course_replacement_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: email_template email_template_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.email_template
    ADD CONSTRAINT email_template_pkey PRIMARY KEY (id);


--
-- Name: email_template email_template_template_type_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.email_template
    ADD CONSTRAINT email_template_template_type_key UNIQUE (template_type);


--
-- Name: globals_departmentinfo globals_departmentinfo_name_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_departmentinfo
    ADD CONSTRAINT globals_departmentinfo_name_key UNIQUE (name);


--
-- Name: globals_departmentinfo globals_departmentinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_departmentinfo
    ADD CONSTRAINT globals_departmentinfo_pkey PRIMARY KEY (id);


--
-- Name: globals_designation globals_designation_name_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_designation
    ADD CONSTRAINT globals_designation_name_key UNIQUE (name);


--
-- Name: globals_designation globals_designation_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_designation
    ADD CONSTRAINT globals_designation_pkey PRIMARY KEY (id);


--
-- Name: globals_extrainfo globals_extrainfo_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_extrainfo
    ADD CONSTRAINT globals_extrainfo_pkey PRIMARY KEY (id);


--
-- Name: globals_extrainfo globals_extrainfo_user_id_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_extrainfo
    ADD CONSTRAINT globals_extrainfo_user_id_key UNIQUE (user_id);


--
-- Name: globals_faculty globals_faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_faculty
    ADD CONSTRAINT globals_faculty_pkey PRIMARY KEY (id_id);


--
-- Name: globals_feedback globals_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_feedback
    ADD CONSTRAINT globals_feedback_pkey PRIMARY KEY (id);


--
-- Name: globals_feedback globals_feedback_user_id_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_feedback
    ADD CONSTRAINT globals_feedback_user_id_key UNIQUE (user_id);


--
-- Name: globals_holdsdesignation globals_holdsdesignation_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_holdsdesignation
    ADD CONSTRAINT globals_holdsdesignation_pkey PRIMARY KEY (id);


--
-- Name: globals_holdsdesignation globals_holdsdesignation_user_id_designation_id_cc0e3fd1_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_holdsdesignation
    ADD CONSTRAINT globals_holdsdesignation_user_id_designation_id_cc0e3fd1_uniq UNIQUE (user_id, designation_id);


--
-- Name: globals_holdsdesignation globals_holdsdesignation_working_id_designation_i_ffd1e31a_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_holdsdesignation
    ADD CONSTRAINT globals_holdsdesignation_working_id_designation_i_ffd1e31a_uniq UNIQUE (working_id, designation_id);


--
-- Name: globals_issue_images globals_issue_images_issue_id_issueimage_id_8a046f88_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue_images
    ADD CONSTRAINT globals_issue_images_issue_id_issueimage_id_8a046f88_uniq UNIQUE (issue_id, issueimage_id);


--
-- Name: globals_issue_images globals_issue_images_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue_images
    ADD CONSTRAINT globals_issue_images_pkey PRIMARY KEY (id);


--
-- Name: globals_issue globals_issue_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue
    ADD CONSTRAINT globals_issue_pkey PRIMARY KEY (id);


--
-- Name: globals_issue_support globals_issue_support_issue_id_user_id_ccf999be_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue_support
    ADD CONSTRAINT globals_issue_support_issue_id_user_id_ccf999be_uniq UNIQUE (issue_id, user_id);


--
-- Name: globals_issue_support globals_issue_support_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue_support
    ADD CONSTRAINT globals_issue_support_pkey PRIMARY KEY (id);


--
-- Name: globals_issueimage globals_issueimage_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issueimage
    ADD CONSTRAINT globals_issueimage_pkey PRIMARY KEY (id);


--
-- Name: globals_moduleaccess globals_moduleaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_moduleaccess
    ADD CONSTRAINT globals_moduleaccess_pkey PRIMARY KEY (id);


--
-- Name: globals_passwordresettracker globals_passwordresettracker_email_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_passwordresettracker
    ADD CONSTRAINT globals_passwordresettracker_email_key UNIQUE (email);


--
-- Name: globals_passwordresettracker globals_passwordresettracker_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_passwordresettracker
    ADD CONSTRAINT globals_passwordresettracker_pkey PRIMARY KEY (id);


--
-- Name: globals_staff globals_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_staff
    ADD CONSTRAINT globals_staff_pkey PRIMARY KEY (id_id);


--
-- Name: notifications_notification notifications_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notification_pkey PRIMARY KEY (id);


--
-- Name: password_email_log password_email_log_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.password_email_log
    ADD CONSTRAINT password_email_log_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_batch programme_curriculum_bat_name_discipline_id_year_eab411a8_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_batch
    ADD CONSTRAINT programme_curriculum_bat_name_discipline_id_year_eab411a8_uniq UNIQUE (name, discipline_id, year);


--
-- Name: programme_curriculum_batchconfiguration programme_curriculum_bat_programme_discipline_yea_cde864da_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_batchconfiguration
    ADD CONSTRAINT programme_curriculum_bat_programme_discipline_yea_cde864da_uniq UNIQUE (programme, discipline, year);


--
-- Name: programme_curriculum_batch programme_curriculum_batch_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_batch
    ADD CONSTRAINT programme_curriculum_batch_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_batchconfiguration programme_curriculum_batchconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_batchconfiguration
    ADD CONSTRAINT programme_curriculum_batchconfiguration_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_course_disciplines programme_curriculum_cou_course_id_discipline_id_2c5d1d8f_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course_disciplines
    ADD CONSTRAINT programme_curriculum_cou_course_id_discipline_id_2c5d1d8f_uniq UNIQUE (course_id, discipline_id);


--
-- Name: programme_curriculum_courseinstructor programme_curriculum_cou_course_id_id_instructor__b5ddad86_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseinstructor
    ADD CONSTRAINT programme_curriculum_cou_course_id_id_instructor__b5ddad86_uniq UNIQUE (course_id_id, instructor_id_id, year, semester_type);


--
-- Name: programme_curriculum_courseslot_courses programme_curriculum_cou_courseslot_id_course_id_44edf7bd_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseslot_courses
    ADD CONSTRAINT programme_curriculum_cou_courseslot_id_course_id_44edf7bd_uniq UNIQUE (courseslot_id, course_id);


--
-- Name: programme_curriculum_course_pre_requisit_courses programme_curriculum_cou_from_course_id_to_course_371c26f8_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course_pre_requisit_courses
    ADD CONSTRAINT programme_curriculum_cou_from_course_id_to_course_371c26f8_uniq UNIQUE (from_course_id, to_course_id);


--
-- Name: programme_curriculum_courseslot programme_curriculum_cou_semester_id_name_type_3c5c1b0f_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseslot
    ADD CONSTRAINT programme_curriculum_cou_semester_id_name_type_3c5c1b0f_uniq UNIQUE (semester_id, name, type);


--
-- Name: programme_curriculum_course programme_curriculum_course_code_version_7d8153d6_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course
    ADD CONSTRAINT programme_curriculum_course_code_version_7d8153d6_uniq UNIQUE (code, version);


--
-- Name: programme_curriculum_course_disciplines programme_curriculum_course_disciplines_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course_disciplines
    ADD CONSTRAINT programme_curriculum_course_disciplines_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_course programme_curriculum_course_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course
    ADD CONSTRAINT programme_curriculum_course_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_course_pre_requisit_courses programme_curriculum_course_pre_requisit_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course_pre_requisit_courses
    ADD CONSTRAINT programme_curriculum_course_pre_requisit_courses_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_courseauditlog programme_curriculum_courseauditlog_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseauditlog
    ADD CONSTRAINT programme_curriculum_courseauditlog_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_courseinstructor programme_curriculum_courseinstructor_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseinstructor
    ADD CONSTRAINT programme_curriculum_courseinstructor_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_courseslot_courses programme_curriculum_courseslot_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseslot_courses
    ADD CONSTRAINT programme_curriculum_courseslot_courses_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_courseslot programme_curriculum_courseslot_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseslot
    ADD CONSTRAINT programme_curriculum_courseslot_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_curriculum programme_curriculum_curriculum_name_version_f56a9ead_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_curriculum
    ADD CONSTRAINT programme_curriculum_curriculum_name_version_f56a9ead_uniq UNIQUE (name, version);


--
-- Name: programme_curriculum_curriculum programme_curriculum_curriculum_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_curriculum
    ADD CONSTRAINT programme_curriculum_curriculum_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_discipline_programmes programme_curriculum_dis_discipline_id_programme__b0aaba28_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_discipline_programmes
    ADD CONSTRAINT programme_curriculum_dis_discipline_id_programme__b0aaba28_uniq UNIQUE (discipline_id, programme_id);


--
-- Name: programme_curriculum_discipline programme_curriculum_discipline_name_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_discipline
    ADD CONSTRAINT programme_curriculum_discipline_name_key UNIQUE (name);


--
-- Name: programme_curriculum_discipline programme_curriculum_discipline_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_discipline
    ADD CONSTRAINT programme_curriculum_discipline_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_discipline_programmes programme_curriculum_discipline_programmes_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_discipline_programmes
    ADD CONSTRAINT programme_curriculum_discipline_programmes_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_newproposalfile programme_curriculum_new_code_uploader_name_8f2edc34_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_newproposalfile
    ADD CONSTRAINT programme_curriculum_new_code_uploader_name_8f2edc34_uniq UNIQUE (code, uploader, name);


--
-- Name: programme_curriculum_newproposalfile_pre_requisit_courses programme_curriculum_new_newproposalfile_id_cours_baaea01e_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_newproposalfile_pre_requisit_courses
    ADD CONSTRAINT programme_curriculum_new_newproposalfile_id_cours_baaea01e_uniq UNIQUE (newproposalfile_id, course_id);


--
-- Name: programme_curriculum_newproposalfile programme_curriculum_newproposalfile_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_newproposalfile
    ADD CONSTRAINT programme_curriculum_newproposalfile_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_newproposalfile_pre_requisit_courses programme_curriculum_newproposalfile_pre_requisit_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_newproposalfile_pre_requisit_courses
    ADD CONSTRAINT programme_curriculum_newproposalfile_pre_requisit_courses_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_proposal_tracking programme_curriculum_pro_file_id_current_id_curre_e3b5bf9e_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_proposal_tracking
    ADD CONSTRAINT programme_curriculum_pro_file_id_current_id_curre_e3b5bf9e_uniq UNIQUE (file_id, current_id, current_design, disciplines_id);


--
-- Name: programme_curriculum_programme programme_curriculum_programme_name_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_programme
    ADD CONSTRAINT programme_curriculum_programme_name_key UNIQUE (name);


--
-- Name: programme_curriculum_programme programme_curriculum_programme_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_programme
    ADD CONSTRAINT programme_curriculum_programme_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_proposal_tracking programme_curriculum_proposal_tracking_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_proposal_tracking
    ADD CONSTRAINT programme_curriculum_proposal_tracking_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_semester programme_curriculum_sem_curriculum_id_semester_n_2602e030_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_semester
    ADD CONSTRAINT programme_curriculum_sem_curriculum_id_semester_n_2602e030_uniq UNIQUE (curriculum_id, semester_no);


--
-- Name: programme_curriculum_semester programme_curriculum_semester_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_semester
    ADD CONSTRAINT programme_curriculum_semester_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_studentbatchupload programme_curriculum_studentbatchupload_jee_app_no_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_studentbatchupload
    ADD CONSTRAINT programme_curriculum_studentbatchupload_jee_app_no_key UNIQUE (jee_app_no);


--
-- Name: programme_curriculum_studentbatchupload programme_curriculum_studentbatchupload_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_studentbatchupload
    ADD CONSTRAINT programme_curriculum_studentbatchupload_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_studentbatchupload programme_curriculum_studentbatchupload_roll_number_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_studentbatchupload
    ADD CONSTRAINT programme_curriculum_studentbatchupload_roll_number_key UNIQUE (roll_number);


--
-- Name: programme_curriculum_studentstatuslog programme_curriculum_studentstatuslog_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_studentstatuslog
    ADD CONSTRAINT programme_curriculum_studentstatuslog_pkey PRIMARY KEY (id);


--
-- Name: programme_curriculum_uploadhistory programme_curriculum_uploadhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_uploadhistory
    ADD CONSTRAINT programme_curriculum_uploadhistory_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_consultancyproject_co_consultants research_procedures_cons_consultancyproject_id_fa_9e49a472_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_consultancyproject_co_consultants
    ADD CONSTRAINT research_procedures_cons_consultancyproject_id_fa_9e49a472_uniq UNIQUE (consultancyproject_id, faculty_id);


--
-- Name: research_procedures_consultancyproject_co_consultants research_procedures_consultancyproject_co_consultants_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_consultancyproject_co_consultants
    ADD CONSTRAINT research_procedures_consultancyproject_co_consultants_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_consultancyproject research_procedures_consultancyproject_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_consultancyproject
    ADD CONSTRAINT research_procedures_consultancyproject_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_consultancyproject research_procedures_consultancyproject_project_number_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_consultancyproject
    ADD CONSTRAINT research_procedures_consultancyproject_project_number_key UNIQUE (project_number);


--
-- Name: research_procedures_fundingagency research_procedures_fundingagency_name_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_fundingagency
    ADD CONSTRAINT research_procedures_fundingagency_name_key UNIQUE (name);


--
-- Name: research_procedures_fundingagency research_procedures_fundingagency_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_fundingagency
    ADD CONSTRAINT research_procedures_fundingagency_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_patent_faculty_inventors research_procedures_pate_patent_id_faculty_id_8e0da5a3_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent_faculty_inventors
    ADD CONSTRAINT research_procedures_pate_patent_id_faculty_id_8e0da5a3_uniq UNIQUE (patent_id, faculty_id);


--
-- Name: research_procedures_patent_student_inventors research_procedures_pate_patent_id_student_id_e3f57929_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent_student_inventors
    ADD CONSTRAINT research_procedures_pate_patent_id_student_id_e3f57929_uniq UNIQUE (patent_id, student_id);


--
-- Name: research_procedures_patent research_procedures_patent_application_number_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent
    ADD CONSTRAINT research_procedures_patent_application_number_key UNIQUE (application_number);


--
-- Name: research_procedures_patent_faculty_inventors research_procedures_patent_faculty_inventors_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent_faculty_inventors
    ADD CONSTRAINT research_procedures_patent_faculty_inventors_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_patent research_procedures_patent_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent
    ADD CONSTRAINT research_procedures_patent_pkey PRIMARY KEY (application_id);


--
-- Name: research_procedures_patent_student_inventors research_procedures_patent_student_inventors_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent_student_inventors
    ADD CONSTRAINT research_procedures_patent_student_inventors_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_patentstatusnotification research_procedures_patentstatusnotification_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patentstatusnotification
    ADD CONSTRAINT research_procedures_patentstatusnotification_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_projectexpenditure research_procedures_projectexpenditure_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_projectexpenditure
    ADD CONSTRAINT research_procedures_projectexpenditure_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_projectmilestone research_procedures_projectmilestone_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_projectmilestone
    ADD CONSTRAINT research_procedures_projectmilestone_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_projectreport research_procedures_projectreport_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_projectreport
    ADD CONSTRAINT research_procedures_projectreport_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_publication_faculty_authors research_procedures_publ_publication_id_faculty_i_b72a9144_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication_faculty_authors
    ADD CONSTRAINT research_procedures_publ_publication_id_faculty_i_b72a9144_uniq UNIQUE (publication_id, faculty_id);


--
-- Name: research_procedures_publication_student_authors research_procedures_publ_publication_id_student_i_1887b162_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication_student_authors
    ADD CONSTRAINT research_procedures_publ_publication_id_student_i_1887b162_uniq UNIQUE (publication_id, student_id);


--
-- Name: research_procedures_publication_faculty_authors research_procedures_publication_faculty_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication_faculty_authors
    ADD CONSTRAINT research_procedures_publication_faculty_authors_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_publication research_procedures_publication_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication
    ADD CONSTRAINT research_procedures_publication_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_publication_student_authors research_procedures_publication_student_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication_student_authors
    ADD CONSTRAINT research_procedures_publication_student_authors_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_researcharea_faculty_experts research_procedures_rese_researcharea_id_faculty__6b5d9893_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researcharea_faculty_experts
    ADD CONSTRAINT research_procedures_rese_researcharea_id_faculty__6b5d9893_uniq UNIQUE (researcharea_id, faculty_id);


--
-- Name: research_procedures_researchgroup_members research_procedures_rese_researchgroup_id_faculty_94e04a40_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_members
    ADD CONSTRAINT research_procedures_rese_researchgroup_id_faculty_94e04a40_uniq UNIQUE (researchgroup_id, faculty_id);


--
-- Name: research_procedures_researchgroup_students_under_group research_procedures_rese_researchgroup_id_user_id_6b8b304f_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_students_under_group
    ADD CONSTRAINT research_procedures_rese_researchgroup_id_user_id_6b8b304f_uniq UNIQUE (researchgroup_id, user_id);


--
-- Name: research_procedures_researchgroup_faculty_under_group research_procedures_rese_researchgroup_id_user_id_eca1732e_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_faculty_under_group
    ADD CONSTRAINT research_procedures_rese_researchgroup_id_user_id_eca1732e_uniq UNIQUE (researchgroup_id, user_id);


--
-- Name: research_procedures_researcharea_faculty_experts research_procedures_researcharea_faculty_experts_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researcharea_faculty_experts
    ADD CONSTRAINT research_procedures_researcharea_faculty_experts_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_researcharea research_procedures_researcharea_name_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researcharea
    ADD CONSTRAINT research_procedures_researcharea_name_key UNIQUE (name);


--
-- Name: research_procedures_researcharea research_procedures_researcharea_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researcharea
    ADD CONSTRAINT research_procedures_researcharea_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_researchgroup_faculty_under_group research_procedures_researchgroup_faculty_under_group_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_faculty_under_group
    ADD CONSTRAINT research_procedures_researchgroup_faculty_under_group_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_researchgroup_members research_procedures_researchgroup_members_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_members
    ADD CONSTRAINT research_procedures_researchgroup_members_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_researchgroup research_procedures_researchgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup
    ADD CONSTRAINT research_procedures_researchgroup_name_key UNIQUE (name);


--
-- Name: research_procedures_researchgroup research_procedures_researchgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup
    ADD CONSTRAINT research_procedures_researchgroup_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_researchgroup_students_under_group research_procedures_researchgroup_students_under_group_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_students_under_group
    ADD CONSTRAINT research_procedures_researchgroup_students_under_group_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_researchproject research_procedures_researchproject_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchproject
    ADD CONSTRAINT research_procedures_researchproject_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_researchscholar research_procedures_researchscholar_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchscholar
    ADD CONSTRAINT research_procedures_researchscholar_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_researchscholar research_procedures_researchscholar_student_id_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchscholar
    ADD CONSTRAINT research_procedures_researchscholar_student_id_key UNIQUE (student_id);


--
-- Name: research_procedures_sponsoredproject_co_principal_investigators research_procedures_spon_sponsoredproject_id_facu_776ec5aa_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject_co_principal_investigators
    ADD CONSTRAINT research_procedures_spon_sponsoredproject_id_facu_776ec5aa_uniq UNIQUE (sponsoredproject_id, faculty_id);


--
-- Name: research_procedures_sponsoredproject_research_scholars research_procedures_spon_sponsoredproject_id_stud_9f86e250_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject_research_scholars
    ADD CONSTRAINT research_procedures_spon_sponsoredproject_id_stud_9f86e250_uniq UNIQUE (sponsoredproject_id, student_id);


--
-- Name: research_procedures_sponsoredproject_co_principal_investigators research_procedures_sponsoredproject_co_principal_investig_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject_co_principal_investigators
    ADD CONSTRAINT research_procedures_sponsoredproject_co_principal_investig_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_sponsoredproject research_procedures_sponsoredproject_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject
    ADD CONSTRAINT research_procedures_sponsoredproject_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_sponsoredproject research_procedures_sponsoredproject_project_number_key; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject
    ADD CONSTRAINT research_procedures_sponsoredproject_project_number_key UNIQUE (project_number);


--
-- Name: research_procedures_sponsoredproject_research_scholars research_procedures_sponsoredproject_research_scholars_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject_research_scholars
    ADD CONSTRAINT research_procedures_sponsoredproject_research_scholars_pkey PRIMARY KEY (id);


--
-- Name: research_procedures_techtransfer research_procedures_techtransfer_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_techtransfer
    ADD CONSTRAINT research_procedures_techtransfer_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: student_password_history student_password_history_pkey; Type: CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.student_password_history
    ADD CONSTRAINT student_password_history_pkey PRIMARY KEY (id);


--
-- Name: Bonafide_student_id_id_e7dc5d93; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Bonafide_student_id_id_e7dc5d93" ON public."Bonafide" USING btree (student_id_id);


--
-- Name: Bonafide_student_id_id_e7dc5d93_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Bonafide_student_id_id_e7dc5d93_like" ON public."Bonafide" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: CourseRequested_course_id_id_953e05aa; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "CourseRequested_course_id_id_953e05aa" ON public."CourseRequested" USING btree (course_id_id);


--
-- Name: CourseRequested_student_id_id_23b2b735; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "CourseRequested_student_id_id_23b2b735" ON public."CourseRequested" USING btree (student_id_id);


--
-- Name: CourseRequested_student_id_id_23b2b735_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "CourseRequested_student_id_id_23b2b735_like" ON public."CourseRequested" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: Curriculum_Instructor_curriculum_id_id_128d5184; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Curriculum_Instructor_curriculum_id_id_128d5184" ON public."Curriculum_Instructor" USING btree (curriculum_id_id);


--
-- Name: Curriculum_Instructor_instructor_id_id_cd72fd9f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Curriculum_Instructor_instructor_id_id_cd72fd9f" ON public."Curriculum_Instructor" USING btree (instructor_id_id);


--
-- Name: Curriculum_Instructor_instructor_id_id_cd72fd9f_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Curriculum_Instructor_instructor_id_id_cd72fd9f_like" ON public."Curriculum_Instructor" USING btree (instructor_id_id varchar_pattern_ops);


--
-- Name: Curriculum_course_id_id_21ab5f52; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Curriculum_course_id_id_21ab5f52" ON public."Curriculum" USING btree (course_id_id);


--
-- Name: Dues_student_id_id_ede15042; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Dues_student_id_id_ede15042" ON public."Dues" USING btree (student_id_id);


--
-- Name: Dues_student_id_id_ede15042_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Dues_student_id_id_ede15042_like" ON public."Dues" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: FeePayments_semester_id_id_734ab49f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "FeePayments_semester_id_id_734ab49f" ON public."FeePayments" USING btree (semester_id_id);


--
-- Name: FeePayments_student_id_id_734cc561; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "FeePayments_student_id_id_734cc561" ON public."FeePayments" USING btree (student_id_id);


--
-- Name: FeePayments_student_id_id_734cc561_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "FeePayments_student_id_id_734cc561_like" ON public."FeePayments" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: FinalRegistration_course_id_id_6b75db24; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "FinalRegistration_course_id_id_6b75db24" ON public."FinalRegistration" USING btree (course_id_id);


--
-- Name: FinalRegistration_course_slot_id_id_53c3eb70; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "FinalRegistration_course_slot_id_id_53c3eb70" ON public."FinalRegistration" USING btree (course_slot_id_id);


--
-- Name: FinalRegistration_old_course_registration_id_213368d3; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "FinalRegistration_old_course_registration_id_213368d3" ON public."FinalRegistration" USING btree (old_course_registration_id);


--
-- Name: FinalRegistration_semester_id_id_704f3de4; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "FinalRegistration_semester_id_id_704f3de4" ON public."FinalRegistration" USING btree (semester_id_id);


--
-- Name: FinalRegistration_student_id_id_95e42e0a; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "FinalRegistration_student_id_id_95e42e0a" ON public."FinalRegistration" USING btree (student_id_id);


--
-- Name: FinalRegistration_student_id_id_95e42e0a_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "FinalRegistration_student_id_id_95e42e0a_like" ON public."FinalRegistration" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: FinalRegistrations_curr_id_id_eaf19857; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "FinalRegistrations_curr_id_id_eaf19857" ON public."FinalRegistrations" USING btree (curr_id_id);


--
-- Name: FinalRegistrations_student_id_id_7d39e357; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "FinalRegistrations_student_id_id_7d39e357" ON public."FinalRegistrations" USING btree (student_id_id);


--
-- Name: FinalRegistrations_student_id_id_7d39e357_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "FinalRegistrations_student_id_id_7d39e357_like" ON public."FinalRegistrations" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: Grades_curriculum_id_id_194eb6cf; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Grades_curriculum_id_id_194eb6cf" ON public."Grades" USING btree (curriculum_id_id);


--
-- Name: Grades_student_id_id_a6479b11; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Grades_student_id_id_a6479b11" ON public."Grades" USING btree (student_id_id);


--
-- Name: Grades_student_id_id_a6479b11_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Grades_student_id_id_a6479b11_like" ON public."Grades" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: InitialRegistration_course_id_id_c2edc141; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "InitialRegistration_course_id_id_c2edc141" ON public."InitialRegistration" USING btree (course_id_id);


--
-- Name: InitialRegistration_course_slot_id_id_f7c0bae6; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "InitialRegistration_course_slot_id_id_f7c0bae6" ON public."InitialRegistration" USING btree (course_slot_id_id);


--
-- Name: InitialRegistration_old_course_registration_id_4f45d501; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "InitialRegistration_old_course_registration_id_4f45d501" ON public."InitialRegistration" USING btree (old_course_registration_id);


--
-- Name: InitialRegistration_semester_id_id_8280407a; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "InitialRegistration_semester_id_id_8280407a" ON public."InitialRegistration" USING btree (semester_id_id);


--
-- Name: InitialRegistration_student_id_id_f3bd2189; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "InitialRegistration_student_id_id_f3bd2189" ON public."InitialRegistration" USING btree (student_id_id);


--
-- Name: InitialRegistration_student_id_id_f3bd2189_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "InitialRegistration_student_id_id_f3bd2189_like" ON public."InitialRegistration" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: InitialRegistrations_course_id_id_9275c2b6; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "InitialRegistrations_course_id_id_9275c2b6" ON public."InitialRegistrations" USING btree (course_id_id);


--
-- Name: InitialRegistrations_course_slot_id_id_18661dbc; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "InitialRegistrations_course_slot_id_id_18661dbc" ON public."InitialRegistrations" USING btree (course_slot_id_id);


--
-- Name: InitialRegistrations_semester_id_id_79913f54; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "InitialRegistrations_semester_id_id_79913f54" ON public."InitialRegistrations" USING btree (semester_id_id);


--
-- Name: InitialRegistrations_student_id_id_84ed2751; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "InitialRegistrations_student_id_id_84ed2751" ON public."InitialRegistrations" USING btree (student_id_id);


--
-- Name: InitialRegistrations_student_id_id_84ed2751_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "InitialRegistrations_student_id_id_84ed2751_like" ON public."InitialRegistrations" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: MarkSubmissionCheck_curr_id_id_129a7928; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "MarkSubmissionCheck_curr_id_id_129a7928" ON public."MarkSubmissionCheck" USING btree (curr_id_id);


--
-- Name: Register_curr_id_id_e7392a4f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Register_curr_id_id_e7392a4f" ON public."Register" USING btree (curr_id_id);


--
-- Name: Register_student_id_id_e911b4f9; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Register_student_id_id_e911b4f9" ON public."Register" USING btree (student_id_id);


--
-- Name: Register_student_id_id_e911b4f9_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Register_student_id_id_e911b4f9_like" ON public."Register" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: SemesterMarks_curr_id_id_a9a28394; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "SemesterMarks_curr_id_id_a9a28394" ON public."SemesterMarks" USING btree (curr_id_id);


--
-- Name: SemesterMarks_student_id_id_5440c6ca; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "SemesterMarks_student_id_id_5440c6ca" ON public."SemesterMarks" USING btree (student_id_id);


--
-- Name: SemesterMarks_student_id_id_5440c6ca_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "SemesterMarks_student_id_id_5440c6ca_like" ON public."SemesterMarks" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: Spi_student_id_id_30d58f0b; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Spi_student_id_id_30d58f0b" ON public."Spi" USING btree (student_id_id);


--
-- Name: Spi_student_id_id_30d58f0b_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Spi_student_id_id_30d58f0b_like" ON public."Spi" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: StudentRegistrationCheck_student_id_e5dec969; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "StudentRegistrationCheck_student_id_e5dec969" ON public."StudentRegistrationCheck" USING btree (student_id);


--
-- Name: StudentRegistrationCheck_student_id_e5dec969_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "StudentRegistrationCheck_student_id_e5dec969_like" ON public."StudentRegistrationCheck" USING btree (student_id varchar_pattern_ops);


--
-- Name: StudentRegistrationChecks_semester_id_id_dab11bc2; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "StudentRegistrationChecks_semester_id_id_dab11bc2" ON public."StudentRegistrationChecks" USING btree (semester_id_id);


--
-- Name: StudentRegistrationChecks_student_id_id_86e40c53; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "StudentRegistrationChecks_student_id_id_86e40c53" ON public."StudentRegistrationChecks" USING btree (student_id_id);


--
-- Name: StudentRegistrationChecks_student_id_id_86e40c53_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "StudentRegistrationChecks_student_id_id_86e40c53_like" ON public."StudentRegistrationChecks" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: Student_attendance_instructor_id_id_e870824a; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Student_attendance_instructor_id_id_e870824a" ON public."Student_attendance" USING btree (instructor_id_id);


--
-- Name: Student_attendance_student_id_id_42adc818; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Student_attendance_student_id_id_42adc818" ON public."Student_attendance" USING btree (student_id_id);


--
-- Name: Student_attendance_student_id_id_42adc818_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Student_attendance_student_id_id_42adc818_like" ON public."Student_attendance" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: TeachingCreditRegistration_approved_course_id_fbdd2ab1; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "TeachingCreditRegistration_approved_course_id_fbdd2ab1" ON public."TeachingCreditRegistration" USING btree (approved_course_id);


--
-- Name: TeachingCreditRegistration_curr_1_id_26a2fb1f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "TeachingCreditRegistration_curr_1_id_26a2fb1f" ON public."TeachingCreditRegistration" USING btree (curr_1_id);


--
-- Name: TeachingCreditRegistration_curr_2_id_397a387a; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "TeachingCreditRegistration_curr_2_id_397a387a" ON public."TeachingCreditRegistration" USING btree (curr_2_id);


--
-- Name: TeachingCreditRegistration_curr_3_id_1d6f9006; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "TeachingCreditRegistration_curr_3_id_1d6f9006" ON public."TeachingCreditRegistration" USING btree (curr_3_id);


--
-- Name: TeachingCreditRegistration_curr_4_id_63bc381e; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "TeachingCreditRegistration_curr_4_id_63bc381e" ON public."TeachingCreditRegistration" USING btree (curr_4_id);


--
-- Name: TeachingCreditRegistration_student_id_id_64f5b8c1; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "TeachingCreditRegistration_student_id_id_64f5b8c1" ON public."TeachingCreditRegistration" USING btree (student_id_id);


--
-- Name: TeachingCreditRegistration_student_id_id_64f5b8c1_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "TeachingCreditRegistration_student_id_id_64f5b8c1_like" ON public."TeachingCreditRegistration" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: TeachingCreditRegistration_supervisor_id_id_da1ff659; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "TeachingCreditRegistration_supervisor_id_id_da1ff659" ON public."TeachingCreditRegistration" USING btree (supervisor_id_id);


--
-- Name: TeachingCreditRegistration_supervisor_id_id_da1ff659_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "TeachingCreditRegistration_supervisor_id_id_da1ff659_like" ON public."TeachingCreditRegistration" USING btree (supervisor_id_id varchar_pattern_ops);


--
-- Name: ThesisTopicProcess_co_supervisor_id_id_718379e2; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_co_supervisor_id_id_718379e2" ON public."ThesisTopicProcess" USING btree (co_supervisor_id_id);


--
-- Name: ThesisTopicProcess_co_supervisor_id_id_718379e2_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_co_supervisor_id_id_718379e2_like" ON public."ThesisTopicProcess" USING btree (co_supervisor_id_id varchar_pattern_ops);


--
-- Name: ThesisTopicProcess_curr_id_id_f8fbe064; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_curr_id_id_f8fbe064" ON public."ThesisTopicProcess" USING btree (curr_id_id);


--
-- Name: ThesisTopicProcess_member1_id_bac473b8; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_member1_id_bac473b8" ON public."ThesisTopicProcess" USING btree (member1_id);


--
-- Name: ThesisTopicProcess_member1_id_bac473b8_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_member1_id_bac473b8_like" ON public."ThesisTopicProcess" USING btree (member1_id varchar_pattern_ops);


--
-- Name: ThesisTopicProcess_member2_id_aa353736; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_member2_id_aa353736" ON public."ThesisTopicProcess" USING btree (member2_id);


--
-- Name: ThesisTopicProcess_member2_id_aa353736_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_member2_id_aa353736_like" ON public."ThesisTopicProcess" USING btree (member2_id varchar_pattern_ops);


--
-- Name: ThesisTopicProcess_member3_id_b74d2f0b; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_member3_id_b74d2f0b" ON public."ThesisTopicProcess" USING btree (member3_id);


--
-- Name: ThesisTopicProcess_member3_id_b74d2f0b_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_member3_id_b74d2f0b_like" ON public."ThesisTopicProcess" USING btree (member3_id varchar_pattern_ops);


--
-- Name: ThesisTopicProcess_student_id_id_5d4bac21; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_student_id_id_5d4bac21" ON public."ThesisTopicProcess" USING btree (student_id_id);


--
-- Name: ThesisTopicProcess_student_id_id_5d4bac21_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_student_id_id_5d4bac21_like" ON public."ThesisTopicProcess" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: ThesisTopicProcess_supervisor_id_id_75c1eaee; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_supervisor_id_id_75c1eaee" ON public."ThesisTopicProcess" USING btree (supervisor_id_id);


--
-- Name: ThesisTopicProcess_supervisor_id_id_75c1eaee_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "ThesisTopicProcess_supervisor_id_id_75c1eaee_like" ON public."ThesisTopicProcess" USING btree (supervisor_id_id varchar_pattern_ops);


--
-- Name: Thesis_reg_id_id_eb607b89; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Thesis_reg_id_id_eb607b89" ON public."Thesis" USING btree (reg_id_id);


--
-- Name: Thesis_reg_id_id_eb607b89_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Thesis_reg_id_id_eb607b89_like" ON public."Thesis" USING btree (reg_id_id varchar_pattern_ops);


--
-- Name: Thesis_student_id_id_1047cb23; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Thesis_student_id_id_1047cb23" ON public."Thesis" USING btree (student_id_id);


--
-- Name: Thesis_student_id_id_1047cb23_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Thesis_student_id_id_1047cb23_like" ON public."Thesis" USING btree (student_id_id varchar_pattern_ops);


--
-- Name: Thesis_supervisor_id_id_f208cb55; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Thesis_supervisor_id_id_f208cb55" ON public."Thesis" USING btree (supervisor_id_id);


--
-- Name: Thesis_supervisor_id_id_f208cb55_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX "Thesis_supervisor_id_id_f208cb55_like" ON public."Thesis" USING btree (supervisor_id_id varchar_pattern_ops);


--
-- Name: academic_information_student_batch_id_id_e8d1ed44; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_information_student_batch_id_id_e8d1ed44 ON public.academic_information_student USING btree (batch_id_id);


--
-- Name: academic_information_student_id_id_04c54754_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_information_student_id_id_04c54754_like ON public.academic_information_student USING btree (id_id varchar_pattern_ops);


--
-- Name: academic_procedures_assi_ta_supervisor_id_c8ea0fa4_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_assi_ta_supervisor_id_c8ea0fa4_like ON public.academic_procedures_assistantshipclaim USING btree (ta_supervisor_id varchar_pattern_ops);


--
-- Name: academic_procedures_assi_thesis_supervisor_id_ba55b389_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_assi_thesis_supervisor_id_ba55b389_like ON public.academic_procedures_assistantshipclaim USING btree (thesis_supervisor_id varchar_pattern_ops);


--
-- Name: academic_procedures_assignment_faculty_id_e69441fa; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_assignment_faculty_id_e69441fa ON public.academic_procedures_assignment USING btree (faculty_id);


--
-- Name: academic_procedures_assignment_faculty_id_e69441fa_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_assignment_faculty_id_e69441fa_like ON public.academic_procedures_assignment USING btree (faculty_id varchar_pattern_ops);


--
-- Name: academic_procedures_assignment_ta_id_e0db8cdb; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_assignment_ta_id_e0db8cdb ON public.academic_procedures_assignment USING btree (ta_id);


--
-- Name: academic_procedures_assignment_ta_id_e0db8cdb_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_assignment_ta_id_e0db8cdb_like ON public.academic_procedures_assignment USING btree (ta_id varchar_pattern_ops);


--
-- Name: academic_procedures_assist_ta_supervisor_id_c8ea0fa4; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_assist_ta_supervisor_id_c8ea0fa4 ON public.academic_procedures_assistantshipclaim USING btree (ta_supervisor_id);


--
-- Name: academic_procedures_assist_thesis_supervisor_id_ba55b389; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_assist_thesis_supervisor_id_ba55b389 ON public.academic_procedures_assistantshipclaim USING btree (thesis_supervisor_id);


--
-- Name: academic_procedures_assistantshipclaim_student_id_1dbde173; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_assistantshipclaim_student_id_1dbde173 ON public.academic_procedures_assistantshipclaim USING btree (student_id);


--
-- Name: academic_procedures_assistantshipclaim_student_id_1dbde173_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_assistantshipclaim_student_id_1dbde173_like ON public.academic_procedures_assistantshipclaim USING btree (student_id varchar_pattern_ops);


--
-- Name: academic_procedures_backlog_course_course_id_id_2985910d; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_backlog_course_course_id_id_2985910d ON public.academic_procedures_backlog_course USING btree (course_id_id);


--
-- Name: academic_procedures_backlog_course_semester_id_id_b2f9a6a3; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_backlog_course_semester_id_id_b2f9a6a3 ON public.academic_procedures_backlog_course USING btree (semester_id_id);


--
-- Name: academic_procedures_backlog_course_student_id_id_a031085c; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_backlog_course_student_id_id_a031085c ON public.academic_procedures_backlog_course USING btree (student_id_id);


--
-- Name: academic_procedures_backlog_course_student_id_id_a031085c_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_backlog_course_student_id_id_a031085c_like ON public.academic_procedures_backlog_course USING btree (student_id_id varchar_pattern_ops);


--
-- Name: academic_procedures_batchchangehistory_new_batch_id_929dc9a4; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_batchchangehistory_new_batch_id_929dc9a4 ON public.academic_procedures_batchchangehistory USING btree (new_batch_id);


--
-- Name: academic_procedures_batchchangehistory_old_batch_id_11128ca7; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_batchchangehistory_old_batch_id_11128ca7 ON public.academic_procedures_batchchangehistory USING btree (old_batch_id);


--
-- Name: academic_procedures_batchchangehistory_student_id_f663b479; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_batchchangehistory_student_id_f663b479 ON public.academic_procedures_batchchangehistory USING btree (student_id);


--
-- Name: academic_procedures_batchchangehistory_student_id_f663b479_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_batchchangehistory_student_id_f663b479_like ON public.academic_procedures_batchchangehistory USING btree (student_id varchar_pattern_ops);


--
-- Name: academic_procedures_branchchange_branches_id_92718b37; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_branchchange_branches_id_92718b37 ON public.academic_procedures_branchchange USING btree (branches_id);


--
-- Name: academic_procedures_branchchange_user_id_d36b8040; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_branchchange_user_id_d36b8040 ON public.academic_procedures_branchchange USING btree (user_id);


--
-- Name: academic_procedures_branchchange_user_id_d36b8040_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_branchchange_user_id_d36b8040_like ON public.academic_procedures_branchchange USING btree (user_id varchar_pattern_ops);


--
-- Name: academic_procedures_cour_student_id_2b0d7040_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_cour_student_id_2b0d7040_like ON public.academic_procedures_coursereplacementrequest USING btree (student_id varchar_pattern_ops);


--
-- Name: academic_procedures_course_course_slot_id_79ff40ed; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_course_course_slot_id_79ff40ed ON public.academic_procedures_coursereplacementrequest USING btree (course_slot_id);


--
-- Name: academic_procedures_course_new_course_id_9838ade0; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_course_new_course_id_9838ade0 ON public.academic_procedures_coursereplacementrequest USING btree (new_course_id);


--
-- Name: academic_procedures_course_old_course_id_532de213; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_course_old_course_id_532de213 ON public.academic_procedures_coursereplacementrequest USING btree (old_course_id);


--
-- Name: academic_procedures_course_old_course_registration_id_e457dda7; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_course_old_course_registration_id_e457dda7 ON public.academic_procedures_courseaddrequest USING btree (old_course_registration_id);


--
-- Name: academic_procedures_course_student_id_2b0d7040; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_course_student_id_2b0d7040 ON public.academic_procedures_coursereplacementrequest USING btree (student_id);


--
-- Name: academic_procedures_courseaddrequest_course_id_d09ae823; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_courseaddrequest_course_id_d09ae823 ON public.academic_procedures_courseaddrequest USING btree (course_id);


--
-- Name: academic_procedures_courseaddrequest_course_slot_id_38c9b92a; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_courseaddrequest_course_slot_id_38c9b92a ON public.academic_procedures_courseaddrequest USING btree (course_slot_id);


--
-- Name: academic_procedures_courseaddrequest_student_id_b35410db; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_courseaddrequest_student_id_b35410db ON public.academic_procedures_courseaddrequest USING btree (student_id);


--
-- Name: academic_procedures_courseaddrequest_student_id_b35410db_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_courseaddrequest_student_id_b35410db_like ON public.academic_procedures_courseaddrequest USING btree (student_id varchar_pattern_ops);


--
-- Name: academic_procedures_coursedroprequest_course_id_818308bf; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_coursedroprequest_course_id_818308bf ON public.academic_procedures_coursedroprequest USING btree (course_id);


--
-- Name: academic_procedures_coursedroprequest_course_slot_id_6379bc27; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_coursedroprequest_course_slot_id_6379bc27 ON public.academic_procedures_coursedroprequest USING btree (course_slot_id);


--
-- Name: academic_procedures_coursedroprequest_student_id_25548d6c; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_coursedroprequest_student_id_25548d6c ON public.academic_procedures_coursedroprequest USING btree (student_id);


--
-- Name: academic_procedures_coursedroprequest_student_id_25548d6c_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_coursedroprequest_student_id_25548d6c_like ON public.academic_procedures_coursedroprequest USING btree (student_id varchar_pattern_ops);


--
-- Name: academic_procedures_coursesmtech_c_id_id_d239075c; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_coursesmtech_c_id_id_d239075c ON public.academic_procedures_coursesmtech USING btree (c_id_id);


--
-- Name: academic_procedures_feedbackfilled_student_id_e7c9bc48; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_feedbackfilled_student_id_e7c9bc48 ON public.academic_procedures_feedbackfilled USING btree (student_id);


--
-- Name: academic_procedures_feedbackfilled_student_id_e7c9bc48_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_feedbackfilled_student_id_e7c9bc48_like ON public.academic_procedures_feedbackfilled USING btree (student_id varchar_pattern_ops);


--
-- Name: academic_procedures_feedbackoption_question_id_44ae1845; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_feedbackoption_question_id_44ae1845 ON public.academic_procedures_feedbackoption USING btree (question_id);


--
-- Name: academic_procedures_feedbackresponse_course_id_7b57f420; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_feedbackresponse_course_id_7b57f420 ON public.academic_procedures_feedbackresponse USING btree (course_id);


--
-- Name: academic_procedures_feedbackresponse_option_id_2feebe0b; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_feedbackresponse_option_id_2feebe0b ON public.academic_procedures_feedbackresponse USING btree (option_id);


--
-- Name: academic_procedures_feedbackresponse_question_id_87e845ad; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_feedbackresponse_question_id_87e845ad ON public.academic_procedures_feedbackresponse USING btree (question_id);


--
-- Name: academic_procedures_feepayment_student_id_id_58b69789; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_feepayment_student_id_id_58b69789 ON public.academic_procedures_feepayment USING btree (student_id_id);


--
-- Name: academic_procedures_feepayment_student_id_id_58b69789_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_feepayment_student_id_id_58b69789_like ON public.academic_procedures_feepayment USING btree (student_id_id varchar_pattern_ops);


--
-- Name: academic_procedures_messdue_student_id_7ae4f862; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_messdue_student_id_7ae4f862 ON public.academic_procedures_messdue USING btree (student_id);


--
-- Name: academic_procedures_messdue_student_id_7ae4f862_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_messdue_student_id_7ae4f862_like ON public.academic_procedures_messdue USING btree (student_id varchar_pattern_ops);


--
-- Name: academic_procedures_mtec_student_id_eb1278a7_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_mtec_student_id_eb1278a7_like ON public.academic_procedures_mtechgraduateseminarreport USING btree (student_id varchar_pattern_ops);


--
-- Name: academic_procedures_mtechg_student_id_eb1278a7; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_mtechg_student_id_eb1278a7 ON public.academic_procedures_mtechgraduateseminarreport USING btree (student_id);


--
-- Name: academic_procedures_phdp_student_id_1eb4ce4f_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_phdp_student_id_1eb4ce4f_like ON public.academic_procedures_phdprogressexamination USING btree (student_id varchar_pattern_ops);


--
-- Name: academic_procedures_phdprogressexamination_student_id_1eb4ce4f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_phdprogressexamination_student_id_1eb4ce4f ON public.academic_procedures_phdprogressexamination USING btree (student_id);


--
-- Name: academic_procedures_stipendrequest_assignment_id_d3b499ee; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX academic_procedures_stipendrequest_assignment_id_d3b499ee ON public.academic_procedures_stipendrequest USING btree (assignment_id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: bulk_password_email_operation_initiated_by_id_b65a78bc; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX bulk_password_email_operation_initiated_by_id_b65a78bc ON public.bulk_password_email_operation USING btree (initiated_by_id);


--
-- Name: bulk_password_email_operation_operation_id_e69aee7f_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX bulk_password_email_operation_operation_id_e69aee7f_like ON public.bulk_password_email_operation USING btree (operation_id varchar_pattern_ops);


--
-- Name: course_registration_course_id_id_e98745d3; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX course_registration_course_id_id_e98745d3 ON public.course_registration USING btree (course_id_id);


--
-- Name: course_registration_course_slot_id_id_4641fc7a; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX course_registration_course_slot_id_id_4641fc7a ON public.course_registration USING btree (course_slot_id_id);


--
-- Name: course_registration_semester_id_id_89066c7f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX course_registration_semester_id_id_89066c7f ON public.course_registration USING btree (semester_id_id);


--
-- Name: course_registration_student_id_id_b6b15d28; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX course_registration_student_id_id_b6b15d28 ON public.course_registration USING btree (student_id_id);


--
-- Name: course_registration_student_id_id_b6b15d28_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX course_registration_student_id_id_b6b15d28_like ON public.course_registration USING btree (student_id_id varchar_pattern_ops);


--
-- Name: course_replacement_new_course_registration_id_1fc3b78d; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX course_replacement_new_course_registration_id_1fc3b78d ON public.course_replacement USING btree (new_course_registration_id);


--
-- Name: course_replacement_old_course_registration_id_8411b7e6; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX course_replacement_old_course_registration_id_8411b7e6 ON public.course_replacement USING btree (old_course_registration_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: email_template_created_by_id_f3f424bd; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX email_template_created_by_id_f3f424bd ON public.email_template USING btree (created_by_id);


--
-- Name: email_template_template_type_9cf4fdc0_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX email_template_template_type_9cf4fdc0_like ON public.email_template USING btree (template_type varchar_pattern_ops);


--
-- Name: globals_departmentinfo_name_2dde3266_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_departmentinfo_name_2dde3266_like ON public.globals_departmentinfo USING btree (name varchar_pattern_ops);


--
-- Name: globals_designation_name_8511bc3d_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_designation_name_8511bc3d_like ON public.globals_designation USING btree (name varchar_pattern_ops);


--
-- Name: globals_extrainfo_department_id_848d9717; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_extrainfo_department_id_848d9717 ON public.globals_extrainfo USING btree (department_id);


--
-- Name: globals_extrainfo_id_258a894d_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_extrainfo_id_258a894d_like ON public.globals_extrainfo USING btree (id varchar_pattern_ops);


--
-- Name: globals_faculty_id_id_0fd6c5e4_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_faculty_id_id_0fd6c5e4_like ON public.globals_faculty USING btree (id_id varchar_pattern_ops);


--
-- Name: globals_holdsdesignation_designation_id_074911c0; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_holdsdesignation_designation_id_074911c0 ON public.globals_holdsdesignation USING btree (designation_id);


--
-- Name: globals_holdsdesignation_user_id_0816ffa6; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_holdsdesignation_user_id_0816ffa6 ON public.globals_holdsdesignation USING btree (user_id);


--
-- Name: globals_holdsdesignation_working_id_70883028; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_holdsdesignation_working_id_70883028 ON public.globals_holdsdesignation USING btree (working_id);


--
-- Name: globals_issue_images_issue_id_a7df473d; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_issue_images_issue_id_a7df473d ON public.globals_issue_images USING btree (issue_id);


--
-- Name: globals_issue_images_issueimage_id_0ed13bbe; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_issue_images_issueimage_id_0ed13bbe ON public.globals_issue_images USING btree (issueimage_id);


--
-- Name: globals_issue_support_issue_id_2ed52d1d; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_issue_support_issue_id_2ed52d1d ON public.globals_issue_support USING btree (issue_id);


--
-- Name: globals_issue_support_user_id_db434ee4; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_issue_support_user_id_db434ee4 ON public.globals_issue_support USING btree (user_id);


--
-- Name: globals_issue_user_id_98110616; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_issue_user_id_98110616 ON public.globals_issue USING btree (user_id);


--
-- Name: globals_issueimage_user_id_be9b82a4; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_issueimage_user_id_be9b82a4 ON public.globals_issueimage USING btree (user_id);


--
-- Name: globals_passwordresettracker_email_31978cda_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_passwordresettracker_email_31978cda_like ON public.globals_passwordresettracker USING btree (email varchar_pattern_ops);


--
-- Name: globals_staff_id_id_41d590e6_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX globals_staff_id_id_41d590e6_like ON public.globals_staff USING btree (id_id varchar_pattern_ops);


--
-- Name: notifications_notification_action_object_content_type_7d2b8ee9; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX notifications_notification_action_object_content_type_7d2b8ee9 ON public.notifications_notification USING btree (action_object_content_type_id);


--
-- Name: notifications_notification_actor_content_type_id_0c69d7b7; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX notifications_notification_actor_content_type_id_0c69d7b7 ON public.notifications_notification USING btree (actor_content_type_id);


--
-- Name: notifications_notification_deleted_b32b69e6; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX notifications_notification_deleted_b32b69e6 ON public.notifications_notification USING btree (deleted);


--
-- Name: notifications_notification_emailed_23a5ad81; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX notifications_notification_emailed_23a5ad81 ON public.notifications_notification USING btree (emailed);


--
-- Name: notifications_notification_public_1bc30b1c; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX notifications_notification_public_1bc30b1c ON public.notifications_notification USING btree (public);


--
-- Name: notifications_notification_recipient_id_d055f3f0; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX notifications_notification_recipient_id_d055f3f0 ON public.notifications_notification USING btree (recipient_id);


--
-- Name: notifications_notification_recipient_id_unread_253aadc9_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX notifications_notification_recipient_id_unread_253aadc9_idx ON public.notifications_notification USING btree (recipient_id, unread);


--
-- Name: notifications_notification_target_content_type_id_ccb24d88; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX notifications_notification_target_content_type_id_ccb24d88 ON public.notifications_notification USING btree (target_content_type_id);


--
-- Name: notifications_notification_timestamp_6a797bad; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX notifications_notification_timestamp_6a797bad ON public.notifications_notification USING btree ("timestamp");


--
-- Name: notifications_notification_unread_cce4be30; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX notifications_notification_unread_cce4be30 ON public.notifications_notification USING btree (unread);


--
-- Name: password_em_email_s_0aff1d_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX password_em_email_s_0aff1d_idx ON public.password_email_log USING btree (email_status);


--
-- Name: password_em_sent_at_a4c3ff_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX password_em_sent_at_a4c3ff_idx ON public.password_email_log USING btree (sent_at);


--
-- Name: password_em_student_6e6088_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX password_em_student_6e6088_idx ON public.password_email_log USING btree (student_id);


--
-- Name: password_email_log_sent_by_id_d61fd276; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX password_email_log_sent_by_id_d61fd276 ON public.password_email_log USING btree (sent_by_id);


--
-- Name: password_email_log_student_id_8e143988; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX password_email_log_student_id_8e143988 ON public.password_email_log USING btree (student_id);


--
-- Name: programme_c_branch_76eb51_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_c_branch_76eb51_idx ON public.programme_curriculum_studentbatchupload USING btree (branch);


--
-- Name: programme_c_jee_app_cec0ce_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_c_jee_app_cec0ce_idx ON public.programme_curriculum_studentbatchupload USING btree (jee_app_no);


--
-- Name: programme_c_program_8a36dc_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_c_program_8a36dc_idx ON public.programme_curriculum_studentbatchupload USING btree (programme_type, batch_year);


--
-- Name: programme_c_reporte_681f29_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_c_reporte_681f29_idx ON public.programme_curriculum_studentbatchupload USING btree (reported_status);


--
-- Name: programme_c_roll_nu_d6ad8b_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_c_roll_nu_d6ad8b_idx ON public.programme_curriculum_studentbatchupload USING btree (roll_number);


--
-- Name: programme_curriculum_batch_curriculum_id_03f8df5b; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_batch_curriculum_id_03f8df5b ON public.programme_curriculum_batch USING btree (curriculum_id);


--
-- Name: programme_curriculum_batch_discipline_id_00b0cc15; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_batch_discipline_id_00b0cc15 ON public.programme_curriculum_batch USING btree (discipline_id);


--
-- Name: programme_curriculum_cou_instructor_id_id_e3179f3f_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_cou_instructor_id_id_e3179f3f_like ON public.programme_curriculum_courseinstructor USING btree (instructor_id_id varchar_pattern_ops);


--
-- Name: programme_curriculum_cours_from_course_id_c7f09cbc; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_cours_from_course_id_c7f09cbc ON public.programme_curriculum_course_pre_requisit_courses USING btree (from_course_id);


--
-- Name: programme_curriculum_cours_to_course_id_fca8aee3; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_cours_to_course_id_fca8aee3 ON public.programme_curriculum_course_pre_requisit_courses USING btree (to_course_id);


--
-- Name: programme_curriculum_course_disciplines_course_id_5aaac05c; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_course_disciplines_course_id_5aaac05c ON public.programme_curriculum_course_disciplines USING btree (course_id);


--
-- Name: programme_curriculum_course_disciplines_discipline_id_26d07759; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_course_disciplines_discipline_id_26d07759 ON public.programme_curriculum_course_disciplines USING btree (discipline_id);


--
-- Name: programme_curriculum_courseauditlog_course_id_38221d52; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_courseauditlog_course_id_38221d52 ON public.programme_curriculum_courseauditlog USING btree (course_id);


--
-- Name: programme_curriculum_courseauditlog_user_id_c698c64f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_courseauditlog_user_id_c698c64f ON public.programme_curriculum_courseauditlog USING btree (user_id);


--
-- Name: programme_curriculum_courseinstructor_course_id_id_5d7f8cee; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_courseinstructor_course_id_id_5d7f8cee ON public.programme_curriculum_courseinstructor USING btree (course_id_id);


--
-- Name: programme_curriculum_courseinstructor_instructor_id_id_e3179f3f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_courseinstructor_instructor_id_id_e3179f3f ON public.programme_curriculum_courseinstructor USING btree (instructor_id_id);


--
-- Name: programme_curriculum_courseslot_courses_course_id_03e7ed5d; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_courseslot_courses_course_id_03e7ed5d ON public.programme_curriculum_courseslot_courses USING btree (course_id);


--
-- Name: programme_curriculum_courseslot_courses_courseslot_id_b01ea486; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_courseslot_courses_courseslot_id_b01ea486 ON public.programme_curriculum_courseslot_courses USING btree (courseslot_id);


--
-- Name: programme_curriculum_courseslot_semester_id_68a306d2; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_courseslot_semester_id_68a306d2 ON public.programme_curriculum_courseslot USING btree (semester_id);


--
-- Name: programme_curriculum_curriculum_programme_id_0b691039; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_curriculum_programme_id_0b691039 ON public.programme_curriculum_curriculum USING btree (programme_id);


--
-- Name: programme_curriculum_disci_discipline_id_a1c00433; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_disci_discipline_id_a1c00433 ON public.programme_curriculum_discipline_programmes USING btree (discipline_id);


--
-- Name: programme_curriculum_disci_programme_id_b6c7f726; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_disci_programme_id_b6c7f726 ON public.programme_curriculum_discipline_programmes USING btree (programme_id);


--
-- Name: programme_curriculum_discipline_name_4f2d80c3_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_discipline_name_4f2d80c3_like ON public.programme_curriculum_discipline USING btree (name varchar_pattern_ops);


--
-- Name: programme_curriculum_newpr_course_id_e7de6bba; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_newpr_course_id_e7de6bba ON public.programme_curriculum_newproposalfile_pre_requisit_courses USING btree (course_id);


--
-- Name: programme_curriculum_newpr_newproposalfile_id_82cee83f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_newpr_newproposalfile_id_82cee83f ON public.programme_curriculum_newproposalfile_pre_requisit_courses USING btree (newproposalfile_id);


--
-- Name: programme_curriculum_programme_name_b80ddd4a_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_programme_name_b80ddd4a_like ON public.programme_curriculum_programme USING btree (name varchar_pattern_ops);


--
-- Name: programme_curriculum_propo_receive_design_id_2c3bf0fe; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_propo_receive_design_id_2c3bf0fe ON public.programme_curriculum_proposal_tracking USING btree (receive_design_id);


--
-- Name: programme_curriculum_proposal_tracking_disciplines_id_1eb27a73; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_proposal_tracking_disciplines_id_1eb27a73 ON public.programme_curriculum_proposal_tracking USING btree (disciplines_id);


--
-- Name: programme_curriculum_proposal_tracking_receive_id_id_5d409990; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_proposal_tracking_receive_id_id_5d409990 ON public.programme_curriculum_proposal_tracking USING btree (receive_id_id);


--
-- Name: programme_curriculum_semester_curriculum_id_9e3f411f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_semester_curriculum_id_9e3f411f ON public.programme_curriculum_semester USING btree (curriculum_id);


--
-- Name: programme_curriculum_stu_jee_app_no_66473533_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_stu_jee_app_no_66473533_like ON public.programme_curriculum_studentbatchupload USING btree (jee_app_no varchar_pattern_ops);


--
-- Name: programme_curriculum_stu_roll_number_c610a473_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_stu_roll_number_c610a473_like ON public.programme_curriculum_studentbatchupload USING btree (roll_number varchar_pattern_ops);


--
-- Name: programme_curriculum_stude_user_account_id_6d1e1aa1; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_stude_user_account_id_6d1e1aa1 ON public.programme_curriculum_studentbatchupload USING btree (user_account_id);


--
-- Name: programme_curriculum_studentbatchupload_uploaded_by_id_86d83d53; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_studentbatchupload_uploaded_by_id_86d83d53 ON public.programme_curriculum_studentbatchupload USING btree (created_by_id);


--
-- Name: programme_curriculum_studentstatuslog_changed_by_id_ab8b75e5; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_studentstatuslog_changed_by_id_ab8b75e5 ON public.programme_curriculum_studentstatuslog USING btree (changed_by_id);


--
-- Name: programme_curriculum_studentstatuslog_student_id_8958c11a; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_studentstatuslog_student_id_8958c11a ON public.programme_curriculum_studentstatuslog USING btree (student_id);


--
-- Name: programme_curriculum_uploadhistory_uploaded_by_id_25f77bca; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX programme_curriculum_uploadhistory_uploaded_by_id_25f77bca ON public.programme_curriculum_uploadhistory USING btree (uploaded_by_id);


--
-- Name: research_pr_agency__1b6d48_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_agency__1b6d48_idx ON public.research_procedures_fundingagency USING btree (agency_type);


--
-- Name: research_pr_applica_56ede2_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_applica_56ede2_idx ON public.research_procedures_patent USING btree (application_number);


--
-- Name: research_pr_created_9c10cb_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_created_9c10cb_idx ON public.research_procedures_sponsoredproject USING btree (created_at);


--
-- Name: research_pr_doi_ded3d9_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_doi_ded3d9_idx ON public.research_procedures_publication USING btree (doi);


--
-- Name: research_pr_enrollm_174295_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_enrollm_174295_idx ON public.research_procedures_researchscholar USING btree (enrollment_date);


--
-- Name: research_pr_filing__2b7d7f_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_filing__2b7d7f_idx ON public.research_procedures_patent USING btree (filing_date);


--
-- Name: research_pr_is_acti_4e5dcf_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_is_acti_4e5dcf_idx ON public.research_procedures_researcharea USING btree (is_active);


--
-- Name: research_pr_is_acti_bb2355_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_is_acti_bb2355_idx ON public.research_procedures_researchgroup USING btree (is_active);


--
-- Name: research_pr_name_2f206b_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_name_2f206b_idx ON public.research_procedures_researcharea USING btree (name);


--
-- Name: research_pr_name_65ecd6_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_name_65ecd6_idx ON public.research_procedures_fundingagency USING btree (name);


--
-- Name: research_pr_name_7b6332_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_name_7b6332_idx ON public.research_procedures_researchgroup USING btree (name);


--
-- Name: research_pr_progres_625637_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_progres_625637_idx ON public.research_procedures_researchscholar USING btree (progress_status);


--
-- Name: research_pr_project_09d273_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_project_09d273_idx ON public.research_procedures_projectreport USING btree (project_id, period_from);


--
-- Name: research_pr_project_2cb96d_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_project_2cb96d_idx ON public.research_procedures_projectexpenditure USING btree (project_id, date);


--
-- Name: research_pr_project_3d396b_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_project_3d396b_idx ON public.research_procedures_projectmilestone USING btree (project_id, due_date);


--
-- Name: research_pr_project_97c4d2_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_project_97c4d2_idx ON public.research_procedures_consultancyproject USING btree (project_number);


--
-- Name: research_pr_project_c82a1c_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_project_c82a1c_idx ON public.research_procedures_sponsoredproject USING btree (project_number);


--
-- Name: research_pr_publica_5b5e6a_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_publica_5b5e6a_idx ON public.research_procedures_publication USING btree (publication_type);


--
-- Name: research_pr_status_2951c8_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_status_2951c8_idx ON public.research_procedures_sponsoredproject USING btree (status);


--
-- Name: research_pr_status_35cc5c_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_status_35cc5c_idx ON public.research_procedures_consultancyproject USING btree (status);


--
-- Name: research_pr_status_66cd3a_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_status_66cd3a_idx ON public.research_procedures_projectmilestone USING btree (status);


--
-- Name: research_pr_status_87655b_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_status_87655b_idx ON public.research_procedures_projectexpenditure USING btree (status);


--
-- Name: research_pr_status_bb68e6_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_status_bb68e6_idx ON public.research_procedures_projectreport USING btree (status);


--
-- Name: research_pr_status_fcdc6c_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_status_fcdc6c_idx ON public.research_procedures_patent USING btree (status);


--
-- Name: research_pr_year_de3e17_idx; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_pr_year_de3e17_idx ON public.research_procedures_publication USING btree (year);


--
-- Name: research_procedures_cons_consultant_id_589bf3f4_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_cons_consultant_id_589bf3f4_like ON public.research_procedures_consultancyproject USING btree (consultant_id varchar_pattern_ops);


--
-- Name: research_procedures_cons_faculty_id_09177f9c_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_cons_faculty_id_09177f9c_like ON public.research_procedures_consultancyproject_co_consultants USING btree (faculty_id varchar_pattern_ops);


--
-- Name: research_procedures_cons_project_number_e4326f4b_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_cons_project_number_e4326f4b_like ON public.research_procedures_consultancyproject USING btree (project_number varchar_pattern_ops);


--
-- Name: research_procedures_consul_consultancyproject_id_26b867dc; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_consul_consultancyproject_id_26b867dc ON public.research_procedures_consultancyproject_co_consultants USING btree (consultancyproject_id);


--
-- Name: research_procedures_consul_faculty_id_09177f9c; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_consul_faculty_id_09177f9c ON public.research_procedures_consultancyproject_co_consultants USING btree (faculty_id);


--
-- Name: research_procedures_consultancyproject_consultant_id_589bf3f4; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_consultancyproject_consultant_id_589bf3f4 ON public.research_procedures_consultancyproject USING btree (consultant_id);


--
-- Name: research_procedures_consultancyproject_user_id_0f22eb05; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_consultancyproject_user_id_0f22eb05 ON public.research_procedures_consultancyproject USING btree (user_id);


--
-- Name: research_procedures_fundingagency_name_09ea08e8_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_fundingagency_name_09ea08e8_like ON public.research_procedures_fundingagency USING btree (name varchar_pattern_ops);


--
-- Name: research_procedures_pate_faculty_id_187bba11_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_pate_faculty_id_187bba11_like ON public.research_procedures_patentstatusnotification USING btree (faculty_id varchar_pattern_ops);


--
-- Name: research_procedures_pate_faculty_id_93d863fe_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_pate_faculty_id_93d863fe_like ON public.research_procedures_patent_faculty_inventors USING btree (faculty_id varchar_pattern_ops);


--
-- Name: research_procedures_pate_student_id_958a4e48_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_pate_student_id_958a4e48_like ON public.research_procedures_patent_student_inventors USING btree (student_id varchar_pattern_ops);


--
-- Name: research_procedures_patent_application_number_8ac2d1b5_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_patent_application_number_8ac2d1b5_like ON public.research_procedures_patent USING btree (application_number varchar_pattern_ops);


--
-- Name: research_procedures_patent_faculty_id_187bba11; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_patent_faculty_id_187bba11 ON public.research_procedures_patentstatusnotification USING btree (faculty_id);


--
-- Name: research_procedures_patent_faculty_id_93d863fe; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_patent_faculty_id_93d863fe ON public.research_procedures_patent_faculty_inventors USING btree (faculty_id);


--
-- Name: research_procedures_patent_faculty_id_id_32a36e64; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_patent_faculty_id_id_32a36e64 ON public.research_procedures_patent USING btree (faculty_id_id);


--
-- Name: research_procedures_patent_faculty_id_id_32a36e64_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_patent_faculty_id_id_32a36e64_like ON public.research_procedures_patent USING btree (faculty_id_id varchar_pattern_ops);


--
-- Name: research_procedures_patent_faculty_inventors_patent_id_84540aea; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_patent_faculty_inventors_patent_id_84540aea ON public.research_procedures_patent_faculty_inventors USING btree (patent_id);


--
-- Name: research_procedures_patent_related_project_id_5c1b5045; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_patent_related_project_id_5c1b5045 ON public.research_procedures_patent USING btree (related_project_id);


--
-- Name: research_procedures_patent_student_id_958a4e48; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_patent_student_id_958a4e48 ON public.research_procedures_patent_student_inventors USING btree (student_id);


--
-- Name: research_procedures_patent_student_inventors_patent_id_f7ab3f6b; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_patent_student_inventors_patent_id_f7ab3f6b ON public.research_procedures_patent_student_inventors USING btree (patent_id);


--
-- Name: research_procedures_patentstatusnotification_patent_id_c7c5b774; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_patentstatusnotification_patent_id_c7c5b774 ON public.research_procedures_patentstatusnotification USING btree (patent_id);


--
-- Name: research_procedures_proj_approved_by_id_e0bc16ce_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_proj_approved_by_id_e0bc16ce_like ON public.research_procedures_projectexpenditure USING btree (approved_by_id varchar_pattern_ops);


--
-- Name: research_procedures_projectexpenditure_approved_by_id_e0bc16ce; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_projectexpenditure_approved_by_id_e0bc16ce ON public.research_procedures_projectexpenditure USING btree (approved_by_id);


--
-- Name: research_procedures_projectexpenditure_project_id_9eb137b7; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_projectexpenditure_project_id_9eb137b7 ON public.research_procedures_projectexpenditure USING btree (project_id);


--
-- Name: research_procedures_projectmilestone_project_id_f72f03f3; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_projectmilestone_project_id_f72f03f3 ON public.research_procedures_projectmilestone USING btree (project_id);


--
-- Name: research_procedures_projectreport_project_id_3a6b9091; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_projectreport_project_id_3a6b9091 ON public.research_procedures_projectreport USING btree (project_id);


--
-- Name: research_procedures_publ_faculty_id_1535b22e_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_publ_faculty_id_1535b22e_like ON public.research_procedures_publication_faculty_authors USING btree (faculty_id varchar_pattern_ops);


--
-- Name: research_procedures_publ_student_id_1217ee8e_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_publ_student_id_1217ee8e_like ON public.research_procedures_publication_student_authors USING btree (student_id varchar_pattern_ops);


--
-- Name: research_procedures_public_faculty_id_1535b22e; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_public_faculty_id_1535b22e ON public.research_procedures_publication_faculty_authors USING btree (faculty_id);


--
-- Name: research_procedures_public_publication_id_19a92b1d; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_public_publication_id_19a92b1d ON public.research_procedures_publication_student_authors USING btree (publication_id);


--
-- Name: research_procedures_public_publication_id_45901abb; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_public_publication_id_45901abb ON public.research_procedures_publication_faculty_authors USING btree (publication_id);


--
-- Name: research_procedures_public_student_id_1217ee8e; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_public_student_id_1217ee8e ON public.research_procedures_publication_student_authors USING btree (student_id);


--
-- Name: research_procedures_publication_associated_project_id_776c45ad; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_publication_associated_project_id_776c45ad ON public.research_procedures_publication USING btree (associated_project_id);


--
-- Name: research_procedures_publication_verified_by_id_23c04b78; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_publication_verified_by_id_23c04b78 ON public.research_procedures_publication USING btree (verified_by_id);


--
-- Name: research_procedures_publication_verified_by_id_23c04b78_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_publication_verified_by_id_23c04b78_like ON public.research_procedures_publication USING btree (verified_by_id varchar_pattern_ops);


--
-- Name: research_procedures_rese_faculty_id_892bc7ca_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_rese_faculty_id_892bc7ca_like ON public.research_procedures_researchgroup_members USING btree (faculty_id varchar_pattern_ops);


--
-- Name: research_procedures_rese_faculty_id_f77fb1db_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_rese_faculty_id_f77fb1db_like ON public.research_procedures_researcharea_faculty_experts USING btree (faculty_id varchar_pattern_ops);


--
-- Name: research_procedures_resear_faculty_id_f77fb1db; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_resear_faculty_id_f77fb1db ON public.research_procedures_researcharea_faculty_experts USING btree (faculty_id);


--
-- Name: research_procedures_resear_researcharea_id_1cd876be; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_resear_researcharea_id_1cd876be ON public.research_procedures_researcharea_faculty_experts USING btree (researcharea_id);


--
-- Name: research_procedures_resear_researchgroup_id_370d6054; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_resear_researchgroup_id_370d6054 ON public.research_procedures_researchgroup_members USING btree (researchgroup_id);


--
-- Name: research_procedures_resear_researchgroup_id_55b57b6f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_resear_researchgroup_id_55b57b6f ON public.research_procedures_researchgroup_faculty_under_group USING btree (researchgroup_id);


--
-- Name: research_procedures_resear_researchgroup_id_c098364d; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_resear_researchgroup_id_c098364d ON public.research_procedures_researchgroup_students_under_group USING btree (researchgroup_id);


--
-- Name: research_procedures_resear_user_id_af43ac6d; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_resear_user_id_af43ac6d ON public.research_procedures_researchgroup_students_under_group USING btree (user_id);


--
-- Name: research_procedures_resear_user_id_d79292dc; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_resear_user_id_d79292dc ON public.research_procedures_researchgroup_faculty_under_group USING btree (user_id);


--
-- Name: research_procedures_researcharea_discipline_id_6b28cd86; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_researcharea_discipline_id_6b28cd86 ON public.research_procedures_researcharea USING btree (discipline_id);


--
-- Name: research_procedures_researcharea_name_ccd60f75_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_researcharea_name_ccd60f75_like ON public.research_procedures_researcharea USING btree (name varchar_pattern_ops);


--
-- Name: research_procedures_researcharea_parent_area_id_c20e22a3; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_researcharea_parent_area_id_c20e22a3 ON public.research_procedures_researcharea USING btree (parent_area_id);


--
-- Name: research_procedures_researchgroup_discipline_id_bb2a734c; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_researchgroup_discipline_id_bb2a734c ON public.research_procedures_researchgroup USING btree (discipline_id);


--
-- Name: research_procedures_researchgroup_head_id_c6435d7f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_researchgroup_head_id_c6435d7f ON public.research_procedures_researchgroup USING btree (head_id);


--
-- Name: research_procedures_researchgroup_head_id_c6435d7f_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_researchgroup_head_id_c6435d7f_like ON public.research_procedures_researchgroup USING btree (head_id varchar_pattern_ops);


--
-- Name: research_procedures_researchgroup_members_faculty_id_892bc7ca; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_researchgroup_members_faculty_id_892bc7ca ON public.research_procedures_researchgroup_members USING btree (faculty_id);


--
-- Name: research_procedures_researchgroup_name_1ac902f4_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_researchgroup_name_1ac902f4_like ON public.research_procedures_researchgroup USING btree (name varchar_pattern_ops);


--
-- Name: research_procedures_researchproject_user_id_8e57090c; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_researchproject_user_id_8e57090c ON public.research_procedures_researchproject USING btree (user_id);


--
-- Name: research_procedures_researchscholar_student_id_0f8c1965_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_researchscholar_student_id_0f8c1965_like ON public.research_procedures_researchscholar USING btree (student_id varchar_pattern_ops);


--
-- Name: research_procedures_spon_faculty_id_7884b47d_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_spon_faculty_id_7884b47d_like ON public.research_procedures_sponsoredproject_co_principal_investigators USING btree (faculty_id varchar_pattern_ops);


--
-- Name: research_procedures_spon_principal_investigator_i_80c09eb9_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_spon_principal_investigator_i_80c09eb9_like ON public.research_procedures_sponsoredproject USING btree (principal_investigator_id varchar_pattern_ops);


--
-- Name: research_procedures_spon_project_number_89f3a857_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_spon_project_number_89f3a857_like ON public.research_procedures_sponsoredproject USING btree (project_number varchar_pattern_ops);


--
-- Name: research_procedures_spon_student_id_d61eed6f_like; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_spon_student_id_d61eed6f_like ON public.research_procedures_sponsoredproject_research_scholars USING btree (student_id varchar_pattern_ops);


--
-- Name: research_procedures_sponso_faculty_id_7884b47d; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_sponso_faculty_id_7884b47d ON public.research_procedures_sponsoredproject_co_principal_investigators USING btree (faculty_id);


--
-- Name: research_procedures_sponso_principal_investigator_id_80c09eb9; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_sponso_principal_investigator_id_80c09eb9 ON public.research_procedures_sponsoredproject USING btree (principal_investigator_id);


--
-- Name: research_procedures_sponso_sponsoredproject_id_3d4b8731; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_sponso_sponsoredproject_id_3d4b8731 ON public.research_procedures_sponsoredproject_research_scholars USING btree (sponsoredproject_id);


--
-- Name: research_procedures_sponso_sponsoredproject_id_841538ad; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_sponso_sponsoredproject_id_841538ad ON public.research_procedures_sponsoredproject_co_principal_investigators USING btree (sponsoredproject_id);


--
-- Name: research_procedures_sponso_student_id_d61eed6f; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_sponso_student_id_d61eed6f ON public.research_procedures_sponsoredproject_research_scholars USING btree (student_id);


--
-- Name: research_procedures_sponsoredproject_funding_agency_id_964d3a9a; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_sponsoredproject_funding_agency_id_964d3a9a ON public.research_procedures_sponsoredproject USING btree (funding_agency_id);


--
-- Name: research_procedures_sponsoredproject_research_area_id_b3e7baf7; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_sponsoredproject_research_area_id_b3e7baf7 ON public.research_procedures_sponsoredproject USING btree (research_area_id);


--
-- Name: research_procedures_sponsoredproject_research_group_id_a985dd47; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_sponsoredproject_research_group_id_a985dd47 ON public.research_procedures_sponsoredproject USING btree (research_group_id);


--
-- Name: research_procedures_sponsoredproject_user_id_0faf17ee; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_sponsoredproject_user_id_0faf17ee ON public.research_procedures_sponsoredproject USING btree (user_id);


--
-- Name: research_procedures_techtransfer_user_id_4dd23c9a; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX research_procedures_techtransfer_user_id_4dd23c9a ON public.research_procedures_techtransfer USING btree (user_id);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: student_password_history_created_by_id_1db4d0a7; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX student_password_history_created_by_id_1db4d0a7 ON public.student_password_history USING btree (created_by_id);


--
-- Name: student_password_history_student_id_4587b7fb; Type: INDEX; Schema: public; Owner: fusion_admin
--

CREATE INDEX student_password_history_student_id_4587b7fb ON public.student_password_history USING btree (student_id);


--
-- Name: Bonafide Bonafide_student_id_id_e7dc5d93_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Bonafide"
    ADD CONSTRAINT "Bonafide_student_id_id_e7dc5d93_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: CourseRequested CourseRequested_course_id_id_953e05aa_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."CourseRequested"
    ADD CONSTRAINT "CourseRequested_course_id_id_953e05aa_fk_programme" FOREIGN KEY (course_id_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: CourseRequested CourseRequested_student_id_id_23b2b735_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."CourseRequested"
    ADD CONSTRAINT "CourseRequested_student_id_id_23b2b735_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Curriculum_Instructor Curriculum_Instructo_curriculum_id_id_128d5184_fk_Curriculu; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Curriculum_Instructor"
    ADD CONSTRAINT "Curriculum_Instructo_curriculum_id_id_128d5184_fk_Curriculu" FOREIGN KEY (curriculum_id_id) REFERENCES public."Curriculum"(curriculum_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Curriculum_Instructor Curriculum_Instructo_instructor_id_id_cd72fd9f_fk_globals_e; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Curriculum_Instructor"
    ADD CONSTRAINT "Curriculum_Instructo_instructor_id_id_cd72fd9f_fk_globals_e" FOREIGN KEY (instructor_id_id) REFERENCES public.globals_extrainfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Curriculum Curriculum_course_id_id_21ab5f52_fk_Course_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Curriculum"
    ADD CONSTRAINT "Curriculum_course_id_id_21ab5f52_fk_Course_id" FOREIGN KEY (course_id_id) REFERENCES public."Course"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Dues Dues_student_id_id_ede15042_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Dues"
    ADD CONSTRAINT "Dues_student_id_id_ede15042_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FeePayments FeePayments_semester_id_id_734ab49f_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FeePayments"
    ADD CONSTRAINT "FeePayments_semester_id_id_734ab49f_fk_programme" FOREIGN KEY (semester_id_id) REFERENCES public.programme_curriculum_semester(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FeePayments FeePayments_student_id_id_734cc561_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FeePayments"
    ADD CONSTRAINT "FeePayments_student_id_id_734cc561_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FinalRegistration FinalRegistration_course_id_id_6b75db24_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FinalRegistration"
    ADD CONSTRAINT "FinalRegistration_course_id_id_6b75db24_fk_programme" FOREIGN KEY (course_id_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FinalRegistration FinalRegistration_course_slot_id_id_53c3eb70_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FinalRegistration"
    ADD CONSTRAINT "FinalRegistration_course_slot_id_id_53c3eb70_fk_programme" FOREIGN KEY (course_slot_id_id) REFERENCES public.programme_curriculum_courseslot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FinalRegistration FinalRegistration_old_course_registrat_213368d3_fk_course_re; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FinalRegistration"
    ADD CONSTRAINT "FinalRegistration_old_course_registrat_213368d3_fk_course_re" FOREIGN KEY (old_course_registration_id) REFERENCES public.course_registration(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FinalRegistration FinalRegistration_semester_id_id_704f3de4_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FinalRegistration"
    ADD CONSTRAINT "FinalRegistration_semester_id_id_704f3de4_fk_programme" FOREIGN KEY (semester_id_id) REFERENCES public.programme_curriculum_semester(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FinalRegistration FinalRegistration_student_id_id_95e42e0a_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FinalRegistration"
    ADD CONSTRAINT "FinalRegistration_student_id_id_95e42e0a_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FinalRegistrations FinalRegistrations_curr_id_id_eaf19857_fk_Curriculu; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FinalRegistrations"
    ADD CONSTRAINT "FinalRegistrations_curr_id_id_eaf19857_fk_Curriculu" FOREIGN KEY (curr_id_id) REFERENCES public."Curriculum"(curriculum_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: FinalRegistrations FinalRegistrations_student_id_id_7d39e357_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."FinalRegistrations"
    ADD CONSTRAINT "FinalRegistrations_student_id_id_7d39e357_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Grades Grades_curriculum_id_id_194eb6cf_fk_Curriculum_curriculum_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Grades"
    ADD CONSTRAINT "Grades_curriculum_id_id_194eb6cf_fk_Curriculum_curriculum_id" FOREIGN KEY (curriculum_id_id) REFERENCES public."Curriculum"(curriculum_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Grades Grades_student_id_id_a6479b11_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Grades"
    ADD CONSTRAINT "Grades_student_id_id_a6479b11_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InitialRegistration InitialRegistration_course_id_id_c2edc141_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistration"
    ADD CONSTRAINT "InitialRegistration_course_id_id_c2edc141_fk_programme" FOREIGN KEY (course_id_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InitialRegistration InitialRegistration_course_slot_id_id_f7c0bae6_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistration"
    ADD CONSTRAINT "InitialRegistration_course_slot_id_id_f7c0bae6_fk_programme" FOREIGN KEY (course_slot_id_id) REFERENCES public.programme_curriculum_courseslot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InitialRegistration InitialRegistration_old_course_registrat_4f45d501_fk_course_re; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistration"
    ADD CONSTRAINT "InitialRegistration_old_course_registrat_4f45d501_fk_course_re" FOREIGN KEY (old_course_registration_id) REFERENCES public.course_registration(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InitialRegistration InitialRegistration_semester_id_id_8280407a_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistration"
    ADD CONSTRAINT "InitialRegistration_semester_id_id_8280407a_fk_programme" FOREIGN KEY (semester_id_id) REFERENCES public.programme_curriculum_semester(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InitialRegistration InitialRegistration_student_id_id_f3bd2189_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistration"
    ADD CONSTRAINT "InitialRegistration_student_id_id_f3bd2189_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InitialRegistrations InitialRegistrations_course_id_id_9275c2b6_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistrations"
    ADD CONSTRAINT "InitialRegistrations_course_id_id_9275c2b6_fk_programme" FOREIGN KEY (course_id_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InitialRegistrations InitialRegistrations_course_slot_id_id_18661dbc_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistrations"
    ADD CONSTRAINT "InitialRegistrations_course_slot_id_id_18661dbc_fk_programme" FOREIGN KEY (course_slot_id_id) REFERENCES public.programme_curriculum_courseslot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InitialRegistrations InitialRegistrations_semester_id_id_79913f54_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistrations"
    ADD CONSTRAINT "InitialRegistrations_semester_id_id_79913f54_fk_programme" FOREIGN KEY (semester_id_id) REFERENCES public.programme_curriculum_semester(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: InitialRegistrations InitialRegistrations_student_id_id_84ed2751_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."InitialRegistrations"
    ADD CONSTRAINT "InitialRegistrations_student_id_id_84ed2751_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MarkSubmissionCheck MarkSubmissionCheck_curr_id_id_129a7928_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."MarkSubmissionCheck"
    ADD CONSTRAINT "MarkSubmissionCheck_curr_id_id_129a7928_fk_programme" FOREIGN KEY (curr_id_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Register Register_curr_id_id_e7392a4f_fk_Curriculum_curriculum_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Register"
    ADD CONSTRAINT "Register_curr_id_id_e7392a4f_fk_Curriculum_curriculum_id" FOREIGN KEY (curr_id_id) REFERENCES public."Curriculum"(curriculum_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Register Register_student_id_id_e911b4f9_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Register"
    ADD CONSTRAINT "Register_student_id_id_e911b4f9_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SemesterMarks SemesterMarks_curr_id_id_a9a28394_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."SemesterMarks"
    ADD CONSTRAINT "SemesterMarks_curr_id_id_a9a28394_fk_programme" FOREIGN KEY (curr_id_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SemesterMarks SemesterMarks_student_id_id_5440c6ca_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."SemesterMarks"
    ADD CONSTRAINT "SemesterMarks_student_id_id_5440c6ca_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Spi Spi_student_id_id_30d58f0b_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Spi"
    ADD CONSTRAINT "Spi_student_id_id_30d58f0b_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StudentRegistrationChecks StudentRegistrationC_semester_id_id_dab11bc2_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."StudentRegistrationChecks"
    ADD CONSTRAINT "StudentRegistrationC_semester_id_id_dab11bc2_fk_programme" FOREIGN KEY (semester_id_id) REFERENCES public.programme_curriculum_semester(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StudentRegistrationCheck StudentRegistrationC_student_id_e5dec969_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."StudentRegistrationCheck"
    ADD CONSTRAINT "StudentRegistrationC_student_id_e5dec969_fk_academic_" FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StudentRegistrationChecks StudentRegistrationC_student_id_id_86e40c53_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."StudentRegistrationChecks"
    ADD CONSTRAINT "StudentRegistrationC_student_id_id_86e40c53_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Student_attendance Student_attendance_instructor_id_id_e870824a_fk_Curriculu; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Student_attendance"
    ADD CONSTRAINT "Student_attendance_instructor_id_id_e870824a_fk_Curriculu" FOREIGN KEY (instructor_id_id) REFERENCES public."Curriculum_Instructor"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Student_attendance Student_attendance_student_id_id_42adc818_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Student_attendance"
    ADD CONSTRAINT "Student_attendance_student_id_id_42adc818_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TeachingCreditRegistration TeachingCreditRegist_approved_course_id_fbdd2ab1_fk_Curriculu; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."TeachingCreditRegistration"
    ADD CONSTRAINT "TeachingCreditRegist_approved_course_id_fbdd2ab1_fk_Curriculu" FOREIGN KEY (approved_course_id) REFERENCES public."Curriculum"(curriculum_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TeachingCreditRegistration TeachingCreditRegist_curr_1_id_26a2fb1f_fk_Curriculu; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."TeachingCreditRegistration"
    ADD CONSTRAINT "TeachingCreditRegist_curr_1_id_26a2fb1f_fk_Curriculu" FOREIGN KEY (curr_1_id) REFERENCES public."Curriculum"(curriculum_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TeachingCreditRegistration TeachingCreditRegist_curr_2_id_397a387a_fk_Curriculu; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."TeachingCreditRegistration"
    ADD CONSTRAINT "TeachingCreditRegist_curr_2_id_397a387a_fk_Curriculu" FOREIGN KEY (curr_2_id) REFERENCES public."Curriculum"(curriculum_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TeachingCreditRegistration TeachingCreditRegist_curr_3_id_1d6f9006_fk_Curriculu; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."TeachingCreditRegistration"
    ADD CONSTRAINT "TeachingCreditRegist_curr_3_id_1d6f9006_fk_Curriculu" FOREIGN KEY (curr_3_id) REFERENCES public."Curriculum"(curriculum_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TeachingCreditRegistration TeachingCreditRegist_curr_4_id_63bc381e_fk_Curriculu; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."TeachingCreditRegistration"
    ADD CONSTRAINT "TeachingCreditRegist_curr_4_id_63bc381e_fk_Curriculu" FOREIGN KEY (curr_4_id) REFERENCES public."Curriculum"(curriculum_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TeachingCreditRegistration TeachingCreditRegist_student_id_id_64f5b8c1_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."TeachingCreditRegistration"
    ADD CONSTRAINT "TeachingCreditRegist_student_id_id_64f5b8c1_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: TeachingCreditRegistration TeachingCreditRegist_supervisor_id_id_da1ff659_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."TeachingCreditRegistration"
    ADD CONSTRAINT "TeachingCreditRegist_supervisor_id_id_da1ff659_fk_globals_f" FOREIGN KEY (supervisor_id_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ThesisTopicProcess ThesisTopicProcess_co_supervisor_id_id_718379e2_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."ThesisTopicProcess"
    ADD CONSTRAINT "ThesisTopicProcess_co_supervisor_id_id_718379e2_fk_globals_f" FOREIGN KEY (co_supervisor_id_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ThesisTopicProcess ThesisTopicProcess_curr_id_id_f8fbe064_fk_Curriculu; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."ThesisTopicProcess"
    ADD CONSTRAINT "ThesisTopicProcess_curr_id_id_f8fbe064_fk_Curriculu" FOREIGN KEY (curr_id_id) REFERENCES public."Curriculum"(curriculum_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ThesisTopicProcess ThesisTopicProcess_member1_id_bac473b8_fk_globals_faculty_id_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."ThesisTopicProcess"
    ADD CONSTRAINT "ThesisTopicProcess_member1_id_bac473b8_fk_globals_faculty_id_id" FOREIGN KEY (member1_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ThesisTopicProcess ThesisTopicProcess_member2_id_aa353736_fk_globals_faculty_id_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."ThesisTopicProcess"
    ADD CONSTRAINT "ThesisTopicProcess_member2_id_aa353736_fk_globals_faculty_id_id" FOREIGN KEY (member2_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ThesisTopicProcess ThesisTopicProcess_member3_id_b74d2f0b_fk_globals_faculty_id_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."ThesisTopicProcess"
    ADD CONSTRAINT "ThesisTopicProcess_member3_id_b74d2f0b_fk_globals_faculty_id_id" FOREIGN KEY (member3_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ThesisTopicProcess ThesisTopicProcess_student_id_id_5d4bac21_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."ThesisTopicProcess"
    ADD CONSTRAINT "ThesisTopicProcess_student_id_id_5d4bac21_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ThesisTopicProcess ThesisTopicProcess_supervisor_id_id_75c1eaee_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."ThesisTopicProcess"
    ADD CONSTRAINT "ThesisTopicProcess_supervisor_id_id_75c1eaee_fk_globals_f" FOREIGN KEY (supervisor_id_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Thesis Thesis_reg_id_id_eb607b89_fk_globals_extrainfo_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Thesis"
    ADD CONSTRAINT "Thesis_reg_id_id_eb607b89_fk_globals_extrainfo_id" FOREIGN KEY (reg_id_id) REFERENCES public.globals_extrainfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Thesis Thesis_student_id_id_1047cb23_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Thesis"
    ADD CONSTRAINT "Thesis_student_id_id_1047cb23_fk_academic_" FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Thesis Thesis_supervisor_id_id_f208cb55_fk_globals_faculty_id_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public."Thesis"
    ADD CONSTRAINT "Thesis_supervisor_id_id_f208cb55_fk_globals_faculty_id_id" FOREIGN KEY (supervisor_id_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_information_student academic_information_batch_id_id_e8d1ed44_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_information_student
    ADD CONSTRAINT academic_information_batch_id_id_e8d1ed44_fk_programme FOREIGN KEY (batch_id_id) REFERENCES public.programme_curriculum_batch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_information_student academic_information_id_id_04c54754_fk_globals_e; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_information_student
    ADD CONSTRAINT academic_information_id_id_04c54754_fk_globals_e FOREIGN KEY (id_id) REFERENCES public.globals_extrainfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_stipendrequest academic_procedures__assignment_id_d3b499ee_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_stipendrequest
    ADD CONSTRAINT academic_procedures__assignment_id_d3b499ee_fk_academic_ FOREIGN KEY (assignment_id) REFERENCES public.academic_procedures_assignment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_branchchange academic_procedures__branches_id_92718b37_fk_globals_d; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_branchchange
    ADD CONSTRAINT academic_procedures__branches_id_92718b37_fk_globals_d FOREIGN KEY (branches_id) REFERENCES public.globals_departmentinfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_feedbackresponse academic_procedures__course_id_7b57f420_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackresponse
    ADD CONSTRAINT academic_procedures__course_id_7b57f420_fk_programme FOREIGN KEY (course_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_coursedroprequest academic_procedures__course_id_818308bf_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursedroprequest
    ADD CONSTRAINT academic_procedures__course_id_818308bf_fk_programme FOREIGN KEY (course_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_courseaddrequest academic_procedures__course_id_d09ae823_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_courseaddrequest
    ADD CONSTRAINT academic_procedures__course_id_d09ae823_fk_programme FOREIGN KEY (course_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_backlog_course academic_procedures__course_id_id_2985910d_fk_Course_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_backlog_course
    ADD CONSTRAINT "academic_procedures__course_id_id_2985910d_fk_Course_id" FOREIGN KEY (course_id_id) REFERENCES public."Course"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_courseaddrequest academic_procedures__course_slot_id_38c9b92a_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_courseaddrequest
    ADD CONSTRAINT academic_procedures__course_slot_id_38c9b92a_fk_programme FOREIGN KEY (course_slot_id) REFERENCES public.programme_curriculum_courseslot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_coursedroprequest academic_procedures__course_slot_id_6379bc27_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursedroprequest
    ADD CONSTRAINT academic_procedures__course_slot_id_6379bc27_fk_programme FOREIGN KEY (course_slot_id) REFERENCES public.programme_curriculum_courseslot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_coursereplacementrequest academic_procedures__course_slot_id_79ff40ed_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursereplacementrequest
    ADD CONSTRAINT academic_procedures__course_slot_id_79ff40ed_fk_programme FOREIGN KEY (course_slot_id) REFERENCES public.programme_curriculum_courseslot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_assignment academic_procedures__faculty_id_e69441fa_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_assignment
    ADD CONSTRAINT academic_procedures__faculty_id_e69441fa_fk_globals_f FOREIGN KEY (faculty_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_batchchangehistory academic_procedures__new_batch_id_929dc9a4_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_batchchangehistory
    ADD CONSTRAINT academic_procedures__new_batch_id_929dc9a4_fk_programme FOREIGN KEY (new_batch_id) REFERENCES public.programme_curriculum_batch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_coursereplacementrequest academic_procedures__new_course_id_9838ade0_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursereplacementrequest
    ADD CONSTRAINT academic_procedures__new_course_id_9838ade0_fk_programme FOREIGN KEY (new_course_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_batchchangehistory academic_procedures__old_batch_id_11128ca7_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_batchchangehistory
    ADD CONSTRAINT academic_procedures__old_batch_id_11128ca7_fk_programme FOREIGN KEY (old_batch_id) REFERENCES public.programme_curriculum_batch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_coursereplacementrequest academic_procedures__old_course_id_532de213_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursereplacementrequest
    ADD CONSTRAINT academic_procedures__old_course_id_532de213_fk_programme FOREIGN KEY (old_course_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_courseaddrequest academic_procedures__old_course_registrat_e457dda7_fk_course_re; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_courseaddrequest
    ADD CONSTRAINT academic_procedures__old_course_registrat_e457dda7_fk_course_re FOREIGN KEY (old_course_registration_id) REFERENCES public.course_registration(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_feedbackresponse academic_procedures__option_id_2feebe0b_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackresponse
    ADD CONSTRAINT academic_procedures__option_id_2feebe0b_fk_academic_ FOREIGN KEY (option_id) REFERENCES public.academic_procedures_feedbackoption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_feedbackoption academic_procedures__question_id_44ae1845_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackoption
    ADD CONSTRAINT academic_procedures__question_id_44ae1845_fk_academic_ FOREIGN KEY (question_id) REFERENCES public.academic_procedures_feedbackquestion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_feedbackresponse academic_procedures__question_id_87e845ad_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackresponse
    ADD CONSTRAINT academic_procedures__question_id_87e845ad_fk_academic_ FOREIGN KEY (question_id) REFERENCES public.academic_procedures_feedbackquestion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_backlog_course academic_procedures__semester_id_id_b2f9a6a3_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_backlog_course
    ADD CONSTRAINT academic_procedures__semester_id_id_b2f9a6a3_fk_programme FOREIGN KEY (semester_id_id) REFERENCES public.programme_curriculum_semester(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_assistantshipclaim academic_procedures__student_id_1dbde173_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_assistantshipclaim
    ADD CONSTRAINT academic_procedures__student_id_1dbde173_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_phdprogressexamination academic_procedures__student_id_1eb4ce4f_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_phdprogressexamination
    ADD CONSTRAINT academic_procedures__student_id_1eb4ce4f_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_coursedroprequest academic_procedures__student_id_25548d6c_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursedroprequest
    ADD CONSTRAINT academic_procedures__student_id_25548d6c_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_coursereplacementrequest academic_procedures__student_id_2b0d7040_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursereplacementrequest
    ADD CONSTRAINT academic_procedures__student_id_2b0d7040_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_messdue academic_procedures__student_id_7ae4f862_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_messdue
    ADD CONSTRAINT academic_procedures__student_id_7ae4f862_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_courseaddrequest academic_procedures__student_id_b35410db_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_courseaddrequest
    ADD CONSTRAINT academic_procedures__student_id_b35410db_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_feedbackfilled academic_procedures__student_id_e7c9bc48_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feedbackfilled
    ADD CONSTRAINT academic_procedures__student_id_e7c9bc48_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_mtechgraduateseminarreport academic_procedures__student_id_eb1278a7_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_mtechgraduateseminarreport
    ADD CONSTRAINT academic_procedures__student_id_eb1278a7_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_batchchangehistory academic_procedures__student_id_f663b479_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_batchchangehistory
    ADD CONSTRAINT academic_procedures__student_id_f663b479_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_feepayment academic_procedures__student_id_id_58b69789_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_feepayment
    ADD CONSTRAINT academic_procedures__student_id_id_58b69789_fk_academic_ FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_backlog_course academic_procedures__student_id_id_a031085c_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_backlog_course
    ADD CONSTRAINT academic_procedures__student_id_id_a031085c_fk_academic_ FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_assignment academic_procedures__ta_id_e0db8cdb_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_assignment
    ADD CONSTRAINT academic_procedures__ta_id_e0db8cdb_fk_academic_ FOREIGN KEY (ta_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_assistantshipclaim academic_procedures__ta_supervisor_id_c8ea0fa4_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_assistantshipclaim
    ADD CONSTRAINT academic_procedures__ta_supervisor_id_c8ea0fa4_fk_globals_f FOREIGN KEY (ta_supervisor_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_assistantshipclaim academic_procedures__thesis_supervisor_id_ba55b389_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_assistantshipclaim
    ADD CONSTRAINT academic_procedures__thesis_supervisor_id_ba55b389_fk_globals_f FOREIGN KEY (thesis_supervisor_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_branchchange academic_procedures__user_id_d36b8040_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_branchchange
    ADD CONSTRAINT academic_procedures__user_id_d36b8040_fk_academic_ FOREIGN KEY (user_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: academic_procedures_coursesmtech academic_procedures_coursesmtech_c_id_id_d239075c_fk_Course_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.academic_procedures_coursesmtech
    ADD CONSTRAINT "academic_procedures_coursesmtech_c_id_id_d239075c_fk_Course_id" FOREIGN KEY (c_id_id) REFERENCES public."Course"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bulk_password_email_operation bulk_password_email__initiated_by_id_b65a78bc_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.bulk_password_email_operation
    ADD CONSTRAINT bulk_password_email__initiated_by_id_b65a78bc_fk_auth_user FOREIGN KEY (initiated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_registration course_registration_course_id_id_e98745d3_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.course_registration
    ADD CONSTRAINT course_registration_course_id_id_e98745d3_fk_programme FOREIGN KEY (course_id_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_registration course_registration_course_slot_id_id_4641fc7a_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.course_registration
    ADD CONSTRAINT course_registration_course_slot_id_id_4641fc7a_fk_programme FOREIGN KEY (course_slot_id_id) REFERENCES public.programme_curriculum_courseslot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_registration course_registration_semester_id_id_89066c7f_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.course_registration
    ADD CONSTRAINT course_registration_semester_id_id_89066c7f_fk_programme FOREIGN KEY (semester_id_id) REFERENCES public.programme_curriculum_semester(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_registration course_registration_student_id_id_b6b15d28_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.course_registration
    ADD CONSTRAINT course_registration_student_id_id_b6b15d28_fk_academic_ FOREIGN KEY (student_id_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_replacement course_replacement_new_course_registrat_1fc3b78d_fk_course_re; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.course_replacement
    ADD CONSTRAINT course_replacement_new_course_registrat_1fc3b78d_fk_course_re FOREIGN KEY (new_course_registration_id) REFERENCES public.course_registration(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: course_replacement course_replacement_old_course_registrat_8411b7e6_fk_course_re; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.course_replacement
    ADD CONSTRAINT course_replacement_old_course_registrat_8411b7e6_fk_course_re FOREIGN KEY (old_course_registration_id) REFERENCES public.course_registration(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: email_template email_template_created_by_id_f3f424bd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.email_template
    ADD CONSTRAINT email_template_created_by_id_f3f424bd_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_extrainfo globals_extrainfo_department_id_848d9717_fk_globals_d; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_extrainfo
    ADD CONSTRAINT globals_extrainfo_department_id_848d9717_fk_globals_d FOREIGN KEY (department_id) REFERENCES public.globals_departmentinfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_extrainfo globals_extrainfo_user_id_eda09c50_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_extrainfo
    ADD CONSTRAINT globals_extrainfo_user_id_eda09c50_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_faculty globals_faculty_id_id_0fd6c5e4_fk_globals_extrainfo_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_faculty
    ADD CONSTRAINT globals_faculty_id_id_0fd6c5e4_fk_globals_extrainfo_id FOREIGN KEY (id_id) REFERENCES public.globals_extrainfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_feedback globals_feedback_user_id_3aa92ccc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_feedback
    ADD CONSTRAINT globals_feedback_user_id_3aa92ccc_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_holdsdesignation globals_holdsdesigna_designation_id_074911c0_fk_globals_d; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_holdsdesignation
    ADD CONSTRAINT globals_holdsdesigna_designation_id_074911c0_fk_globals_d FOREIGN KEY (designation_id) REFERENCES public.globals_designation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_holdsdesignation globals_holdsdesignation_user_id_0816ffa6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_holdsdesignation
    ADD CONSTRAINT globals_holdsdesignation_user_id_0816ffa6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_holdsdesignation globals_holdsdesignation_working_id_70883028_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_holdsdesignation
    ADD CONSTRAINT globals_holdsdesignation_working_id_70883028_fk_auth_user_id FOREIGN KEY (working_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_issue_images globals_issue_images_issue_id_a7df473d_fk_globals_issue_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue_images
    ADD CONSTRAINT globals_issue_images_issue_id_a7df473d_fk_globals_issue_id FOREIGN KEY (issue_id) REFERENCES public.globals_issue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_issue_images globals_issue_images_issueimage_id_0ed13bbe_fk_globals_i; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue_images
    ADD CONSTRAINT globals_issue_images_issueimage_id_0ed13bbe_fk_globals_i FOREIGN KEY (issueimage_id) REFERENCES public.globals_issueimage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_issue_support globals_issue_support_issue_id_2ed52d1d_fk_globals_issue_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue_support
    ADD CONSTRAINT globals_issue_support_issue_id_2ed52d1d_fk_globals_issue_id FOREIGN KEY (issue_id) REFERENCES public.globals_issue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_issue_support globals_issue_support_user_id_db434ee4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue_support
    ADD CONSTRAINT globals_issue_support_user_id_db434ee4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_issue globals_issue_user_id_98110616_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issue
    ADD CONSTRAINT globals_issue_user_id_98110616_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_issueimage globals_issueimage_user_id_be9b82a4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_issueimage
    ADD CONSTRAINT globals_issueimage_user_id_be9b82a4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: globals_staff globals_staff_id_id_41d590e6_fk_globals_extrainfo_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.globals_staff
    ADD CONSTRAINT globals_staff_id_id_41d590e6_fk_globals_extrainfo_id FOREIGN KEY (id_id) REFERENCES public.globals_extrainfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notification notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co FOREIGN KEY (action_object_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notification notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co FOREIGN KEY (actor_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notification notifications_notifi_recipient_id_d055f3f0_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_recipient_id_d055f3f0_fk_auth_user FOREIGN KEY (recipient_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notification notifications_notifi_target_content_type__ccb24d88_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.notifications_notification
    ADD CONSTRAINT notifications_notifi_target_content_type__ccb24d88_fk_django_co FOREIGN KEY (target_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: password_email_log password_email_log_sent_by_id_d61fd276_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.password_email_log
    ADD CONSTRAINT password_email_log_sent_by_id_d61fd276_fk_auth_user_id FOREIGN KEY (sent_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: password_email_log password_email_log_student_id_8e143988_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.password_email_log
    ADD CONSTRAINT password_email_log_student_id_8e143988_fk_programme FOREIGN KEY (student_id) REFERENCES public.programme_curriculum_studentbatchupload(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_studentstatuslog programme_curriculum_changed_by_id_ab8b75e5_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_studentstatuslog
    ADD CONSTRAINT programme_curriculum_changed_by_id_ab8b75e5_fk_auth_user FOREIGN KEY (changed_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_courseslot_courses programme_curriculum_course_id_03e7ed5d_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseslot_courses
    ADD CONSTRAINT programme_curriculum_course_id_03e7ed5d_fk_programme FOREIGN KEY (course_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_courseauditlog programme_curriculum_course_id_38221d52_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseauditlog
    ADD CONSTRAINT programme_curriculum_course_id_38221d52_fk_programme FOREIGN KEY (course_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_course_disciplines programme_curriculum_course_id_5aaac05c_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course_disciplines
    ADD CONSTRAINT programme_curriculum_course_id_5aaac05c_fk_programme FOREIGN KEY (course_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_newproposalfile_pre_requisit_courses programme_curriculum_course_id_e7de6bba_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_newproposalfile_pre_requisit_courses
    ADD CONSTRAINT programme_curriculum_course_id_e7de6bba_fk_programme FOREIGN KEY (course_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_courseinstructor programme_curriculum_course_id_id_5d7f8cee_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseinstructor
    ADD CONSTRAINT programme_curriculum_course_id_id_5d7f8cee_fk_programme FOREIGN KEY (course_id_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_courseslot_courses programme_curriculum_courseslot_id_b01ea486_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseslot_courses
    ADD CONSTRAINT programme_curriculum_courseslot_id_b01ea486_fk_programme FOREIGN KEY (courseslot_id) REFERENCES public.programme_curriculum_courseslot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_studentbatchupload programme_curriculum_created_by_id_4bf71e7d_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_studentbatchupload
    ADD CONSTRAINT programme_curriculum_created_by_id_4bf71e7d_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_batch programme_curriculum_curriculum_id_03f8df5b_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_batch
    ADD CONSTRAINT programme_curriculum_curriculum_id_03f8df5b_fk_programme FOREIGN KEY (curriculum_id) REFERENCES public.programme_curriculum_curriculum(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_semester programme_curriculum_curriculum_id_9e3f411f_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_semester
    ADD CONSTRAINT programme_curriculum_curriculum_id_9e3f411f_fk_programme FOREIGN KEY (curriculum_id) REFERENCES public.programme_curriculum_curriculum(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_batch programme_curriculum_discipline_id_00b0cc15_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_batch
    ADD CONSTRAINT programme_curriculum_discipline_id_00b0cc15_fk_programme FOREIGN KEY (discipline_id) REFERENCES public.programme_curriculum_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_course_disciplines programme_curriculum_discipline_id_26d07759_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course_disciplines
    ADD CONSTRAINT programme_curriculum_discipline_id_26d07759_fk_programme FOREIGN KEY (discipline_id) REFERENCES public.programme_curriculum_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_discipline_programmes programme_curriculum_discipline_id_a1c00433_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_discipline_programmes
    ADD CONSTRAINT programme_curriculum_discipline_id_a1c00433_fk_programme FOREIGN KEY (discipline_id) REFERENCES public.programme_curriculum_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_proposal_tracking programme_curriculum_disciplines_id_1eb27a73_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_proposal_tracking
    ADD CONSTRAINT programme_curriculum_disciplines_id_1eb27a73_fk_programme FOREIGN KEY (disciplines_id) REFERENCES public.programme_curriculum_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_course_pre_requisit_courses programme_curriculum_from_course_id_c7f09cbc_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course_pre_requisit_courses
    ADD CONSTRAINT programme_curriculum_from_course_id_c7f09cbc_fk_programme FOREIGN KEY (from_course_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_courseinstructor programme_curriculum_instructor_id_id_e3179f3f_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseinstructor
    ADD CONSTRAINT programme_curriculum_instructor_id_id_e3179f3f_fk_globals_f FOREIGN KEY (instructor_id_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_newproposalfile_pre_requisit_courses programme_curriculum_newproposalfile_id_82cee83f_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_newproposalfile_pre_requisit_courses
    ADD CONSTRAINT programme_curriculum_newproposalfile_id_82cee83f_fk_programme FOREIGN KEY (newproposalfile_id) REFERENCES public.programme_curriculum_newproposalfile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_curriculum programme_curriculum_programme_id_0b691039_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_curriculum
    ADD CONSTRAINT programme_curriculum_programme_id_0b691039_fk_programme FOREIGN KEY (programme_id) REFERENCES public.programme_curriculum_programme(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_discipline_programmes programme_curriculum_programme_id_b6c7f726_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_discipline_programmes
    ADD CONSTRAINT programme_curriculum_programme_id_b6c7f726_fk_programme FOREIGN KEY (programme_id) REFERENCES public.programme_curriculum_programme(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_proposal_tracking programme_curriculum_receive_design_id_2c3bf0fe_fk_globals_d; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_proposal_tracking
    ADD CONSTRAINT programme_curriculum_receive_design_id_2c3bf0fe_fk_globals_d FOREIGN KEY (receive_design_id) REFERENCES public.globals_designation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_proposal_tracking programme_curriculum_receive_id_id_5d409990_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_proposal_tracking
    ADD CONSTRAINT programme_curriculum_receive_id_id_5d409990_fk_auth_user FOREIGN KEY (receive_id_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_courseslot programme_curriculum_semester_id_68a306d2_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseslot
    ADD CONSTRAINT programme_curriculum_semester_id_68a306d2_fk_programme FOREIGN KEY (semester_id) REFERENCES public.programme_curriculum_semester(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_studentstatuslog programme_curriculum_student_id_8958c11a_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_studentstatuslog
    ADD CONSTRAINT programme_curriculum_student_id_8958c11a_fk_programme FOREIGN KEY (student_id) REFERENCES public.programme_curriculum_studentbatchupload(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_course_pre_requisit_courses programme_curriculum_to_course_id_fca8aee3_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_course_pre_requisit_courses
    ADD CONSTRAINT programme_curriculum_to_course_id_fca8aee3_fk_programme FOREIGN KEY (to_course_id) REFERENCES public.programme_curriculum_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_uploadhistory programme_curriculum_uploaded_by_id_25f77bca_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_uploadhistory
    ADD CONSTRAINT programme_curriculum_uploaded_by_id_25f77bca_fk_auth_user FOREIGN KEY (uploaded_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_studentbatchupload programme_curriculum_user_account_id_6d1e1aa1_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_studentbatchupload
    ADD CONSTRAINT programme_curriculum_user_account_id_6d1e1aa1_fk_auth_user FOREIGN KEY (user_account_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: programme_curriculum_courseauditlog programme_curriculum_user_id_c698c64f_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.programme_curriculum_courseauditlog
    ADD CONSTRAINT programme_curriculum_user_id_c698c64f_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_projectexpenditure research_procedures__approved_by_id_e0bc16ce_fk_globals_e; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_projectexpenditure
    ADD CONSTRAINT research_procedures__approved_by_id_e0bc16ce_fk_globals_e FOREIGN KEY (approved_by_id) REFERENCES public.globals_extrainfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_publication research_procedures__associated_project_i_776c45ad_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication
    ADD CONSTRAINT research_procedures__associated_project_i_776c45ad_fk_research_ FOREIGN KEY (associated_project_id) REFERENCES public.research_procedures_sponsoredproject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_consultancyproject_co_consultants research_procedures__consultancyproject_i_26b867dc_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_consultancyproject_co_consultants
    ADD CONSTRAINT research_procedures__consultancyproject_i_26b867dc_fk_research_ FOREIGN KEY (consultancyproject_id) REFERENCES public.research_procedures_consultancyproject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_consultancyproject research_procedures__consultant_id_589bf3f4_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_consultancyproject
    ADD CONSTRAINT research_procedures__consultant_id_589bf3f4_fk_globals_f FOREIGN KEY (consultant_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researcharea research_procedures__discipline_id_6b28cd86_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researcharea
    ADD CONSTRAINT research_procedures__discipline_id_6b28cd86_fk_programme FOREIGN KEY (discipline_id) REFERENCES public.programme_curriculum_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researchgroup research_procedures__discipline_id_bb2a734c_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup
    ADD CONSTRAINT research_procedures__discipline_id_bb2a734c_fk_programme FOREIGN KEY (discipline_id) REFERENCES public.programme_curriculum_discipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_consultancyproject_co_consultants research_procedures__faculty_id_09177f9c_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_consultancyproject_co_consultants
    ADD CONSTRAINT research_procedures__faculty_id_09177f9c_fk_globals_f FOREIGN KEY (faculty_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_publication_faculty_authors research_procedures__faculty_id_1535b22e_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication_faculty_authors
    ADD CONSTRAINT research_procedures__faculty_id_1535b22e_fk_globals_f FOREIGN KEY (faculty_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_patentstatusnotification research_procedures__faculty_id_187bba11_fk_globals_e; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patentstatusnotification
    ADD CONSTRAINT research_procedures__faculty_id_187bba11_fk_globals_e FOREIGN KEY (faculty_id) REFERENCES public.globals_extrainfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_sponsoredproject_co_principal_investigators research_procedures__faculty_id_7884b47d_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject_co_principal_investigators
    ADD CONSTRAINT research_procedures__faculty_id_7884b47d_fk_globals_f FOREIGN KEY (faculty_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researchgroup_members research_procedures__faculty_id_892bc7ca_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_members
    ADD CONSTRAINT research_procedures__faculty_id_892bc7ca_fk_globals_f FOREIGN KEY (faculty_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_patent_faculty_inventors research_procedures__faculty_id_93d863fe_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent_faculty_inventors
    ADD CONSTRAINT research_procedures__faculty_id_93d863fe_fk_globals_f FOREIGN KEY (faculty_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researcharea_faculty_experts research_procedures__faculty_id_f77fb1db_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researcharea_faculty_experts
    ADD CONSTRAINT research_procedures__faculty_id_f77fb1db_fk_globals_f FOREIGN KEY (faculty_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_patent research_procedures__faculty_id_id_32a36e64_fk_globals_e; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent
    ADD CONSTRAINT research_procedures__faculty_id_id_32a36e64_fk_globals_e FOREIGN KEY (faculty_id_id) REFERENCES public.globals_extrainfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_sponsoredproject research_procedures__funding_agency_id_964d3a9a_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject
    ADD CONSTRAINT research_procedures__funding_agency_id_964d3a9a_fk_research_ FOREIGN KEY (funding_agency_id) REFERENCES public.research_procedures_fundingagency(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researchgroup research_procedures__head_id_c6435d7f_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup
    ADD CONSTRAINT research_procedures__head_id_c6435d7f_fk_globals_f FOREIGN KEY (head_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researcharea research_procedures__parent_area_id_c20e22a3_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researcharea
    ADD CONSTRAINT research_procedures__parent_area_id_c20e22a3_fk_research_ FOREIGN KEY (parent_area_id) REFERENCES public.research_procedures_researcharea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_patent_faculty_inventors research_procedures__patent_id_84540aea_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent_faculty_inventors
    ADD CONSTRAINT research_procedures__patent_id_84540aea_fk_research_ FOREIGN KEY (patent_id) REFERENCES public.research_procedures_patent(application_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_patentstatusnotification research_procedures__patent_id_c7c5b774_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patentstatusnotification
    ADD CONSTRAINT research_procedures__patent_id_c7c5b774_fk_research_ FOREIGN KEY (patent_id) REFERENCES public.research_procedures_patent(application_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_patent_student_inventors research_procedures__patent_id_f7ab3f6b_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent_student_inventors
    ADD CONSTRAINT research_procedures__patent_id_f7ab3f6b_fk_research_ FOREIGN KEY (patent_id) REFERENCES public.research_procedures_patent(application_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_sponsoredproject research_procedures__principal_investigat_80c09eb9_fk_globals_f; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject
    ADD CONSTRAINT research_procedures__principal_investigat_80c09eb9_fk_globals_f FOREIGN KEY (principal_investigator_id) REFERENCES public.globals_faculty(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_projectreport research_procedures__project_id_3a6b9091_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_projectreport
    ADD CONSTRAINT research_procedures__project_id_3a6b9091_fk_research_ FOREIGN KEY (project_id) REFERENCES public.research_procedures_sponsoredproject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_projectexpenditure research_procedures__project_id_9eb137b7_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_projectexpenditure
    ADD CONSTRAINT research_procedures__project_id_9eb137b7_fk_research_ FOREIGN KEY (project_id) REFERENCES public.research_procedures_sponsoredproject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_projectmilestone research_procedures__project_id_f72f03f3_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_projectmilestone
    ADD CONSTRAINT research_procedures__project_id_f72f03f3_fk_research_ FOREIGN KEY (project_id) REFERENCES public.research_procedures_sponsoredproject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_publication_student_authors research_procedures__publication_id_19a92b1d_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication_student_authors
    ADD CONSTRAINT research_procedures__publication_id_19a92b1d_fk_research_ FOREIGN KEY (publication_id) REFERENCES public.research_procedures_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_publication_faculty_authors research_procedures__publication_id_45901abb_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication_faculty_authors
    ADD CONSTRAINT research_procedures__publication_id_45901abb_fk_research_ FOREIGN KEY (publication_id) REFERENCES public.research_procedures_publication(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_patent research_procedures__related_project_id_5c1b5045_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent
    ADD CONSTRAINT research_procedures__related_project_id_5c1b5045_fk_research_ FOREIGN KEY (related_project_id) REFERENCES public.research_procedures_sponsoredproject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_sponsoredproject research_procedures__research_area_id_b3e7baf7_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject
    ADD CONSTRAINT research_procedures__research_area_id_b3e7baf7_fk_research_ FOREIGN KEY (research_area_id) REFERENCES public.research_procedures_researcharea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_sponsoredproject research_procedures__research_group_id_a985dd47_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject
    ADD CONSTRAINT research_procedures__research_group_id_a985dd47_fk_research_ FOREIGN KEY (research_group_id) REFERENCES public.research_procedures_researchgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researcharea_faculty_experts research_procedures__researcharea_id_1cd876be_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researcharea_faculty_experts
    ADD CONSTRAINT research_procedures__researcharea_id_1cd876be_fk_research_ FOREIGN KEY (researcharea_id) REFERENCES public.research_procedures_researcharea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researchgroup_members research_procedures__researchgroup_id_370d6054_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_members
    ADD CONSTRAINT research_procedures__researchgroup_id_370d6054_fk_research_ FOREIGN KEY (researchgroup_id) REFERENCES public.research_procedures_researchgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researchgroup_faculty_under_group research_procedures__researchgroup_id_55b57b6f_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_faculty_under_group
    ADD CONSTRAINT research_procedures__researchgroup_id_55b57b6f_fk_research_ FOREIGN KEY (researchgroup_id) REFERENCES public.research_procedures_researchgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researchgroup_students_under_group research_procedures__researchgroup_id_c098364d_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_students_under_group
    ADD CONSTRAINT research_procedures__researchgroup_id_c098364d_fk_research_ FOREIGN KEY (researchgroup_id) REFERENCES public.research_procedures_researchgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_sponsoredproject_research_scholars research_procedures__sponsoredproject_id_3d4b8731_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject_research_scholars
    ADD CONSTRAINT research_procedures__sponsoredproject_id_3d4b8731_fk_research_ FOREIGN KEY (sponsoredproject_id) REFERENCES public.research_procedures_sponsoredproject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_sponsoredproject_co_principal_investigators research_procedures__sponsoredproject_id_841538ad_fk_research_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject_co_principal_investigators
    ADD CONSTRAINT research_procedures__sponsoredproject_id_841538ad_fk_research_ FOREIGN KEY (sponsoredproject_id) REFERENCES public.research_procedures_sponsoredproject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researchscholar research_procedures__student_id_0f8c1965_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchscholar
    ADD CONSTRAINT research_procedures__student_id_0f8c1965_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_publication_student_authors research_procedures__student_id_1217ee8e_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication_student_authors
    ADD CONSTRAINT research_procedures__student_id_1217ee8e_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_patent_student_inventors research_procedures__student_id_958a4e48_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_patent_student_inventors
    ADD CONSTRAINT research_procedures__student_id_958a4e48_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_sponsoredproject_research_scholars research_procedures__student_id_d61eed6f_fk_academic_; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject_research_scholars
    ADD CONSTRAINT research_procedures__student_id_d61eed6f_fk_academic_ FOREIGN KEY (student_id) REFERENCES public.academic_information_student(id_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_consultancyproject research_procedures__user_id_0f22eb05_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_consultancyproject
    ADD CONSTRAINT research_procedures__user_id_0f22eb05_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_sponsoredproject research_procedures__user_id_0faf17ee_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_sponsoredproject
    ADD CONSTRAINT research_procedures__user_id_0faf17ee_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_techtransfer research_procedures__user_id_4dd23c9a_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_techtransfer
    ADD CONSTRAINT research_procedures__user_id_4dd23c9a_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researchproject research_procedures__user_id_8e57090c_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchproject
    ADD CONSTRAINT research_procedures__user_id_8e57090c_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researchgroup_students_under_group research_procedures__user_id_af43ac6d_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_students_under_group
    ADD CONSTRAINT research_procedures__user_id_af43ac6d_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_researchgroup_faculty_under_group research_procedures__user_id_d79292dc_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_researchgroup_faculty_under_group
    ADD CONSTRAINT research_procedures__user_id_d79292dc_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: research_procedures_publication research_procedures__verified_by_id_23c04b78_fk_globals_e; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.research_procedures_publication
    ADD CONSTRAINT research_procedures__verified_by_id_23c04b78_fk_globals_e FOREIGN KEY (verified_by_id) REFERENCES public.globals_extrainfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: student_password_history student_password_his_student_id_4587b7fb_fk_programme; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.student_password_history
    ADD CONSTRAINT student_password_his_student_id_4587b7fb_fk_programme FOREIGN KEY (student_id) REFERENCES public.programme_curriculum_studentbatchupload(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: student_password_history student_password_history_created_by_id_1db4d0a7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: fusion_admin
--

ALTER TABLE ONLY public.student_password_history
    ADD CONSTRAINT student_password_history_created_by_id_1db4d0a7_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\unrestrict 9SA0G44HzMPTGercA4tMAmdfsYvOVxgIYk4dONEPZ0FGOB0HqBgrbsW5IbUTgek

