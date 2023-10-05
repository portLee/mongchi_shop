<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link href="/css/tiny-slider.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://kit.fontawesome.com/dc88001a08.js" crossorigin="anonymous"></script>
<!-- Start Header/Navigation -->

<style>
    @font-face {
        font-family: 'MBC1961GulimM';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/MBC1961GulimM.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    a.navbar-brand, ul { font-family: 'MBC1961GulimM'; }
</style>
<%
//    MemberDTO memberDTO=session.getAttribute("loginInfo");
//    String sessionMemberId=(String)memberDTO.getEmailId();
    String sessionMemberName=(String)session.getAttribute("memberName");
%>

<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

    <div class="container">
        <a class="navbar-brand" href="../../index.jsp">Mongchi Shop<span>.</span></a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsFurni">
            <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                <li class="nav-item active">
                    <a class="nav-link" href="../../index.jsp">Home</a>
                </li>
                <c:choose>
                    <c:when test="${empty sessionMemberId }">
                        <li class="nav-item"><a class="nav-link" href="../member/loginMember.jsp">LogIn</a></li>
                        <li class="nav-item"><a class="nav-link" href="../member/addMember.jsp">Register</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a class="nav-link">[${sessionMemberName}&nbsp;님]</a></li>
                        <li class="nav-item"><a class="nav-link" href="../member/processLogoutMember.jsp">LogOut</a></li>
                    </c:otherwise>
                </c:choose>
                <li><a class="nav-link" href="shop.html">Product</a></li>
<%--                <li><a class="nav-link" href="contact.html">Contact us</a></li>--%>
            </ul>

            <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                <li><a class="nav-link" href="../member/loginMember.jsp"><img src="/images/user.svg"></a></li>
                <li><a class="nav-link" href="../member/loginMember.jsp"><img src="/images/cart.svg"></a></li>
            </ul>
        </div>
    </div>

</nav>
<!-- End Header/Navigation -->