package student;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

	public abstract class StudentListAction{
		public abstract String execute(
				HttpServletRequest request,HttpServletResponse response
				)throws Exception;
}