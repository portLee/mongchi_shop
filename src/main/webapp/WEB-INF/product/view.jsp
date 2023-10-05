<%--
  Created by IntelliJ IDEA.
  User: 이헌구
  Date: 2023-09-27
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>상품상세</title>
</head>
<body>
  <ul>
      <li><c:out value="${productDTO.pcode}"/></li>
      <li><c:out value="${productDTO.productName}"/></li>
      <li><c:out value="${productDTO.unitPrice}"/></li>
      <li><c:out value="${productDTO.description}"/></li>
      <li><c:out value="${productDTO.category}"/></li>
      <li><c:out value="${productDTO.unitsInstock}"/></li>
      <li><c:out value="${productDTO.fileName}"/></li>
      <li><c:out value="${productDTO.accumulatedOrders}"/></li>
      <li><c:out value="${productDTO.reviewCount}"/></li>
      <li><c:out value="${productDTO.addDate}"/></li>
      <li>
          <a href="/cart/add?pno=${productDTO.pno}">장바구니 담기</a>
          <a href="/cart/list">장바구니로 이동</a>
      </li>
  </ul>
</body>
</html>
