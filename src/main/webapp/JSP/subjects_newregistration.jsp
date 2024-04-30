<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.html"%>
<%@ page import="dao.DAO" %>


<h2>科目情報登録</h2>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<label>科目コード</label>
	<br>
	<input type="text" readonly value="ここにテキストを入力してください">
	<br>
	<label for="name">科目名:</label>
	<br>
    <input type="text" id="name" name="name" maxlength="30" required placeholder="科目名を入力してください">
    <br></br>
    <button><a href="subjects_newregistion_fin.jsp"> 登録</button>
    <br>
    <a href="subject_management.jsp">戻る</a>
</body>
