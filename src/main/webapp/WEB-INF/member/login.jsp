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
<div class="hero">
    <div class="container">
        <h1 class="font-apply"><span class="d-block">로그인</span></h1>
    </div>
</div>

<div class="center">
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center"></div>
            <div class="row">
                <div class="col-md-12">
                    <h3 class="h5 mb-4 text-center"></h3>
                    <c:if test="${param.result == 'error'}">
                        <div class="alert alert-danger">
                            아이디와 비밀번호를 확인해 주세요.
                        </div>
                    </c:if>
                    <form action="/login" method="post">
                        <div class="form-group">
                            <label>이메일</label>
                            <input type="email" name="emailId" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>비밀번호</label>
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
            </div>
        </div>
    </section>
</div>
<jsp:include page="/WEB-INF/inc/footer.jsp" />
</body>
</html>