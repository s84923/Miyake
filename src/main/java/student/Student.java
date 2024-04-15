
public class Student {

		private String no;
		private String name;
		private int entYear;
		private String dassNum;
		private boolean isAttend;
		private School school;
		
		
		public String getNo() {
			return no;
	    }
		public void setNo(String no) {
				this.no=no;
		}
		public String getName() {
			return name;
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
			return schoolYear;
	    }
		
}

