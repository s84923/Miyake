完成5

最新4

<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="../header.jsp"%>
<%@ include file="../sidebar.jsp" %>

<h2 style="
    width:79%;
    background-color:#DCDCDC; 
    padding: 5px; 
    margin-bottom: 20px;
    margin-left: 20%;">成績管理</h2>

<!-- セレクトボックスによる検索フォーム -->
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
                <option value="2025">2025</option>
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
                <option value="0">------</option>
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

        <input type="submit" name="searchBySelect" value="検索" style="color: white; cursor: pointer; height: 40px; width: 97px; background-color: #87CEEB; border-radius: 1rem; border-style: none; margin-top: 20px;">
    </form>

    <!-- テキストボックスによる検索フォーム -->
    <div style="flex: 1 1 200px; margin-right: 20px; margin-bottom: 20px;">
        <form action="" method="post" style="max-width: 600px; margin: 0 auto; display: flex; flex-wrap: wrap; justify-content: space-between; padding: 20px;">
            <div style="flex: 1 1 200px; margin-right: 20px; margin-bottom: 20px;">
                <p>学生番号</p>
                <input type="text" name="studentno" placeholder="学生番号を入力してください" style="width: 80%;">
                <input type="submit" name="searchByTextbox" value="検索" style="color: white; cursor: pointer; height: 40px; width: 97px; background-color: #87CEEB; border-radius: 1rem; border-style: none; margin-top: 20px;">
            </div>
        </form>
    </div>

<%
boolean isFirstIteration = true; // Declare isFirstIteration variable

