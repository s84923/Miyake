<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="../header.html"%>
<%@ page import="dao.DAO" %>

<p>成績管理</p>

<form action="" method="post">

    <p>入学年度</p>
    <select name="nyugaku">
        <% 
        for (int i = 2015; i <= 2030; i++) {
            out.print("<option value=\"" + i + "\">" + i + "</option>");
        }
        %>
    </select>

    <p>クラス</p>
    <select name="class">
        <option value="101">101</option>
        <option value="131">131</option>
        <option value="201">201</option>
    </select>

    <p>科目</p>
    <select name="subject">
        <%
        Connection conn = null; 
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // データベースへの接続
            Class.forName("org.h2.Driver");
            conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/zaiko", "sa", "");
        
            // 科目名を取得するクエリの実行
            String query = "SELECT NAME FROM SUBJECT";
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while(rs.next()) {
        %>
                <option><%= rs.getString("NAME") %></option>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        %>
    </select>

    <p>回数</p>
    <select name="kaisu">
        <% 
        for (int i = 1; i <= 10; i++) {
            out.print("<option value=\"" + i + "\">" + i + "</option>");
        }
        %>
    </select>

    <input type="submit" value="検索">
</form>

<%

// フォームが送信されたかどうかを確認
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String entYear = request.getParameter("nyugaku");
    String classNum = request.getParameter("class");
    String subjectName = request.getParameter("subject");
    String testNo = request.getParameter("kaisu");

    Connection connPost = null; 
    PreparedStatement pstmtPost = null;
    ResultSet result = null;

    try {
        // データベースへの接続
        Class.forName("org.h2.Driver");
        connPost = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/zaiko", "sa", "");

        // SQLクエリを組み立てて実行
        String sql = "SELECT STUDENT.ENT_YEAR, STUDENT.CLASS_NUM, STUDENT.NO, STUDENT.NAME, TEST.POINT " +
                     "FROM STUDENT, SUBJECT, TEST " +
                     "WHERE STUDENT.SCHOOL_CD = SUBJECT.SCHOOL_CD AND " +
                     "      STUDENT.SCHOOL_CD = TEST.SCHOOL_CD AND " +
                     "      STUDENT.NO = TEST.STUDENT_NO AND " +
                     "      SUBJECT.CD = TEST.SUBJECT_CD AND " +
                     "      STUDENT.CLASS_NUM = TEST.CLASS_NUM AND " +
                     "      STUDENT.ENT_YEAR = ? AND " +
                     "      STUDENT.CLASS_NUM = ? AND " +
                     "      SUBJECT.NAME = ? AND " +
                     "      TEST.NO = ?";

        pstmtPost = connPost.prepareStatement(sql);
        pstmtPost.setString(1, entYear);
        pstmtPost.setString(2, classNum);
        pstmtPost.setString(3, subjectName);
        pstmtPost.setString(4, testNo);

        result = pstmtPost.executeQuery();

        // 結果を表示
        while (result.next()) {
            out.println("入学年度: " + result.getString("ENT_YEAR") + "<br>");
            out.println("クラス: " + result.getString("CLASS_NUM") + "<br>");
            out.println("学籍番号: " + result.getString("NO") + "<br>");
            out.println("氏名: " + result.getString("NAME") + "<br>");

            // テストポイントの入力フォーム
            out.println("<form method=\"post\" action=\"updatePoints\">");
            out.println("<input type=\"hidden\" name=\"studentNo\" value=\"" + result.getString("NO") + "\">");
            out.println("<input type=\"hidden\" name=\"subjectName\" value=\"" + subjectName + "\">");
            out.println("<input type=\"hidden\" name=\"testNo\" value=\"" + testNo + "\">");
            out.println("点数: <input type=\"text\" name=\"points\" value=\"" + result.getString("POINT") + "\">");
            out.println("</form>");
        }

        // 一括更新ボタン
		out.println("<form method=\"post\" action=\"/team_miyake/test/updateallpoints\">");
		out.println("<input type=\"hidden\" name=\"nyugaku\" value=\"" + entYear + "\">");
        out.println("<input type=\"hidden\" name=\"class\" value=\"" + classNum + "\">");
        out.println("<input type=\"hidden\" name=\"subject\" value=\"" + subjectName + "\">");
        out.println("<input type=\"hidden\" name=\"kaisu\" value=\"" + testNo + "\">");
        out.println("<input type=\"submit\" value=\"一括更新\">");
        out.println("</form>");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (result != null) result.close();
            if (pstmtPost != null) pstmtPost.close();
            if (connPost != null) connPost.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>

<%@include file="../footer.html"%>
