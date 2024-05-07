<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../header.jsp" %>

<%-- エラーメッセージの表示 --%>
<% String errorMessage = (String)request.getAttribute("errorMessage"); %>
<% if (errorMessage != null && !errorMessage.isEmpty()) { %>
  <div style="color: black;"><%= errorMessage %></div>
<% } %>

<form action="Login.action" method="post">
  <p>ログイン名<input type="text" name="login" required></p>
  <p>パスワード<input type="password" name="password" required></p>
  <input type="checkbox" id="showPassword">パスワードを表示
  <p><input type="submit" value="ログイン"></p>
</form>

<%@include file="../footer.jsp" %>

<script>
  document.getElementById("showPassword").addEventListener("change", function() {
    var passwordField = document.querySelector("input[name='password']");
    if (this.checked) {
      passwordField.type = "text";
    } else {
      passwordField.type = "password";
    }
  });
</script>