<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://kit.fontawesome.com/dc88001a08.js" crossorigin="anonymous"></script>
    <title>Home</title>
    <style>
        .banner {
            width: 100%;
            opacity: 0.8;
        }
    </style>
</head>
<body>

<jsp:include page="../inc/menu.jsp"/>

<img src="/images/banner.jpg" class="banner">

<jsp:include page="../inc/footer.jsp"/>

</body>
</html>
