package student;
import java.io.IOException;
import java.util.List;

import dao.StudentDAO;
import bean.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class StudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 入学年度、クラス、在学中の情報をリクエストパラメータから取得
        int entYear = Integer.parseInt(request.getParameter("entYear"));
        String dassNum = request.getParameter("dassNum");
        boolean isAttend = Boolean.parseBoolean(request.getParameter("isAttend"));

        // DAOを使用して学生情報を取得する処理を記述
        StudentDAO studentDao = new StudentDaoImpl(); // 仮のDAO実装クラス
        List<Student> students = studentDao.filter(school, entYear, dassNum, isAttend);

        // 取得した学生情報をリクエスト属性にセット
        request.setAttribute("students", students);

        // JSPにフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("student-list.jsp");
        dispatcher.forward(request, response);
    }
}

