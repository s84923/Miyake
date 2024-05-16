package test;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test/grade_management")
public class Grade_management extends HttpServlet {
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
            out.println("<h1>成績管理</h1>");
            out.println("登録が完了しました。");
            out.println("</body>");
            out.println("</html>");
            
            out.println("<br>");
            out.println("<a href=\"../grade_management.jsp\">戻る</a>");
            out.println("<a href=\"../grade_search.jsp\">成績参照</a>");

        } finally {
            out.close();
        }
    }
}
