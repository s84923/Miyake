package student;

import dao.ProductDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class StudentCreateAction extends Action {
	public void execute(
			HttpServletRequest request, HttpServletResponse responce)
				throws Exception{
		
	    String studentName = request.getParameter("name");
	    int studentAge = Integer.parseInt(request.getParameter("age"));
	    String studentGrade = request.getParameter("grade");
	    
	    // 新しい学生オブジェクトを作成する
	    ProdDAO dao=new ProductDAO();
	    
	    // データベースなどに学生情報を保存する
	    boolean success = saveStudentToDatabase(newStudent);
	    
	    if (success) {
	    	
	    }
	}
}
