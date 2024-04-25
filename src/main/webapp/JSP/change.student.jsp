<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<body>
    <h1>学生情報登録</h1>
    <form>
        <label for="yearSelect">入学年度</label>
        <select id="yearSelect" name="year">
            <% 
                int currentYear = java.time.Year.now().getValue();
                for(int year = currentYear - 10; year <= currentYear + 10; year++) {
            %>
                <option value="<%= year %>"><%= year %></option>
            <% } %>
        </select>
         <label for="studentId">学生番号</label>
        <input type="text" id="studentId" name="studentId" maxlength="10" required placeholder="学生番号を入力してください">
        <br><br>
        <label for="name">氏名:</label>
        <input type="text" id="name" name="name" maxlength="30" required placeholder="氏名を入力してください" value=""required>
        <br><br>
        <label for="classId">クラス番号</label>
      <s<form action="#" method="GET">
      <select name="f2" id="name">
        <option value="where">------</option>
        <option value="201">201</option>
        <option value="131">131</option>
        <option value="101">101</option>
       </select>
       <br><br>
       <label>在学中</label>
           <input type="checkbox" name="si_attend" value="zaigaku">
 		<br>
       <button type="submit" name="end">変更</button>
       <br>
       <a href="#">戻る</a>
    </form>
<%@include file="../footer.html" %>
