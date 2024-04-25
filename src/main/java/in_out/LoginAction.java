package in_out;

import bean.Teacher;
import dao.TeacherDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class LoginAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        TeacherDAO dao = new TeacherDAO();
        Teacher teacher = dao.login(login, password);

        if (teacher != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInTeacher", teacher);
            return "../index.jsp";
        } else {
            // エラーメッセージをリクエスト属性に設定
            request.setAttribute("errorMessage", "ログインに失敗しました。IDまたはパスワードが正しくありません。");
            return "login.jsp";
        }
    }
}
