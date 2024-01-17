using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace StudentEnrollmentSystem
{
    [DataContract]
    public class Enrollment
    {
        [DataMember]
        public string studentID;

        [DataMember]
        public string courseID;

        [DataMember]
        public string grade;

    }
}