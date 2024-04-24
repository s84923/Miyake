package test;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test/updateallpoints")
public class updateallpoints extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // POSTされたデータからsubjectを取得
            String subjectName = request.getParameter("subject");

            // 出力
            out.println("<html>");
            out.println("<head><title>一括更新 - 受信</title></head>");
            out.println("<body>");
            out.println("<h1>一括更新 - 受信</h1>");
            out.println("<p>POSTされたsubject: " + subjectName + "</p>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }
}
