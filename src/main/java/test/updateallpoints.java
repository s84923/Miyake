package test;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test/updateallpoints")
public class updateallpoints extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        // フォームから送信されたデータの取得
        String studentNo = request.getParameter("studentNo");
        String subjectName = request.getParameter("subjectName");
        String testNo = request.getParameter("testNo");
        String points = request.getParameter("points");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // データベースへの接続
            Class.forName("org.h2.Driver");
            conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/zaiko", "sa", "");

            // 科目名から科目コードを取得
            String subjectCodeQuery = "SELECT CD FROM SUBJECT WHERE NAME = ?";
            PreparedStatement subjectCodeStmt = conn.prepareStatement(subjectCodeQuery);
            subjectCodeStmt.setString(1, subjectName);
            ResultSet subjectCodeResult = subjectCodeStmt.executeQuery();

            String subjectCode = "";
            if (subjectCodeResult.next()) {
                subjectCode = subjectCodeResult.getString("CD");
            } else {
                out.println("科目が見つかりません。");
                return;
            }

            // 成績の更新クエリを実行
            String sql = "UPDATE TEST SET POINT = ?, SUBJECT_CD = ?, CLASS_NUM = ? " +
                         "WHERE STUDENT_NO = ? AND NO = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, points);
            pstmt.setString(2, subjectCode);
            pstmt.setString(3, request.getParameter("class"));
            pstmt.setString(4, studentNo);
            pstmt.setString(5, testNo);

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                out.println("成績が更新されました。");
            } else {
                out.println("成績の更新に失敗しました。");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("エラーが発生しました。");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
