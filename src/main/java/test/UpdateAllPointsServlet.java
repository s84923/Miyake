package test;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/team_miyake/test/updateallpointss")
public class UpdateAllPointsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String entYear = request.getParameter("nyugaku");
        String classNum = request.getParameter("class");
        String subjectName = request.getParameter("subject");
        String testNo = request.getParameter("kaisu");

        out.println("<h1>一括更新されたデータ</h1>");
        out.println("<p>入学年度: " + entYear + "</p>");
        out.println("<p>クラス: " + classNum + "</p>");
        out.println("<p>科目: " + subjectName + "</p>");
        out.println("<p>回数: " + testNo + "</p>");
    }
}
