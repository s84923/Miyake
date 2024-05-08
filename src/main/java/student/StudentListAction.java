package student;

import java.util.List;

import bean.Student;
import dao.StudentDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class StudentListAction {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // フォームからの入力を取得
        String enrollmentYear = request.getParameter("f1");
        String className = request.getParameter("f2");
        boolean isEnrolled = Boolean.parseBoolean(request.getParameter("f3"));

        // StudentDAO を使って絞り込み検索を実行し、結果を取得
        StudentDAO studentDAO = new StudentDAO();
        List<Student> students = studentDAO.getFilteredStudents(enrollmentYear, className, isEnrolled);

        // 取得した結果をリクエスト属性に設定
        request.setAttribute("list", students);

        // 結果を表示するJSPにフォワード
        return "/studentlist.jsp";
    }
    
}
