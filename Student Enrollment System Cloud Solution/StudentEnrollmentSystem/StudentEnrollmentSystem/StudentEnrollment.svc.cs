using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace StudentEnrollmentSystem
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "StudentEnrollment" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select StudentEnrollment.svc or StudentEnrollment.svc.cs at the Solution Explorer and start debugging.
    public class StudentEnrollment : IStudentEnrollment
    {
        /* TABLE ADAPTERS */
        
        //StudentDataSet studentTableAdapter
        private StudentDataSetTableAdapters.StudentTableAdapter studentTA;

        //CourseDataSet courseTableAdapter
        private CourseDataSetTableAdapters.CourseTableAdapter courseTA;

        //EnrollmentDataSet enrollmentTableAdapter
        private EnrollmentDataSetTableAdapters.EnrollmentTableAdapter enrollmentTA;

        // Get a list of all Students
        public List<Student> getAllStudents() 
        {
            studentTA = new StudentDataSetTableAdapters.StudentTableAdapter();
            StudentDataSet.StudentDataTable table = studentTA.GetData();
            List<Student> studentList = new List<Student>();

            foreach (DataRow row in table)
            {
                Student student = new Student();
                student.studentID = row["studentID"].ToString();
                student.studentName = row["studentName"].ToString();
                student.dateEnrolled = (DateTime)row["dateEnrolled"];
                studentList.Add(student);
            }

            return studentList;

        }

        // Get a list of all Courses 
        public List<Course> viewCourses()
        {
            courseTA = new CourseDataSetTableAdapters.CourseTableAdapter();
            CourseDataSet.CourseDataTable table = courseTA.GetData();
            List<Course> courseList = new List<Course>();

            foreach (DataRow row in table) 
            {
                Course course = new Course();
                course.courseID = row["courseID"].ToString();
                course.courseName = row["courseName"].ToString();
                course.cost = (decimal)row["cost"];
                course.scheduledTime = (DateTime)row["scheduledTime"];
                courseList.Add(course);
            }

            return courseList;
        }

        // Get a List of all Enrollments for a Course
        public List<Enrollment> viewEnrollmentsForCourse(string courseID)
        {
            enrollmentTA = new EnrollmentDataSetTableAdapters.EnrollmentTableAdapter();
            EnrollmentDataSet.EnrollmentDataTable table = enrollmentTA.getStudentEnrollmentsForCourse(courseID);
            List<Enrollment> courseEnrollmentList = new List<Enrollment>();

            foreach (DataRow row in table) 
            {
                Enrollment enrollment = new Enrollment();
                enrollment.studentID = row["studentID"].ToString();
                enrollment.courseID = row["courseID"].ToString();
                enrollment.grade = row["grade"].ToString();
                courseEnrollmentList.Add(enrollment);

            }

            return courseEnrollmentList;
        }

        // Get a List of all Enrollments for a Student
        public List<Enrollment> getEnrollmentsForStudent(string studentID)
        {
            enrollmentTA = new EnrollmentDataSetTableAdapters.EnrollmentTableAdapter();
            EnrollmentDataSet.EnrollmentDataTable table = enrollmentTA.GetEnrollmentForStudent(studentID);
            List<Enrollment> studentEnrollmentList = new List<Enrollment>();

            foreach (DataRow row in table) 
            {
                Enrollment enrollment = new Enrollment();
                enrollment.studentID = row["studentID"].ToString();
                enrollment.courseID = row["courseID"].ToString();
                enrollment.grade = row["grade"].ToString();
                studentEnrollmentList.Add(enrollment);
            }

            return studentEnrollmentList;

        }

        // Get a list of Student details for each Student in a Course
        public List<Student> getStudentsInCourse(string courseID)
        {
            List<Enrollment> enrollmentList = new List<Enrollment>();
            List<Student> studentList = new List<Student>();

            enrollmentList = viewEnrollmentsForCourse(courseID);
            foreach (Enrollment enrollment in enrollmentList)
            {
                Student student = new Student();
                student = viewStudentDetails(enrollment.studentID);
                studentList.Add(student);
            }

            return studentList;
        }

        // Add a student to the database
        public string insertStudent(string studentID, string studentName, DateTime dateEnrolled)
        {
            studentTA = new StudentDataSetTableAdapters.StudentTableAdapter();
            studentTA.InsertQuery(studentID, studentName, dateEnrolled.ToString());
            return "Student record inserted into database";
        }

        public List<Course> getCoursesForStudent(string studentID) // Multi-purpose method to display bill and scheduled times (timetable)
        {
            // Return an itemised account
            // studentID, studentName, courseID, courseName, cost
            // Display calculated total of all course costs
            // call the getEnrollmentsForStudent(string studentID) method
            // var totalPayable = totalPayable + course.cost
            List<Enrollment> enrollmentList = new List<Enrollment>();
            List<Course> studentCoursesList = new List<Course>(); // What is returned

            enrollmentList = getEnrollmentsForStudent(studentID);
            foreach (Enrollment enrollment in enrollmentList)
            {
                Course course = new Course();
                course = viewCourseDetails(enrollment.courseID);
                studentCoursesList.Add(course); // Add each course object to the courseBillingList
            }

            return studentCoursesList;
        }

        // Enroll a Student in a Course
        public string enrollStudent(string studentID, string courseID)
        {
            enrollmentTA = new EnrollmentDataSetTableAdapters.EnrollmentTableAdapter();
            enrollmentTA.InsertQuery(studentID, courseID);
            return "Enrollment record added to database";            
        }

        // Add a new course to the database
        public string insertCourse(string courseID, string courseName, decimal cost, DateTime scheduledTime)
        {
            courseTA = new CourseDataSetTableAdapters.CourseTableAdapter();
            courseTA.InsertQuery(courseID, courseName, cost, scheduledTime.ToString());
            return "Course record inserted into database";
        }

        // Get Student by studentID
        public Student viewStudentDetails(string studentID) // Return the entire Student object, as opposed to a string rep of the Student object
        {
            studentTA = new StudentDataSetTableAdapters.StudentTableAdapter();
            StudentDataSet.StudentDataTable studentRows = studentTA.getStudentByID(studentID);
            Student student = new Student();
            StudentDataSet.StudentRow row = studentRows.Rows[0] as StudentDataSet.StudentRow;

            // Display as string
            student.studentID = row["studentID"].ToString();
            student.studentName = row["studentName"].ToString();
            student.dateEnrolled = (DateTime)row["dateEnrolled"];

            return student;
        }

        // Get Course by courseID
        public Course viewCourseDetails(string courseID) // Return the entire Course object, as opposed to a string rep of the Course object
        {
            courseTA = new CourseDataSetTableAdapters.CourseTableAdapter();
            CourseDataSet.CourseDataTable courseRows = courseTA.getCourseByID(courseID);
            Course course = new Course();
            CourseDataSet.CourseRow row = courseRows.Rows[0] as CourseDataSet.CourseRow;
            
            // Display as string
            course.courseID = row["courseID"].ToString();
            course.courseName = row["courseName"].ToString();
            course.cost = (decimal)row["cost"];
            course.scheduledTime = (DateTime)row["scheduledTime"];

            return course;
        }


        /*  Getters & Setters */
        public string setGradeForStudent(string studentID, string courseID, string grade)
        {
            enrollmentTA = new EnrollmentDataSetTableAdapters.EnrollmentTableAdapter();
            enrollmentTA.SetGradeForStudent(grade, studentID, courseID);
            return "\nStudent ID: " + studentID + "\nCourse ID: " + courseID + "\nGrade: " + grade;
        }

        /* This method may be redundant */
        public List<string> getGradeForStudent(string studentID)
        {
            List<Enrollment> enrollmentGradesList = getEnrollmentsForStudent(studentID);
            List<string> grades = new List<string>();
            foreach (Enrollment enrollment in enrollmentGradesList)
            {
                string grade = enrollment.courseID + ": " + enrollment.grade;
                grades.Add(grade);
            }
            return grades;
        }






    }
}