if ("POST".equalsIgnoreCase(request.getMethod())) {
    // セレクトボックスでの検索
    if (request.getParameter("searchBySelect") != null) {
        String entYear = request.getParameter("nyugaku");
        String classNum = request.getParameter("class");
        String subjectName = request.getParameter("subject");

        Connection connSelect = null; 
        PreparedStatement pstmtSelect = null;
        ResultSet resultSelect = null;

        try {
            // データベースへの接続
            Class.forName("org.h2.Driver");
            connSelect = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/zaiko", "sa", "");

            // SQLクエリを組み立てて実行
            String sqlSelect ="SELECT STUDENT.ENT_YEAR, STUDENT.CLASS_NUM, STUDENT.NO, STUDENT.NAME, " +
                    "CASE WHEN TEST.NO = 1 THEN COALESCE(TEST.POINT, '-') ELSE NULL END AS POINT_1, " +
                    "CASE WHEN TEST.NO = 2 THEN COALESCE(TEST.POINT, '-') ELSE NULL END AS POINT_2 " +
                    "FROM STUDENT " +
                    "INNER JOIN TEST ON STUDENT.NO = TEST.STUDENT_NO " +
                    "INNER JOIN SUBJECT ON TEST.SUBJECT_CD = SUBJECT.CD " +
                    "WHERE STUDENT.ENT_YEAR = ? AND STUDENT.CLASS_NUM = ? AND SUBJECT.NAME = ?";


            pstmtSelect = connSelect.prepareStatement(sqlSelect);
            pstmtSelect.setString(1, entYear);
            pstmtSelect.setString(2, classNum);
            pstmtSelect.setString(3, subjectName);

            resultSelect = pstmtSelect.executeQuery();

            // 結果を表示
            boolean found = false;
            if (resultSelect.next()) {
                out.println("<style>table { width: 50%; margin: 0 auto; border-collapse: collapse; } td { border: 1px solid black; padding: 5px; text-align: left; }</style>");
                out.println("<table>");
                out.println("<caption style='text-align: left;'>科目: " + subjectName + "</caption>");
                out.println("<tr><th style=\"text-align: left;\">入学年度</th><th style=\"text-align: left;\">クラス</th><th style=\"text-align: left;\">学籍番号</th><th style=\"text-align: left;\">氏名</th><th style=\"text-align: left;\">1回</th><th style=\"text-align: left;\">2回</th></tr>");

                // 再度、クエリを実行し、テーブルに結果を表示
                do {
                    if (isFirstIteration) { // Check if it's the first iteration
                        isFirstIteration = false; // Set isFirstIteration to false after the first iteration
                    } else {
                        out.println("<tr>");
                        out.println("<td>" + resultSelect.getString("ENT_YEAR") + "</td>");
                        out.println("<td>" + resultSelect.getString("CLASS_NUM") + "</td>");
                        out.println("<td>" + resultSelect.getString("NO") + "</td>");
                        out.println("<td>" + resultSelect.getString("NAME") + "</td>");
                        out.println("<td>" + (resultSelect.getString("POINT_1") != null ? resultSelect.getString("POINT_1") : "-") + "</td>");
                        out.println("<td>" + (resultSelect.getString("POINT_2") != null ? resultSelect.getString("POINT_2") : "-") + "</td>");
                        out.println("</tr>");
                        found = true;
                    }
                } while (resultSelect.next());

                if (!found) {
                    out.println("<tr><td colspan=\"6\">学生情報が存在しませんでした。</td></tr>");
                }

                out.println("</table>");
            } else {
                out.println("<p>学生情報が存在しませんでした。</p>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSelect != null) resultSelect.close();
                if (pstmtSelect != null) pstmtSelect.close();
                if (connSelect != null) connSelect.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

 // テキストボックスでの検索
    if (request.getParameter("searchByTextbox") != null) {
        String studentNo = request.getParameter("studentno");

        Connection connTextbox = null; 
        PreparedStatement pstmtTextbox = null;
        ResultSet resultTextbox = null;

        try {
            // データベースへの接続
            Class.forName("org.h2.Driver");
            connTextbox = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/zaiko", "sa", "");

            // SQLクエリを組み立てて実行
            String sqlTextbox = "SELECT NAME FROM STUDENT WHERE NO = ?";

            pstmtTextbox = connTextbox.prepareStatement(sqlTextbox);
            pstmtTextbox.setString(1, studentNo);
            
            resultTextbox = pstmtTextbox.executeQuery();

            // 学生の氏名を取得
            String studentname = "";
            boolean studentExists = resultTextbox.next(); // 学籍番号に対するデータが存在するかどうか

            if (studentExists) {
                studentname = resultTextbox.getString("NAME");

                // テスト結果の取得
                String sqlTestResults = "SELECT SUBJECT.NAME AS SUBJECT_NAME, SUBJECT.CD AS SUBJECT_CD, TEST.POINT, TEST.NO " +
                                        "FROM TEST " +
                                        "LEFT JOIN SUBJECT ON TEST.SUBJECT_CD = SUBJECT.CD " +
                                        "WHERE STUDENT_NO = ?";

                pstmtTextbox = connTextbox.prepareStatement(sqlTestResults);
                pstmtTextbox.setString(1, studentNo);
                resultTextbox = pstmtTextbox.executeQuery();

                // 結果を表示
                boolean found = false;
                if (resultTextbox.next()) {
                    // テーブルの開始タグ
                    out.println("<style>table { width: 50%; margin: 0 auto; border-collapse: collapse; } td { border: 1px solid black; padding: 5px; text-align: left; }</style>");
                    out.println("<table>");
                    out.println("<caption style='text-align: left;'>氏名: " + studentname + "(" + studentNo + ")" + "</caption>");
                    out.println("<tr><th style='text-align: left;'>科目名</th><th style='text-align: left;'>科目コード</th><th style='text-align: left;'>回数</th><th style='text-align: left;'>点数</th></tr>");

                    // テーブルに結果を表示
                    do {
                        out.println("<tr>");
                        out.println("<td>" + resultTextbox.getString("SUBJECT_NAME") + "</td>");
                        out.println("<td>" + resultTextbox.getString("SUBJECT_CD") + "</td>");
                        out.println("<td>" + resultTextbox.getString("NO") + "</td>");
                        out.println("<td>" + (resultTextbox.getString("POINT") != null ? resultTextbox.getString("POINT") : "-") + "</td>");
                        out.println("</tr>");
                        found = true;
                    } while (resultTextbox.next());

                    // テーブルの終了タグ
                    out.println("</table>");
                }

                if (!found) {
                    // 成績情報が見つからない場合の処理
                    out.println("氏名: " + studentname +"(" + studentNo + ")" + "<br>成績情報が存在しませんでした。<br>");
                }

            } else {
                // 学籍番号に対するデータが存在しない場合の処理
                out.println("学籍番号 " + studentNo + " に対するデータが存在しません。<br>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultTextbox != null) resultTextbox.close();
                if (pstmtTextbox != null) pstmtTextbox.close();
                if (connTextbox != null) connTextbox.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
%>

<%@include file="../footer.jsp"%>
