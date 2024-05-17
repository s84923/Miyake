<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Your Page Title</title>
</head>
<body>

<div id="sidebar" class="sidebar"></div>

<nav id="navigation" class="navigation">
    <ul>
        <li><a href="menu.jsp">メニュー</a></li>
        <li><a href="../studentmanage/studentlist.jsp">学生管理</a></li>
        <li>成績管理</li>
        <li><a href="#">成績登録</a></li>
        <li><a href="grade_search.jsp">成績参照</a></li>
        <li><a href="../jsp/subject_management.jsp">科目管理</a></li>
    </ul>
</nav>

<h2 style="
    width:79%;
    background-color:#DCDCDC; 
    padding: 5px; 
    margin-bottom: 20px;
    margin-left: 20%;">メニュー</h2>

<div class="container" style="text-align: center;">
    <div style="background: #FFCCFF; display: inline-block; width: 20%;">
        <br>
        <br>
        <a href="#">学生管理</a>
    </div>

    <div style="background: #CCFFCC; display: inline-block; width: 20%;">
        <a>成績管理<br></a>
        <a href="#">成績登録<br></a>
        <a href="#">成績参照</a>
    </div>

    <div style="background: #99CCFF; display: inline-block; width: 20%;">
        <br>
        <br>
        <a href="#">科目管理</a>
    </div>
</div>

<div class="footer-container" style="text-align: center;">
    <%@include file="../footer.jsp" %>
</div>

<style>
    .footer-container {
        margin-top: 20px;
    }
</style>

</body>
</html>
