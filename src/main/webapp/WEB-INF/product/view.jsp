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
      <form action="#" name="frmProduct" method="post">
          <input type="hidden" name="pno" value="${productDTO.pno}">
          <input type="hidden" name="productName" value="${productDTO.productName}">
          <input type="hidden" name="unitPrice" value="${productDTO.unitPrice}">
          <input type="hidden" name="fileName" value="${productDTO.fileName}">
      </form>
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
          <button class="btn-add" type="button">장바구니 담기</button>
          <a href="/cart/list">장바구니로 이동</a>
          <a href="/qnaBoard/add?pno=${productDTO.pno}&productName=${productDTO.productName}">상품문의 등록</a>
      </li>
  </ul>

  <script>
      document.addEventListener('DOMContentLoaded', function () {
          const frmProduct = document.querySelector('form[name=frmProduct]');
          console.log(frmProduct);
          const btnAdd = document.querySelector('.btn-add');
          console.log(btnAdd);

          btnAdd.addEventListener('click', function () {
              frmProduct.action = '/cart/add';
              frmProduct.submit();
          });
      });
  </script>
</body>
</html>
