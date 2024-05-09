<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%@ include file="../header.jsp" %>
<%@ include file="../sidebar.jsp" %>

<h2 style="
    width:79%;
    background-color:#DCDCDC; 
    padding: 5px; 
    margin-bottom: 20px;
    margin-left: 20%;">成績管理</h2>

<div style="text-align: center; overflow: hidden;">
    <form action="" method="post" style="max-width: 600px; margin: 0 auto; display: flex; flex-wrap: wrap; justify-content: space-between; padding: 20px;">
        <div style="flex: 1 1 200px; margin-right: 20px; margin-bottom: 20px;">
            <label>入学年度</label><br> 
            <select name="nyugaku" style="width: 100%;">
                <option value="0">------</option>
                <option value="2020">2020</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
                <option value="2024">2024</option>
            </select>
        </div>
        
        <div style="flex: 1 1 200px; margin-right: 20px; margin-bottom: 20px;">
            <label>クラス</label><br>
            <select name="class" style="width: 100%;">
                <option value="0">------</option>
                <option value="131">131</option>
                <option value="201">201</option>
                <option value="101">101</option>
            </select>
        </div>
        
        <div style="flex: 1 1 200px; margin-right: 20px; margin-bottom: 20px;">
            <label>科目</label><br>
            <select name="subject" style="width: 100%;">
                <%-- 科目名を動的に取得 --%>
                <%
                Connection conn = null; 
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("org.h2.Driver");
                    conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/zaiko", "sa", "");
                    String query = "SELECT NAME FROM SUBJECT";
                    pstmt = conn.prepareStatement(query);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
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
        </div>
        
        <div style="flex: 1 1 200px; margin-right: 20px; margin-bottom: 20px;">
            <label>回数</label><br>
            <select name="kaisu" style="width: 100%;">
                <option value="0">------</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
            </select>
        </div>

        <input type="submit" value="検索" style="color: white; cursor: pointer; height: 40px; width: 97px; background-color: #87CEEB; border-radius: 1rem; border-style: none; margin-top: 20px;">
    </form>

<%

// フォームが送信されたかどうかを確認
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String entYear = request.getParameter("nyugaku");
    String classNum = request.getParameter("class");
    String subjectName = request.getParameter("subject");
    String testNo = request.getParameter("kaisu");
    String point = request.getParameter("tensu");
    String studentno = request.getParameter("bangou");



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
            out.println("<form method=\"post\" action=\"/team_miyake/test/updateallpoints\">");
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

<%@include file="../footer.jsp"%>


