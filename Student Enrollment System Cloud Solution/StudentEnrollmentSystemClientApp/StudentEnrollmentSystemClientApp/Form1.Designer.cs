
namespace StudentEnrollmentSystemClientApp
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.studentComboBox = new System.Windows.Forms.ComboBox();
            this.courseComboBox = new System.Windows.Forms.ComboBox();
            this.dataDisplayBox = new System.Windows.Forms.ListBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.addStudentBtnDirect = new System.Windows.Forms.Button();
            this.addCourseBtnDirect = new System.Windows.Forms.Button();
            this.button6 = new System.Windows.Forms.Button();
            this.viewTimeTableBtn = new System.Windows.Forms.Button();
            this.viewBillBtn = new System.Windows.Forms.Button();
            this.displayGradesBtn = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.recordGradeBtn = new System.Windows.Forms.Button();
            this.gradeComboBox = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.coursesForStudentBtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // studentComboBox
            // 
            this.studentComboBox.FormattingEnabled = true;
            this.studentComboBox.Location = new System.Drawing.Point(283, 135);
            this.studentComboBox.Name = "studentComboBox";
            this.studentComboBox.Size = new System.Drawing.Size(121, 28);
            this.studentComboBox.TabIndex = 0;
            // 
            // courseComboBox
            // 
            this.courseComboBox.FormattingEnabled = true;
            this.courseComboBox.Location = new System.Drawing.Point(577, 135);
            this.courseComboBox.Name = "courseComboBox";
            this.courseComboBox.Size = new System.Drawing.Size(121, 28);
            this.courseComboBox.TabIndex = 1;
            // 
            // dataDisplayBox
            // 
            this.dataDisplayBox.FormattingEnabled = true;
            this.dataDisplayBox.ItemHeight = 20;
            this.dataDisplayBox.Location = new System.Drawing.Point(401, 208);
            this.dataDisplayBox.Name = "dataDisplayBox";
            this.dataDisplayBox.Size = new System.Drawing.Size(415, 264);
            this.dataDisplayBox.TabIndex = 2;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(233, 208);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(141, 38);
            this.button1.TabIndex = 3;
            this.button1.Text = "Display Students";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(860, 271);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(215, 38);
            this.button2.TabIndex = 4;
            this.button2.Text = "Display Courses";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(419, 134);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(141, 29);
            this.button3.TabIndex = 5;
            this.button3.Text = "Enrol";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(860, 334);
            this.button4.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(215, 35);
            this.button4.TabIndex = 6;
            this.button4.Text = "Course Details";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(233, 271);
            this.button5.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(141, 35);
            this.button5.TabIndex = 7;
            this.button5.Text = "Student Details";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // addStudentBtnDirect
            // 
            this.addStudentBtnDirect.Location = new System.Drawing.Point(460, 530);
            this.addStudentBtnDirect.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.addStudentBtnDirect.Name = "addStudentBtnDirect";
            this.addStudentBtnDirect.Size = new System.Drawing.Size(112, 35);
            this.addStudentBtnDirect.TabIndex = 8;
            this.addStudentBtnDirect.Text = "Add Student";
            this.addStudentBtnDirect.UseVisualStyleBackColor = true;
            this.addStudentBtnDirect.Click += new System.EventHandler(this.addStudentBtnDirect_Click);
            // 
            // addCourseBtnDirect
            // 
            this.addCourseBtnDirect.Location = new System.Drawing.Point(611, 530);
            this.addCourseBtnDirect.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.addCourseBtnDirect.Name = "addCourseBtnDirect";
            this.addCourseBtnDirect.Size = new System.Drawing.Size(112, 35);
            this.addCourseBtnDirect.TabIndex = 9;
            this.addCourseBtnDirect.Text = "Add Course";
            this.addCourseBtnDirect.UseVisualStyleBackColor = true;
            this.addCourseBtnDirect.Click += new System.EventHandler(this.addCourseBtnDirect_Click);
            // 
            // button6
            // 
            this.button6.Location = new System.Drawing.Point(860, 208);
            this.button6.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(215, 35);
            this.button6.TabIndex = 10;
            this.button6.Text = "Display Students In Course";
            this.button6.UseVisualStyleBackColor = true;
            this.button6.Click += new System.EventHandler(this.button6_Click);
            // 
            // viewTimeTableBtn
            // 
            this.viewTimeTableBtn.Location = new System.Drawing.Point(233, 334);
            this.viewTimeTableBtn.Name = "viewTimeTableBtn";
            this.viewTimeTableBtn.Size = new System.Drawing.Size(141, 31);
            this.viewTimeTableBtn.TabIndex = 11;
            this.viewTimeTableBtn.Text = "View Time Table";
            this.viewTimeTableBtn.UseVisualStyleBackColor = true;
            this.viewTimeTableBtn.Click += new System.EventHandler(this.viewTimeTableBtn_Click);
            // 
            // viewBillBtn
            // 
            this.viewBillBtn.Location = new System.Drawing.Point(233, 390);
            this.viewBillBtn.Name = "viewBillBtn";
            this.viewBillBtn.Size = new System.Drawing.Size(141, 34);
            this.viewBillBtn.TabIndex = 12;
            this.viewBillBtn.Text = "View Bill";
            this.viewBillBtn.UseVisualStyleBackColor = true;
            this.viewBillBtn.Click += new System.EventHandler(this.viewBillBtn_Click);
            // 
            // displayGradesBtn
            // 
            this.displayGradesBtn.Location = new System.Drawing.Point(233, 444);
            this.displayGradesBtn.Name = "displayGradesBtn";
            this.displayGradesBtn.Size = new System.Drawing.Size(141, 32);
            this.displayGradesBtn.TabIndex = 13;
            this.displayGradesBtn.Text = "Display Grades";
            this.displayGradesBtn.UseVisualStyleBackColor = true;
            this.displayGradesBtn.Click += new System.EventHandler(this.displayGradesBtn_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(553, 489);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(83, 20);
            this.label1.TabIndex = 14;
            this.label1.Text = "Navigation";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(509, 42);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(203, 20);
            this.label2.TabIndex = 15;
            this.label2.Text = "Student Enrollment System";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(312, 112);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(66, 20);
            this.label3.TabIndex = 16;
            this.label3.Text = "Student";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(605, 112);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(60, 20);
            this.label4.TabIndex = 17;
            this.label4.Text = "Course";
            // 
            // recordGradeBtn
            // 
            this.recordGradeBtn.Location = new System.Drawing.Point(869, 134);
            this.recordGradeBtn.Name = "recordGradeBtn";
            this.recordGradeBtn.Size = new System.Drawing.Size(141, 30);
            this.recordGradeBtn.TabIndex = 18;
            this.recordGradeBtn.Text = "Record A Grade";
            this.recordGradeBtn.UseVisualStyleBackColor = true;
            this.recordGradeBtn.Click += new System.EventHandler(this.recordGradeBtn_Click);
            // 
            // gradeComboBox
            // 
            this.gradeComboBox.FormattingEnabled = true;
            this.gradeComboBox.Location = new System.Drawing.Point(723, 135);
            this.gradeComboBox.Name = "gradeComboBox";
            this.gradeComboBox.Size = new System.Drawing.Size(121, 28);
            this.gradeComboBox.TabIndex = 19;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(758, 111);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(54, 20);
            this.label5.TabIndex = 20;
            this.label5.Text = "Grade";
            // 
            // coursesForStudentBtn
            // 
            this.coursesForStudentBtn.Location = new System.Drawing.Point(860, 390);
            this.coursesForStudentBtn.Name = "coursesForStudentBtn";
            this.coursesForStudentBtn.Size = new System.Drawing.Size(234, 34);
            this.coursesForStudentBtn.TabIndex = 21;
            this.coursesForStudentBtn.Text = "Display Courses for Student";
            this.coursesForStudentBtn.UseVisualStyleBackColor = true;
            this.coursesForStudentBtn.Click += new System.EventHandler(this.coursesForStudentBtn_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1263, 622);
            this.Controls.Add(this.coursesForStudentBtn);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.gradeComboBox);
            this.Controls.Add(this.recordGradeBtn);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.displayGradesBtn);
            this.Controls.Add(this.viewBillBtn);
            this.Controls.Add(this.viewTimeTableBtn);
            this.Controls.Add(this.button6);
            this.Controls.Add(this.addCourseBtnDirect);
            this.Controls.Add(this.addStudentBtnDirect);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.dataDisplayBox);
            this.Controls.Add(this.courseComboBox);
            this.Controls.Add(this.studentComboBox);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox studentComboBox;
        private System.Windows.Forms.ComboBox courseComboBox;
        private System.Windows.Forms.ListBox dataDisplayBox;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button addStudentBtnDirect;
        private System.Windows.Forms.Button addCourseBtnDirect;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.Button viewTimeTableBtn;
        private System.Windows.Forms.Button viewBillBtn;
        private System.Windows.Forms.Button displayGradesBtn;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button recordGradeBtn;
        private System.Windows.Forms.ComboBox gradeComboBox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button coursesForStudentBtn;
    }
}

