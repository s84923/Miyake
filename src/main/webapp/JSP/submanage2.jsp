<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="../header.jsp"%>
<%@ include file="../sidebar.jsp" %>

<h2 style="
    width:79%;
    background-color:#DCDCDC; 
    padding: 5px; 
    margin-bottom: 20px;
    margin-left: 20%;">科目管理</h2>
    
<a href="subjects_newregistration.jsp" style="float: right;">新規登録</a>


<table border="1" style="width: 60%; margin-left: 20%;">
    <tr>
        <th>科目コード</th>
        <th>科目名</th>
        <th></th>
    </tr>
</table>

<div style="text-align:center;"> <!-- Center the footer -->
    <%@include file="../footer.jsp"%>
</div>
