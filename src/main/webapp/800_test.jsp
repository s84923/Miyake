<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="../header.jsp"%>
<%@include file="../sidebar.jsp"%>


<h2 class="studentmanage"
	style="
	width:79%;
	background-color:#DCDCDC; 
	padding: 5px; 
	margin-bottom: 5%;
	margin-left: 20%;">成績管理</h2>
<div style="width: 50%; margin-left: 30%">
	<section class="me-4" style="width: 100%;">
	<div class="my-2 text-end px-4" style="margin-bottom: 1rem; margin-left: 500px;">
		<a href="../studentmanage/insert.jsp">新規登録</a>
	</div>
	<form action="../student/StudentList.action" method="post">
	<div style="width: 700px;
				height: 150px;
				box-sizing: border-box;
 				margin: 1em 0;
  				padding: 3rem;
  				border-radius: 1em;
  				border: 2px solid gainsboro;">
				<label>入学年度</label> 
				<label style="padding-left: 150px;">クラス番号</label><br>
		<div style="display: flex; align-items: center;">
				<select class="form-select" id="select_ent_year" name="f1" 
				style="width: 200px; height: 30px; border-radius: 10px; padding-left: 3px; font-size: 18px;">
					<option value="0">------</option>
					<option value="2020">2020</option>
					<option value="2021">2021</option>
					<option value="2022">2022</option>
					<option value="2023">2023</option>
					<option value="2024">2024</option>
				</select> 
				<select class="form-select"id="select_class_num" name="f2" 
				style="width: 200px; height: 30px; margin-left: 20px; border-radius: 10px; padding-left: 3px; font-size: 18px;">
					<option value="0">------</option>
					<option value="101">101</option>			
					<option value="131">131</option>
					<option value="201">201</option>
				</select>
		

    <br>
	<label style=""padding-left: 150px;">科目</label><br>
		<select class="form-select" id="class_num" name="subject" style="width: 700px; height: 40px;">
		<input class="form-check-input" type="checkbox"id="select_is_attend" name="f3" value="true">
			</div>
			</div>		
			</form>
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
    <br>

    <label style="float: left; padding-left: 170px">回数</label><br>
		<select class="form-select" id="class_num" name="class_num" style="width: 700px; height: 40px;">
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

    <br>

	<input type="submit" value="検索" 
			style="	color: white;
					margin-top: 50px;
					cursor: pointer;
					height: 55px;
					width: 97px; 
					background-color: #87CEEB;
					border-radius: 1rem;
					border-style: none;">
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