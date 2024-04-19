<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>エラーメッセージ</title>
</head>
<body>
    <p id="error-message"><c:out value="${errorMessage}" /></p>
</body>
</html>
