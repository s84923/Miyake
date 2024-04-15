<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="../header.html"%>

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

            

<p>回数</p>
<select name="kaisu">
<%
for (int i = 1; i <= 10; i++) {
out.print("<option value=\"" + i + "\">" + i + "</option>");
}
%>
</select>




<%@include file="../footer.html"%>


あああ