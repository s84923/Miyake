package student;

import bean.Student;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class StudentCreateAction {
	public void execute(HttpServletRequest req, HttpServletResponse res) {
	    // HTTPリクエストからパラメータを取得する
	    String studentName = req.getParameter("name");
	    int studentAge = Integer.parseInt(req.getParameter("age"));
	    String studentGrade = req.getParameter("grade");
	    
	    // 新しい学生オブジェクトを作成する
	    Student newStudent = new Student(studentName, studentAge, studentGrade);
	    
	    // データベースなどに学生情報を保存する
	    boolean success = saveStudentToDatabase(newStudent);
	    
	    if (success) {
	        // 成功した場合は適切なレスポンスを設定する
	        res.setStatus(HttpServletResponse.SC_CREATED); // 201 Created
	        res.getWriter().println("Student created successfully");
	    } else {
	        // 失敗した場合は適切なエラーレスポンスを設定する
	        res.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
	        res.getWriter().println("Failed to create student");
	    }
	}
}
