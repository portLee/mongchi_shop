<%@ page import="java.util.List" %>
<%@ page import="com.example.mongchi_shop.dto.OrderDTO" %>
<%@ page import="com.example.mongchi_shop.dto.OrderItemDTO" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2023-10-13
  Time: 오전 6:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<OrderDTO> orderDTOList = (List<OrderDTO>) request.getAttribute("orderDTOList");
%>

<html>
<head>
    <title>마이페이지</title>
</head>

<body>
<jsp:include page="/WEB-INF/inc/menu.jsp"/>
<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">
    <div class="container">
        <a class="navbar-brand">주문내역<span>.</span></a>
    </div>
</nav>


<div class="untree_co-section before-footer-section">
    <div class="container">
        <jsp:include page="/WEB-INF/inc/mypageNavi.jsp" />

        <div class="row mb-5">
            <form class="col-md-12" name="frmCart" method="get">
                <div class="site-blocks-table">
                    <table class="table">
                        <thead>

                        <tr>
                            <th class="product-thumbnail" colspan="2">상품정보</th>
                            <th class="product-name">주문일자</th>
                            <th class="product-quantity">주문번호</th>
                            <th class="product-quantity" style="width: 200px">주문금액<br>(수량)</th>
                            <th class="product-quantity" style="width: 200px">주문상태</th>
                            <th class="product-quantity" style="width: 200px">비고</th>
                        </tr>
                        </thead>
                        <tbody>

                        <%
                            for (OrderDTO order : orderDTOList) {
                        %>
                            <%
                                for (OrderItemDTO itemDTO : order.getItemDTOList()) {
                            %>
                            <tr>
                                <td class="product-thumbnail">
                                    <img src="<%= itemDTO.getFileName() %> " style="width: 100px">
                                </td>
                                <td class="product-thumbnail">
                                    <span><%= itemDTO.getProductName() %></span>
                                </td>
                                <td class="product-name">
                                    <h2 class="h5 text-black"><%= order.getOrderDate() %></h2>
                                </td>
                                <td class="product-name">
                                    <h2 class="h5 text-black"><%= order.getOrderId() %></h2>
                                </td>
                                <td class="product-name">
                                    <h2 class="h5 text-black"><%= itemDTO.getUnitPrice() * itemDTO.getCnt() %>원</h2>
                                    <span><%= itemDTO.getCnt() %>개</span>
                                </td>
                                <td class="product-name">
                                    <h2 class="h5 text-black"><%= order.getOrderStatus() %></h2>
                                </td>
                                <td>
                                    <a href="/review/add?pno=<%= itemDTO.getPno() %>&productName=<%=itemDTO.getProductName()%> ">리뷰작성</a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </form>
        </div>

    </div>
</div>
<!-- qna ----------------------------------------------->


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>






<jsp:include page="/WEB-INF/inc/footer.jsp" />
</body>
</html>
