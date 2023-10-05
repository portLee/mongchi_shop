<%--
  Created by IntelliJ IDEA.
  User: 이헌구
  Date: 2023-09-27
  Time: 오후 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>상품등록</title>
</head>
<body>
<form action="/admin/products/modify" method="post" enctype="multipart/form-data">
  <input type="hidden" name="pno" value="${productDTO.pno}">
  <div>상품코드: <input type="text" name="pcode" value="${productDTO.pcode}" required></div>
  <div>상품이름: <input type="text" name="productName" value="${productDTO.productName}" required></div>
  <div>상품가격: <input type="number" name="unitPrice" value="${productDTO.unitPrice}" required></div>
  <div>상품설명: <textarea name="description" cols="30" rows="10" required>${productDTO.description}</textarea></div>
  <div>
    상품종류:
    A<input type="radio" name="category" value="A" ${productDTO.category.equals("A") ? "checked" : ""}>
    B<input type="radio" name="category" value="B" ${productDTO.category.equals("B") ? "checked" : ""}>
    C<input type="radio" name="category" value="C" ${productDTO.category.equals("C") ? "checked" : ""}>
  </div>
  <div>상품재고: <input type="number" name="unitsInstock" value="${productDTO.unitsInstock}" required></div>
  <div>
    상품이미지
    <img src="/${productDTO.fileName}" alt="상품이미지">
    <input type="file" name="file">
  </div>
  <div>주문수량: <input type="number" name="accumulatedOrders" value="${productDTO.accumulatedOrders}" required></div>
  <div>리뷰 수:<input type="number" name="reviewCount" value="${productDTO.reviewCount}" required></div>
  <button type="submit">등록</button>
</form>
</body>
</html>
