<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.html"%>
<%@ page import="dao.DAO" %>


<h2>学生管理</h2>

<label>入学年度
  <s<form action="#" method="GET">
      <select name="f1" id="name">
        <option value="when">------</option>
        <option value="2023">2023</option>
        <option value="2022">2022</option>
        <option value="2021">2021</option>
      </select>
      <label>クラス
  <s<form action="#" method="GET">
      <select name="f2" id="name">
        <option value="where">------</option>
        <option value="201">201</option>
        <option value="131">131</option>
        <option value="101">101</option>
       </select>
    <input type="checkbox" name="f3" value="zaigaku">
    <label>在学中</label>
</form>

      <input type="submit" name="submit" value="絞込み" />

<%@include file="../footer.html"%>
      
    </form>
    </optgroup>
  </select>
</label>

</body>
</html>