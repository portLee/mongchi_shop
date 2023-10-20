<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/WEB-INF/inc/menu.jsp" />
<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

    <div class="container">
        <a class="navbar-brand"> 로그인 <span>.</span></a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>


    </div>
</nav>
<div class="container">
    <c:if test="${param.result == 'error'}">
        <div class="alert alert-danger">
            아이디와 비밀번호를 확인해 주세요
        </div>
    </c:if>
    <form action="/login" method="post">
        <div class="form-group">
            <label>이메일</label>
            <input type="email" name="emailId" class="form-control">
        </div>
        <div class="form-group">
            <label>비번</label>
            <input type="password" name="password" class="form-control">
        </div>
        <div class="form-check">
            <input type="checkbox" name="auto" class="form-check-input">
            <label class="form-check-label">자동 로그인</label>
        </div>
        <button type="submit" class="btn btn-primary">로그인</button>
        <a href="/addMember" class="btn btn-link">회원가입</a>
    </form>
</div>
<jsp:include page="/WEB-INF/inc/footer.jsp" />
</body>
</html>