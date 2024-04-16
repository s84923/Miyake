<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="../header.html"%>
<%@ page import="dao.DAO" %>


<p>成績管理</p>


<p>入学年度</p>
<select name="nyugaku">
<%
for (int i = 2015; i <= 2030; i++) {
out.print("<option value=\"" + i + "\">" + i + "</option>");
}
%>
</select>


<p>クラス</p>
<p>
<select name="class">
<option value="サンプル1">101</option>
<option value="サンプル2">131</option>
<option value="サンプル3">201</option>
</select>
</p>

<body>

<%
    Connection conn = null; 
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // データベースへの接続
        Class.forName("org.h2.Driver");
        conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/zaiko", "sa", "");
        
        // 生徒の名前を取得するクエリの実行
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT NAME FROM SUBJECT");
%>

    
    <form action="kadai4444" method="post">
        <label for="subject">科目</label>
        <br><br>
        <select name="subject">
            <%
                // 生徒の名前をセレクトボックスに追加
                while(rs.next()) {
            %>
                <option><%= rs.getString("NAME") %></option>
            <%
                }
            %>
        </select>
    </form>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // リソースの解放
        if(rs != null) rs.close();
        if(stmt != null) stmt.close();
        if(conn != null) conn.close();
    }
%>
</body>

<p>回数</p>
<select name="kaisu">
<%
for (int i = 1; i <= 10; i++) {
out.print("<option value=\"" + i + "\">" + i + "</option>");
}
%>
</select>





<%@include file="../footer.html"%>


