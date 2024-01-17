using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace StudentEnrollmentSystem
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IStudentEnrollment" in both code and config file together.
    [ServiceContract]
    public interface IStudentEnrollment
    {
        
        // Questions - DAO, MVC implementation
        /*
            Methods related to the Student Class
         */

        [OperationContract]
        string insertStudent(string studentID, string studentName, DateTime dateEnrolled);
        // 
        // return 1/0
        // confirmation message

        [OperationContract]
        List<Student> getAllStudents();
        // Returns a List of all Students


        [OperationContract]
        List<Enrollment> getEnrollmentsForStudent(string studentID); 
            // return enrollments for student by studentID
            // return a list of courses the student is enrolled in
            // We need to work with a List of Enrollments - this will facilitate calling the method 
            // in the displayGradesForStudent() method
            // Calls the db, creates a List object to work with
            // Polymorphic - create an abstract method to pass through either a studentID or courseID
            // to generate a list of courses for a student, or a list of students for a course


        [OperationContract]
        List<Course> getCoursesForStudent(string studentID);
        // Does not hold the grade
        // returns

        [OperationContract]
        Student viewStudentDetails(string studentID);

        /*
            Methods related to the Course Class
         */
        [OperationContract]
        string insertCourse(string courseID, string courseName, decimal cost, DateTime scheduledTime);
        // create a new course and insert record into database

        [OperationContract]
        List<Course>viewCourses();
        // Creates a list object of type Courses

        [OperationContract]
        Course viewCourseDetails(string courseID);
        // Display Course details to the user (screen)

        [OperationContract]
        List<Enrollment> viewEnrollmentsForCourse(string courseID);
        // Creates a List object of type Student for enrollments in a particular Course

        [OperationContract]
        string enrollStudent(string studentID, string courseID);
        // Creates an Enrollment object with the above parameters
        // Inserts record into the database

        [OperationContract]
        List<Student> getStudentsInCourse(string courseID);

        /*
            Methods related to the Enrollment Class
        */

        [OperationContract]
        string setGradeForStudent(string studentID, string courseID, string grade);

        [OperationContract]
        List<string> getGradeForStudent(string studentID);

    }
}
