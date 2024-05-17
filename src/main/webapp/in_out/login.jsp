<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../header.jsp" %>

<style>
  body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f0f0f0;
  }

  .login-container {
    width: 400px;
    padding: 20px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  h2 {
    background-color: #DCDCDC;
    padding: 5px;
    margin-bottom: 20px;
    text-align: center;
  }

  form {
    display: flex;
    flex-direction: column;
  }

  input[type="text"],
  input[type="password"] {
    height: 40px;
    margin-bottom: 10px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  input[type="submit"] {
    color: white;
    cursor: pointer;
    height: 40px;
    width: 97px;
    background-color: #0000FF;
    border-radius: 1rem;
    border-style: none;
    margin-top: 20px;
  }

  .show-password {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
  }
</style>

<div class="login-container">
  <%-- エラーメッセージの表示 --%>
  <% String errorMessage = (String)request.getAttribute("errorMessage"); %>
  <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
    <div style="color: black;"><%= errorMessage %></div>
  <% } %>

  <h2>ログイン</h2>
  <form action="Login.action" method="post">
    <p>ID<input type="text" name="login" required></p>
    <p>パスワード<input type="password" name="password" required></p>
    <div class="show-password">
      <input type="checkbox" id="showPassword">
      <label for="showPassword">パスワードを表示</label>
    </div>
        <input type="submit" name="searchByTextbox" value="ログイン">
    
  </form>
</div>

<!-- 著作権情報と学園名 -->
<footer style="text-align: left; margin-top: 550px; margin-left: -250px;">
  <p>© 2023 TIC</p>
  <p>大原学園</p>
</footer>


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
