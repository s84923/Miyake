<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../header.html" %>
<form action="Login.action" method="post">
  <p>ログイン名<input type="text" name="login"></p>
  <p>パスワード<input type="password" name="password" id="passwordField"></p>
  <input type="checkbox" onclick="togglePasswordVisibility()">パスワードを表示

  <script>
    function togglePasswordVisibility() {
      var passwordField = document.getElementById("passwordField");
      if (passwordField.type === "password") {
        passwordField.type = "text";
      } else {
        passwordField.type = "password";
      }
    }
  </script>
  <p><input type="submit" value="ログイン"></p>
</form>

<%@include file="../footer.html" %>ile="../footer.html" %>