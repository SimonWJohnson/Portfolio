using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using StudentEnrollmentSystemClientApp.EnrollmentServiceReference;

namespace StudentEnrollmentSystemClientApp
{
    public partial class Form1 : Form
    {
        // Session 11

        private StudentEnrollmentClient client = new StudentEnrollmentClient();

        public Form1()
        {
            InitializeComponent();

            // Populate the Student Combo Box
            var studentList = client.getAllStudents();
            foreach (Student student in studentList)
            {
                studentComboBox.Items.Add(student.studentID);
            }

            // Populate the Course Combo Box
            var courseList = client.viewCourses();
            foreach (Course course in courseList)
            {
                courseComboBox.Items.Add(course.courseID);
            }

            // Populate the gradeComboBox
            gradeComboBox.Items.Add("High Distinction");
            gradeComboBox.Items.Add("Distinction");
            gradeComboBox.Items.Add("Credit");
            gradeComboBox.Items.Add("Pass 01");
            gradeComboBox.Items.Add("Pass 02");
            gradeComboBox.Items.Add("Fail");

        }

        // Display Students
        private void button1_Click(object sender, EventArgs e)
        {
            // Display Students
            // Calls the getAllStudents() method
            dataDisplayBox.Items.Clear();
            foreach (Student student in client.getAllStudents())
            {
                dataDisplayBox.Items.Add(student.studentID + " " + student.studentName + " " + student.dateEnrolled);
            }

        }

        // Display Courses
        private void button2_Click(object sender, EventArgs e)
        {
            // Display Courses
            // Calls the viewCourses() method
            dataDisplayBox.Items.Clear();
            foreach (Course course in client.viewCourses()) 
            {
                
                dataDisplayBox.Items.Add(course.courseID + " " + course.courseName + " " + course.cost);
            }
        }

        // Enroll a Student in a Course
        private void button3_Click(object sender, EventArgs e)
        {
            dataDisplayBox.Items.Clear();
            // Enroll a Student in a Course ** Topic 12
            if (studentComboBox.SelectedItem == null || courseComboBox.SelectedItem == null)
            {
                dataDisplayBox.Items.Add("Please select a value from both combo boxes");
            }
            else 
            {
                client.enrollStudent(studentComboBox.SelectedItem.ToString(), courseComboBox.SelectedItem.ToString());
                dataDisplayBox.Items.Add("Enrollment record added to database");
            }
        }

        // View an individual Student's details
        private void button5_Click(object sender, EventArgs e)
        {
            dataDisplayBox.Items.Clear();
            // View Student Details (studentID)
            if (studentComboBox.SelectedItem == null)
            {
                dataDisplayBox.Items.Add("Please select a value from the Student combo box");
            }
            else 
            {             
                Student student = client.viewStudentDetails(studentComboBox.SelectedItem.ToString());
                dataDisplayBox.Items.Add("Student ID: " + student.studentID);
                dataDisplayBox.Items.Add("Student Name: " + student.studentName);
                dataDisplayBox.Items.Add("Date Enrolled: " + student.dateEnrolled);
            }
        }

        // View an individual Course's details
        private void button4_Click(object sender, EventArgs e)
        {
            dataDisplayBox.Items.Clear();
            // View Course Details (courseID)
            if (courseComboBox.SelectedItem == null)
            {
                dataDisplayBox.Items.Add("Please select a value from the Course combo box");
            }
            else 
            {
                Course course = client.viewCourseDetails(courseComboBox.SelectedItem.ToString());
                dataDisplayBox.Items.Add("Course ID: " + course.courseID);
                dataDisplayBox.Items.Add("Course Name: " + course.courseName);
                dataDisplayBox.Items.Add("Course Cost: " + course.cost);
                dataDisplayBox.Items.Add("Scheduled Time: " + course.scheduledTime);
            }
        }

        // Navigate to the Add_Student Form to add a new Student to the db
        private void addStudentBtnDirect_Click(object sender, EventArgs e)
        {
            // Create an instance of the target Form (Form1)
            Add_Student add_Student = new Add_Student();

            // Show the target form (Form1)
            add_Student.Visible = true;

            // Hide the current form (Add_Student)
            this.Visible = false;
        }

        // Navigate to the Add_Course Form to add a new Course to the db
        private void addCourseBtnDirect_Click(object sender, EventArgs e)
        {
            // Create an instance of the target Form (Form1)
            Add_Course add_Course = new Add_Course();

            // Show the target form (Form1)
            add_Course.Visible = true;

            // Hide the current form (Add_Student)
            this.Visible = false;
        }

        // Display Students in Course
        private void button6_Click(object sender, EventArgs e)
        {
            dataDisplayBox.Items.Clear();
            if (courseComboBox.SelectedItem == null) 
            {
                dataDisplayBox.Items.Add("Please select a value from the Course combo box");
            }
            else
            {
                dataDisplayBox.Items.Add("Students Enrolled in " + courseComboBox.SelectedItem.ToString() + ": ");
                dataDisplayBox.Items.Add("");
                foreach (Student student in client.getStudentsInCourse(courseComboBox.SelectedItem.ToString()))
                {
                    dataDisplayBox.Items.Add(student.studentID + " " + student.studentName + " " + student.dateEnrolled);
                }
            }
        }

