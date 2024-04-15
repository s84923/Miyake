<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="../header.html"%>

<p>成績管理</p>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // データベースへの接続
        Class.forName("org.h2.Driver");
        conn = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/zaiko", "sa", "");
        
        // 科目を取得するクエリの実行
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT NAME FROM SUBJECT");
%>


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

<p>科目<p>
<select name="subject">
<%
// 科目名をセレクトボックスに追加
 while(rs.next()) {
 %>
<option><%= rs.getString("NAME") %></option>
<%
                }
            %>
</select>
        
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

<p>回数</p>
<select name="kaisu">
<%
for (int i = 1; i <= 10; i++) {
out.print("<option value=\"" + i + "\">" + i + "</option>");
}
%>
</select>




<%@include file="../footer.html"%>
