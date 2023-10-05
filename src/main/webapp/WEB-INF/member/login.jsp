<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-09-28
  Time: 오후 8:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<c:if test="${param.result == 'error'}">
    <h1 style="color: red" alert>아이디와 비밀번호를 확인해 주세요</h1>
</c:if>
<form action="/login" method="post">
    <p>이메일<input type="email" name="emailId"></p>
    <p>비번<input type="password" name="password"></p>
    <input type="checkbox" name="auto">자동 로그인
    <button type="submit">로그인</button>
</form>
</body>
</html>

</body>
</html>