        // View a timetable for an individual Student
        private void viewTimeTableBtn_Click(object sender, EventArgs e)
        {
            dataDisplayBox.Items.Clear();
            if (studentComboBox.SelectedItem == null)
            {
                dataDisplayBox.Items.Add("Please select a value from the Student combo box");
            }
            else 
            {
                var studentTimetable = client.getCoursesForStudent(studentComboBox.SelectedItem.ToString());

                dataDisplayBox.Items.Add("Timetable for Student " + studentComboBox.SelectedItem.ToString());

                foreach (Course course in studentTimetable)
                {
                    dataDisplayBox.Items.Add("Course Name: " + course.courseName);
                    dataDisplayBox.Items.Add("Scheduled Time: " + course.scheduledTime);
                    dataDisplayBox.Items.Add(" ");
                }
            }
        }

        // View a bill for an individual Student
        private void viewBillBtn_Click(object sender, EventArgs e)
        {
            dataDisplayBox.Items.Clear();
            decimal totalPayable = 0;

            if (studentComboBox.SelectedItem == null)
            {
                dataDisplayBox.Items.Add("Please select a value from the Student combo box");
            }
            else
            {
                var itemisedBill = client.getCoursesForStudent(studentComboBox.SelectedItem.ToString());

                dataDisplayBox.Items.Add("Itemised Account for Student " + studentComboBox.SelectedItem.ToString());
                dataDisplayBox.Items.Add("");

                foreach (Course course in itemisedBill)
                {
                    // Calculate the total amount payable
                    totalPayable += course.cost;

                    dataDisplayBox.Items.Add("Course ID: " + course.courseID);
                    dataDisplayBox.Items.Add("Course Name: " + course.courseName);
                    dataDisplayBox.Items.Add("Course Cost: " + course.cost);
                    dataDisplayBox.Items.Add("");
                }

                dataDisplayBox.Items.Add("*---------------------*");
                dataDisplayBox.Items.Add("Total Payable: " + totalPayable);
            }
        }

        // View Grades for an individual Student's Enrollments
        private void displayGradesBtn_Click(object sender, EventArgs e)
        {
            dataDisplayBox.Items.Clear();

            if (studentComboBox.SelectedItem == null)
            {
                dataDisplayBox.Items.Add("Please select a value from the Student combo box");
            }
            else
            {
                string studentID = studentComboBox.SelectedItem.ToString();
                var gradesList = client.getGradeForStudent(studentID);

                dataDisplayBox.Items.Add("Grades List for Student: " + studentID);
                dataDisplayBox.Items.Add(" ");

                foreach (string grade in gradesList) 
                {
                    dataDisplayBox.Items.Add(grade);
                }
            }

        }

        // Record a Grade for A Student
        private void recordGradeBtn_Click(object sender, EventArgs e)
        {
            // Calls the setGradeForStudent(string studentID, string courseID, string grade)
            dataDisplayBox.Items.Clear();

            if (studentComboBox.SelectedItem == null || courseComboBox.SelectedItem == null || gradeComboBox.SelectedItem == null)
            {
                dataDisplayBox.Items.Add("Please select a value from all combo boxes");
            }
            else
            {
                // Insert Grade into Student Enrollment
                string studentID = studentComboBox.SelectedItem.ToString();
                string courseID = courseComboBox.SelectedItem.ToString();
                string grade = gradeComboBox.SelectedItem.ToString();

                try
                {
                    // Insert a grade for a Student Enrollment
                    client.setGradeForStudent(studentID, courseID, grade);
                    dataDisplayBox.Items.Add("Grade successfully recorded for Student");
                    dataDisplayBox.Items.Add("");
                    dataDisplayBox.Items.Add("Student ID: " + studentComboBox.SelectedItem.ToString());
                    dataDisplayBox.Items.Add("Course ID: " + courseComboBox.SelectedItem.ToString());
                    dataDisplayBox.Items.Add("Grade: " + gradeComboBox.SelectedItem.ToString());
                }
                catch (Exception ex) 
                {
                    dataDisplayBox.Items.Add("Student not enrolled in " + courseID);
                }
            }            
        }

        // View Courses a Student is Enrolled in
        private void coursesForStudentBtn_Click(object sender, EventArgs e)
        {
            // Calls the getCoursesForStudent(string studentID)
            dataDisplayBox.Items.Clear();

            if (studentComboBox.SelectedItem == null) 
            {
                dataDisplayBox.Items.Add("Please select a value from the Student combo box");
            } 
            else 
            {
                string studentID = studentComboBox.SelectedItem.ToString();
                var courseList = client.getCoursesForStudent(studentID);
                dataDisplayBox.Items.Add("Course List for Student: " + studentID);
                dataDisplayBox.Items.Add("");               

                foreach (Course course in courseList)
                {
                    dataDisplayBox.Items.Add("Course ID: " + course.courseID);
                    dataDisplayBox.Items.Add("Course Name: " + course.courseName);
                    dataDisplayBox.Items.Add("");
                }
            }
        }
    }
}
