package in_out;

import bean.Teacher;
import dao.TeacherDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import tool.Action;

public class LoginAction extends Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        TeacherDAO dao = new TeacherDAO();
        Teacher teacher = dao.login(login, password);

        if (teacher != null) {
            session.setAttribute("teacher", teacher);
            return "login-out.jsp";
        }

        return "login-error.jsp";
    }
}
