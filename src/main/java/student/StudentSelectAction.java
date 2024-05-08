package student;

import java.io.IOException;
import java.util.List;

import bean.Student;
import dao.StudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class StudentSelectAction extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // フォームからの入力を取得
        String enrollmentYear = request.getParameter("f1");
        String className = request.getParameter("f2");
        boolean isEnrolled = Boolean.parseBoolean(request.getParameter("f3"));

        // StudentDAO を使って絞り込み検索を実行し、結果を取得
        StudentDAO studentDAO = new StudentDAO();
        List<Student> students = null;
        try {
            students = studentDAO.getFilteredStudents(enrollmentYear, className, isEnrolled);
        } catch (Exception e) {
            // エラーハンドリングを行う
            e.printStackTrace();
            // 必要に応じてエラーメッセージを設定し、適切にユーザーに通知する
        }

        // 取得した結果をリクエスト属性に設定
        request.setAttribute("list", students);

        // 結果を表示するJSPにフォワード
        request.getRequestDispatcher("/student_management.jsp").forward(request, response);
    }
}
