<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="../sidebar.jsp" %>
<%@ page import="dao.DAO" %>



<h2 style="
    width:79%;
    background-color:#DCDCDC; 
    padding: 5px; 
    margin-bottom: 20px;
    margin-left: 20%;">科目情報削除</h2>
    
    

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>


<
	
<!-- ボタン -->
<div style="max-width: 600px; margin: 0 auto; text-align: left;"> <!-- Changed text-align to left -->
    <p>「科目6(Z99)」を削除してもよろしいですか？</p>
	<form action="subfin.jsp" method="post">
        <input type="submit" name="searchByTextbox" value="削除" style="color: white; cursor: pointer; height: 40px; width: 97px; background-color: #FF0000; border-radius: 1rem; border-style: none; margin-top: 20px;">
    </form>
    <br>
    <br>
    <a href="subject_management.jsp">戻る</a>
</div>


</body>
</html>


<div style="text-align: center;">
    <%@include file="../footer.jsp" %>
</div>
