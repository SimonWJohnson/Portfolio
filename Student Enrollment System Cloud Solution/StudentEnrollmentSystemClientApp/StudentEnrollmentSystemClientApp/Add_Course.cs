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
    public partial class Add_Course : Form
    {
        private StudentEnrollmentClient client = new StudentEnrollmentClient();

        public Add_Course()
        {
            InitializeComponent();
        }

        private void homeBtn_Click(object sender, EventArgs e)
        {
            // Create an instance of the target Form (Form1)
            Form1 form1 = new Form1();

            // Show the target form (Form1)
            form1.Visible = true;

            // Hide the current form (Add_Student)
            this.Visible = false;
        }

        private void clearBtn_Click(object sender, EventArgs e)
        {
            courseIDTextBox.Text = "";
            courseNameTextBox.Text = "";
            courseCostTextBox.Text = "";
            scheduledTimeTextBox.Text = "";
            dataDisplayBox.Items.Clear();
        }

        private void addCourseBtn_Click(object sender, EventArgs e)
        {
            dataDisplayBox.Items.Clear();

            if (courseIDTextBox.Text == null || courseNameTextBox.Text == null || courseCostTextBox.Text == null || scheduledTimeTextBox == null) 
            {
                dataDisplayBox.Items.Add("Please make sure all fields are entered");
            } 
            else
            {
                try
                {
                    // Insert new Course into the database
                    string courseID = courseIDTextBox.Text;
                    string courseName = courseNameTextBox.Text;
                    decimal courseCost = decimal.Parse(courseCostTextBox.Text);
                    DateTime scheduledTime = DateTime.Parse(scheduledTimeTextBox.Text);

                    //Insert record
                    client.insertCourse(courseID, courseName, courseCost, scheduledTime);

                    // Retrieve and display the new Course in the dataDisplayBox
                    Course course = client.viewCourseDetails(courseIDTextBox.Text);

                    // Clear all input fields
                    courseIDTextBox.Text = "";
                    courseNameTextBox.Text = "";
                    courseCostTextBox.Text = "";
                    scheduledTimeTextBox.Text = "";

                    // Populate the dataDisplayBox
                    dataDisplayBox.Items.Add("Course ID: " + course.courseID);
                    dataDisplayBox.Items.Add("Course Name: " + course.courseName);
                    dataDisplayBox.Items.Add("Course Cost: $ " + course.cost);
                    dataDisplayBox.Items.Add("Scheduled Time: " + course.scheduledTime);
                    dataDisplayBox.Items.Add("");
                    dataDisplayBox.Items.Add("Course successfully added to the Database");
                }
                catch (FormatException fe) 
                {
                    dataDisplayBox.Items.Add("Please make sure 'Cost' and 'Scheduled Time' fields are filled correctly");
                }
                catch (Exception ex)
                {
                    dataDisplayBox.Items.Add("Please make sure all fields are entered");
                }
            }



        }
    }
}
