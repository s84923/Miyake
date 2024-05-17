<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="../sidebar.jsp" %>
<%@ page import="dao.DAO" %>



<h2 style="
    width:79%;
    background-color:#DCDCDC; 
    padding: 5px; 
    margin-bottom: 20px;
    margin-left: 20%;">科目情報変更</h2>
    
    

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<!-- 科目コード入力フォーム -->
<div style="max-width: 600px; margin: 0 auto; text-align: center;">
    <p>科目コード</p>
    <input type="text" name="studentno" placeholder="ここにテキストを入力してください" style="width: 80%; margin-bottom: 10px;">
</div>

<!-- 科目名入力フォーム -->
<div style="max-width: 600px; margin: 0 auto; text-align: center;">
    <p>科目名</p>
    <input type="text" name="studentno" placeholder="科目名を入力してください" style="width: 80%; margin-bottom: 10px;">
</div>

<!-- ボタン -->
<div style="max-width: 600px; margin: 0 auto; text-align: center;">

	<form action="subjects_newregistion_fin.jsp" method="post">
    <input type="submit" name="searchByTextbox" value="変更" style="color: white; cursor: pointer; height: 40px; width: 97px; background-color: #87CEEB; border-radius: 1rem; border-style: none; margin-top: 20px;">
</form>
		
    <br>
    <br>
    <a href="subject_management.jsp">戻る</a>
</div>

</body>
</html>