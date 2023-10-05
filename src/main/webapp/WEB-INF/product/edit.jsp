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
<html>
<head>
    <title>상품 목록</title>
</head>
<body>
    <a href="/admin/products/register">상품등록</a>
    <c:forEach var="product" items="${productDTOList}">
        <ul style="list-style: none;">
            <li>${product.pno}</li>
            <li>${product.pcode}</li>
            <li><a href="/products/product?pno=${product.pno}">${product.productName}</a></li>
            <li>${product.unitPrice}</li>
            <li>${product.description}</li>
            <li>${product.category}</li>
            <li>${product.unitsInstock}</li>
            <li><img src="${product.fileName}" alt="상품이미지" style="width: 100px"></li>
            <li>${product.accumulatedOrders}</li>
            <li>${product.reviewCount}</li>
            <li>${product.addDate}</li>
            <li>
                <a href="/admin/products/modify?pno=${product.pno}">수정</a>
                <a href="/admin/products/remove?pno=${product.pno}">삭제</a>
            </li>
        </ul>
    </c:forEach>`
</body>
</html>
