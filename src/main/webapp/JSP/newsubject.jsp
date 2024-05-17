<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ include file="../sidebar.jsp" %>
<%@ page import="dao.DAO" %>



<h2 style="
    width:79%;
    background-color:#DCDCDC; 
    padding: 5px; 
    margin-bottom: 20px;
    margin-left: 20%;">科目情報登録</h2>
    
    

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
    <input type="text" id="subjectCode" name="subjectCode" placeholder="科目コードを入力してください" style="width: 80%; margin-bottom: 10px;">
    
    <!-- エラーメッセージ -->
    <div id="subjectCodeError" style="
        display:none;
        border:1px solid #FFA07A;
        background-color:#FFE4E1;
        padding:10px;
        margin-bottom:10px;
        border-radius:5px;">
        このフィールドを入力してください。
    </div>
</div>

<script>
// エラーメッセージを表示する関数
function showError() {
    var subjectCode = document.getElementById('subjectCode').value;
    var errorDiv = document.getElementById('subjectCodeError');
    if(subjectCode === '') {
        errorDiv.style.display = 'block';
    } else {
        errorDiv.style.display = 'none';
    }
}

// 入力フォームのイベントリスナー
document.getElementById('subjectCode').addEventListener('input', showError);
</script>


<!-- 科目名入力フォーム -->
<div style="max-width: 600px; margin: 0 auto; text-align: center;">
    <p>科目名</p>
    <input type="text" id="subjectName" name="subjectName" placeholder="科目名を入力してください" style="width: 80%; margin-bottom: 10px;">
</div>

<script>
// エラーメッセージを表示する関数
function showSubjectNameError() {
    var subjectName = document.getElementById('subjectName').value;
    var errorDiv = document.getElementById('subjectNameError');
    if (subjectName === '') {
        errorDiv.style.display = 'block';
    } else {
        errorDiv.style.display = 'none';
    }
}

// 入力フォームのイベントリスナー
document.getElementById('subjectName').addEventListener('input', showSubjectNameError);
</script>


<!-- ボタン -->
<div style="max-width: 600px; margin: 0 auto; text-align: center;">

	<form action="subfin.jsp" method="post">
    <input type="submit" name="searchByTextbox" value="登録" style="color: white; cursor: pointer; height: 40px; width: 97px; background-color: #87CEEB; border-radius: 1rem; border-style: none; margin-top: 20px;">
</form>
		
    <br>
    <br>
    <a href="subject_management.jsp">戻る</a>
</div>

</body>
</html>