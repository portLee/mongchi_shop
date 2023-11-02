<%@ page import="java.util.List" %>
<%@ page import="com.example.mongchi_shop.dto.ProductDTO" %><%--
  Created by IntelliJ IDEA.
  User: 이헌구
  Date: 2023-09-27
  Time: 오후 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    List<ProductDTO> productDTOList = (List<ProductDTO>) request.getAttribute("productDTOList");
    int currentPage = (int) request.getAttribute("currentPage");
    int totalPage = (int) request.getAttribute("totalPage");
    int pagePerBlock = 4;
    int totalBlock = totalPage % pagePerBlock == 0 ? totalPage/ pagePerBlock : totalPage /pagePerBlock + 1;
    int currentBlock = ((currentPage - 1) / pagePerBlock) + 1;
    int firstPage = ((currentBlock - 1) * pagePerBlock) + 1;
    int lastPage = currentBlock * pagePerBlock;
    lastPage = (lastPage > totalPage) ? totalPage : lastPage;

    System.out.println(currentBlock);
    System.out.println(totalBlock);
%>
<html>
<head>
    <link rel="stylesheet" href="/css/effect.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>상품 목록</title>
</head>
<body>
<!-- Start UI 공통 (복붙) -->
<!-- Navigation Bar -->
<jsp:include page="/WEB-INF/inc/menu.jsp" />
<script>
    $(function () {
        const imgSrcs = ['/images/char/img1.png', '/images/char/img2.png', '/images/char/img3.png', '/images/char/img4.png', '/images/char/img5.png'];
        const random = Math.ceil(Math.random() * 5);
        $('.hero-img-wrap img').attr('src', imgSrcs[random]);
    });

    // 페이지 로드시 bold 클래스 추가
    document.addEventListener('DOMContentLoaded', function () {
        const navItems = document.querySelectorAll('.nav a');
        const BOLD_CLASSNAME = 'bold';
        const sort = searchParam('sort');

        if (sort != null) {
            for (const item of navItems) {
                let href = item.getAttribute('href');

                if (href.includes('&')) {
                    href = href.split('&')[0];
                    console.log(href);
                }

                const splits = href.split('=');
                if (sort === splits[1]) {
                    item.classList.add(BOLD_CLASSNAME);
                    break;
                }
            }
        }
        else {
            console.log(navItems[0]);
            navItems[0].classList.add(BOLD_CLASSNAME);
        }

        function searchParam(key) {
            return new URLSearchParams(location.search).get(key);
        };
    });
</script>

<!-- Start Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-5">
                    <div class="intro-excerpt">
                        <h1 class="font-apply">상품목록</h1>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="hero-img-wrap" style="background-color: red;">
                        <img src="/images/char/img1.png" class="img-fluid fade-in-box" style="max-width: 50%;">
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- End Hero Section -->
<!-- End UI 공통 (복붙) -->

    <div class="untree_co-section product-section before-footer-section">
        <div class="container">
            <div class="float-end">
                <a href="/product/register">
                    <button class="btn btn-primary">상품등록</button>
                </a>
            </div>
            <nav class="row mb-5">
                <ul class="nav justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link text-black" href="/products?sort=NEW">최신등록순</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-black" href="/products?sort=PRICE_LOW&option=asc">낮은가격순</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-black" href="/products?sort=PRICE_HIGH">높은가격순</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-black" href="/products?sort=SALES">누적판매순</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-black" href="/products?sort=REVIEW">리뷰많은순</a>
                    </li>
                </ul>
            </nav>

            <div class="row">
                <c:forEach var="product" items="${productDTOList}">
                    <!-- Start Column -->
                    <div class="col-12 col-md-4 col-lg-3 mb-5">
                        <a class="product-item" href="/products/product?pno=${product.pno}">
                            <img src="${product.fileName}" class="img-fluid product-thumbnail" style="height: 70%;">
                            <h3 class="product-title">${product.productName}</h3>
                            <strong class="product-price">
                                <fmt:formatNumber type="number" maxFractionDigits="3" value="${product.unitPrice}"/>원
                            </strong>

                            <span class="icon-cross">
								<img src="images/cross.svg" class="img-fluid">
							</span>
                        </a>
                    </div>
                </c:forEach>
            </div>

            <%-- 페이지 번호 --%>
            <div>
                <ul class="pagination flex-wrap justify-content-center">
                    <c:if test="<%= currentBlock > 1 %>">
                        <li class="page-item">
                            <a class="page-link" data-num="<%= firstPage - 1 %>">prev</a>
                        </li>
                    </c:if>
                    <c:forEach var="num" begin="<%= firstPage %>" end="<%= lastPage %>">
                        <li class="page-item ${currentPage == num ? "active" : ""}">
                            <a class="page-link" data-num="${num}">${num}</a>
                        </li>
                    </c:forEach>
                    <c:if test="<%= currentBlock < totalBlock %>">
                        <li class="page-item">
                            <a href="#" class="page-link" data-num="<%= lastPage + 1 %>">next</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>

<jsp:include page="/WEB-INF/inc/footer.jsp" />

<script>
    // 페이지네이션
    document.querySelector('.pagination').addEventListener('click', function (e) {
        e.preventDefault();
        e.stopPropagation();

        const target = e.target;
        if(target.tagName !== 'A') {
            return;
        }
        const num = target.getAttribute('data-num');
        self.location = `/products?currentPage=\${num}&sort=${sort}&option=${option}`;
    });
</script>
</body>
</html>
