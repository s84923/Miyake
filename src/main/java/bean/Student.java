package bean;


public class Student implements java.io.Serializable {

		private String no;
		private String name;
		private int entYear;
		private String dassNum;
		private boolean isAttend;
		private School school;
		private int schoolyear;
		
		public String getNo() {
			return no;
	    }
		public void setNo(String no) {
				this.no=no;
		}
		public String getName() {
			return name;
	    }
		public void setName(String name) {
			    this.name=name;
		}
		public int getEntYear() {
			return entYear;
	    }
		public void setEntYear(int entYear) {
				this.entYear=entYear;
		}
		public String getDassNum() {
			return dassNum;
	    }
		public void setDassNum(String dassNum) {
				this.dassNum=dassNum;
		}
		public boolean getisAttend() {
			return isAttend;
	    }
		public void setAttend(boolean isAttend) {
				this.isAttend=isAttend;
		}
		public School getSchool() {
			return school;
	    }
		public void setSchool(School school) {
				this.school=school;
		}
		public int getSchoolYear() {
			return schoolyear;
	    }
		public String getClassNum() {
		    return dassNum; 
		}

		public boolean isAttend() {
		    return isAttend;
		}

		public String getSchoolCd() {
		    return school.getSchoolCd(); 
		}

}
