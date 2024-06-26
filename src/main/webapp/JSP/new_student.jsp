<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../header.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム</title>
</head>
<body>
    <h1>学生情報登録</h1>
    <form>
        <label for="yearSelect">入学年度</label>
        <select id="yearSelect" name="year" value="" required>
            <% 
                int currentYear = java.time.Year.now().getValue();
                for(int year = currentYear - 10; year <= currentYear + 10; year++) {
            %>
                <option value="<%= year %>"><%= year %></option>
            <% } %>
        </select>
        <br><br>
         <label for="studentId">学生番号</label>
        <input type="text" id="studentId" name="studentId" maxlength="10" required placeholder="学生番号を入力してください" value="" required>
        <br><br>
        <label for="name">氏名:</label>
        <br></br>
        <input type="text" id="name" name="name" maxlength="30" required placeholder="氏名を入力してください">
        <label for="name">氏名</label>
        <input type="text" id="name" name="name" maxlength="30" required placeholder="氏名を入力してください" value="" required>

        <br><br>

        
        

        <label for="name">クラス</label>
        <select type="select" id="name" name="class_num"></select<button>変更</button>>
        <br><br>
        <button type="submit" name="end">登録して終了</button>
        <br><br>
        <a href="student_management.jsp">戻る</a>
     </form>

</body>
</html>
