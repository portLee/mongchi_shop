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
<%
    List<ProductDTO> productDTOList = (List<ProductDTO>) request.getAttribute("productDTOList");
    int currentPage = (int) request.getAttribute("currentPage");
    int totalPage = (int) request.getAttribute("totalPage");
    int pagePerBlock = 5;
    int totalBlock = totalPage % pagePerBlock == 0 ? totalPage/ pagePerBlock : totalPage /pagePerBlock + 1;
    int currentBlock = ((currentPage - 1) / pagePerBlock) + 1;
    int firstPage = ((currentBlock - 1) * pagePerBlock) + 1;
    int lastPage = currentBlock * pagePerBlock;
    lastPage = (lastPage > totalPage) ? totalPage : lastPage;
%>
<html>
<head>
    <title>상품 목록</title>
</head>
<body>
    <%
        for (int j = 0; j < productDTOList.size(); j++) {
            ProductDTO product = productDTOList.get(j);
    %>
        <ul style="list-style: none;">
            <li><%= product.getPno() %></li>
            <li><%= product.getPcode() %></li>
            <li><a href="/products/product?pno=<%= product.getPno() %>"><%= product.getProductName() %></a></li>
            <li><%= product.getUnitPrice() %></li>
            <li><%= product.getDescription() %></li>
            <li><%= product.getCategory() %></li>
            <li><%= product.getUnitsInstock() %></li>
            <li><img src="<%= product.getFileName() %>" alt="상품이미지" style="width: 100px"></li>
            <li><%= product.getAccumulatedOrders() %></li>
            <li><%= product.getReviewCount() %></li>
            <li><%= product.getAddDate() %></li>
        </ul>
    <%
        }
    %>

    <%-- 페이지 번호 --%>
    <div style="text-align: center">
        <c:set var="currentPage" value="<%= currentPage %>" />
        <a href="/products?currentPage=1">첫 페이지</a>
        <c:if test="<%= currentBlock > 1 %>">
            <a href="/products?currentPage=<%= firstPage - 1 %>">이전</a>
        </c:if>

        <c:forEach var="i" begin="<%= firstPage %>" end="<%= lastPage %>">
            <a href="/products?currentPage=${i}">
                <c:choose>
                    <c:when test="${currentPage == i}">
                        <span style="color: #4C5317;"><b>[${i}]</b></span>
                    </c:when>
                    <c:otherwise>
                        <span style="color: #4C5317;">[${i}]</span>
                    </c:otherwise>
                </c:choose>
            </a>
        </c:forEach>

        <c:if test="<%= currentBlock < totalBlock %>">
            <a href="/products?currentPage=<%= lastPage + 1 %>">다음</a>
        </c:if>
        <a href="/products?currentPage=${totalPage}">마지막 페이지</a>
    </div>
</body>
</html>
