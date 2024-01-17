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
    public partial class Add_Student : Form
    {
        private StudentEnrollmentClient client = new StudentEnrollmentClient();

        public Add_Student()
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
            studentIDTextBox.Text = "";
            studentNameTextBox.Text = "";
            dataDisplayBox.Items.Clear();

        }

        // Add a new Student to the database
        private void addStudentBtn_Click(object sender, EventArgs e)
        {
            dataDisplayBox.Items.Clear();

            if (studentIDTextBox.Text == "" || studentNameTextBox.Text == "")
            {
                dataDisplayBox.Items.Add("Please make sure all fields are entered");
            } 
            else 
            {
                try 
                {
                    // Insert new Student into the database
                    string studentID = studentIDTextBox.Text;
                    string studentName = studentNameTextBox.Text;
                    DateTime dateEnrolled = DateTime.Now;


                    // Insert record
                    client.insertStudent(studentID, studentName, dateEnrolled);

                    // Retrieve and display the new Student in the dataDisplayBox
                    Student student = client.viewStudentDetails(studentIDTextBox.Text);

                    // Clear all input fields
                    studentIDTextBox.Text = "";
                    studentNameTextBox.Text = "";

                    // Populate the dataDisplayBox
                    dataDisplayBox.Items.Add("Student ID: " + student.studentID);
                    dataDisplayBox.Items.Add("Student Name: " + student.studentName);
                    dataDisplayBox.Items.Add("Date Enrolled: " + student.dateEnrolled);
                    dataDisplayBox.Items.Add("");
                    dataDisplayBox.Items.Add("Student successfully added to the Database");
                    
                } 
                catch (Exception ex) 
                {
                    dataDisplayBox.Items.Add("Error - Duplicate entry");
                }
            }

        }
    }
}
