<%@ page import="com.example.mongchi_shop.dto.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.mongchi_shop.dto.CartDTO" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-10-13
  Time: 오전 6:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<CartDTO> cartDTOList = (List<CartDTO>) session.getAttribute("cartDTOList");
%>

<html>
<head>
    <title>마이페이지</title>
</head>

<body>
<jsp:include page="/WEB-INF/inc/menu.jsp"/>
<div class="hero">
    <div class="container">
        <h1 class="font-apply"><span class="d-block">마이페이지</span></h1>
    </div>
</div>


<div class="untree_co-section before-footer-section">
    <div class="container">
        <jsp:include page="/WEB-INF/inc/mypageNavi.jsp" />
        <div class="row mb-5">
            <form class="col-md-12" name="frmCart" method="get">
                <div class="site-blocks-table">
                    <table class="table">
                        <thead>
                        <tr>
                            <th class="product-thumbnail">Image</th>
                            <th class="product-name">Product</th>
                            <th class="product-price">Price</th>
                            <th class="product-quantity">Quantity</th>
                            <th class="product-quantity">TotalPrice</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            int total = 0; // 총 주문금액
                            for (CartDTO cart : cartDTOList) {
                                int price = cart.getUnitPrice() * cart.getCnt();
                                total += price;
                        %>
                        <tr>
                            <td class="product-thumbnail">
                                <img src="<%= cart.getFileName() %>" alt="Image" class="img-fluid" style="width: 100px">
                            </td>
                            <td class="product-name">
                                <h2 class="h5 text-black"><%= cart.getProductName() %></h2>
                            </td>
                            <td><%= cart.getUnitPrice() %>원</td>
                            <td><%= cart.getCnt() %></td>
                            <td><%= cart.getCnt() * cart.getUnitPrice() %></td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="row mb-5">
                    <div class="col-md-10">
                        <a href="/cart/list" id="btn-products" class="btn btn-outline-black btn-sm btn-block">장바구니 상세페이지</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- qna ----------------------------------------------->


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>






<jsp:include page="/WEB-INF/inc/footer.jsp" />
</body>
</html>
