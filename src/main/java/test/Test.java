package test;

import bean.School;
import bean.Student;

public class Test {
		private Student student;
		private String classNum;
		private String subject;
		private School school;
		private int no;
		private int point;

		
		public Student getStudent() {
			return student;
	    }
		public void setStudent(Student student) {
				this.student=student;
		}
		public String getClassNum() {
			return classNum;
	    }
		public void setClassNum(String classNum) {
				this.classNum=classNum;
		}
		public String getSubject() {
			return subject ;
	    }
		public void setSubject(String subject) {
				this.subject=subject;
		}
		public School getSchool() {
			return school;
	    }
		public void setSchool(School school) {
				this.school=school;
		}	
		public int GetNo() {
			return no;
	    }
		public void setGetNo(int no) {
				this.no=no;
		}
		public int GetPoint() {
			return point;
	    }
		public void setPoint(int point) {
				this.point=point;
		}
		
}