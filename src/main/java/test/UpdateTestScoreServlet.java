package test;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/path/to/success.jsp]")
public class UpdateTestScoreServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // フォームからのデータ取得
        String studentNo = request.getParameter("studentno");
        String subjectName = request.getParameter("subjectname");
        String testNo = request.getParameter("testno");
        String newPoint = request.getParameter("point");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // データベースへの接続
            Class.forName("org.h2.Driver");
            conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/zaiko", "sa", "");

            // 更新クエリの実行
            String sql = "UPDATE TEST SET POINT = ? WHERE STUDENT_NO = ? AND SUBJECT_CD = (SELECT CD FROM SUBJECT WHERE NAME = ?) AND NO = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPoint);
            pstmt.setString(2, studentNo);
            pstmt.setString(3, subjectName);
            pstmt.setString(4, testNo);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("/path/to/success.jsp");
            } else {
                response.sendRedirect("/path/to/error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/path/to/error.jsp");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
