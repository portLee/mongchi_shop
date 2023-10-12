<%@ page import="com.example.mongchi_shop.dto.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: 이헌구
  Date: 2023-09-27
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo");
    String emailId = memberDTO.getEmailId();
%>
<html>
<head>
    <title>상품정보</title>
</head>
<body>
    <!-- Navigation Bar -->
    <jsp:include page="/WEB-INF/inc/menu.jsp" />

    <!-- Start Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-5">
                    <div class="intro-excerpt">
                        <h1>상품정보</h1>
                    </div>
                </div>
                <div class="col-lg-7">

                </div>
            </div>
        </div>
    </div>
    <!-- End Hero Section -->

    <div class="container" style="max-width: 1200px;">
        <h1 class="mt-5 text-black">상품 상세 페이지</h1>
        <div class="row mt-3 border bg-white">
            <div class="col-md-6">
                <!-- 상품 이미지 -->
                <img src="${productDTO.fileName}" alt="상품 이미지" class="img-fluid">
            </div>
            <div class="col-md-6" style="padding: 5rem 1rem 1rem 5rem;">
                <!-- 상품 정보 -->
                <h2>${productDTO.productName}</h2>
                <hr>
                <p class="mt-4">${productDTO.description}</p>
                <div class="my-4 bg-light" style="padding: 15px">
                    <span>수량</span>
                    <hr>
                    <form action="#" name="frmProduct" method="post">
                        <input type="hidden" name="pno" value="${productDTO.pno}">
                        <input type="hidden" name="productName" value="${productDTO.productName}">
                        <input type="hidden" name="unitPrice" value="${productDTO.unitPrice}">
                        <input type="hidden" name="fileName" value="${productDTO.fileName}">
                        <input type="number" name="cnt" class="form-control" value="1" min="1">
                    </form>
                </div>
                <p>
                    <span>주문수 <b>${productDTO.accumulatedOrders}</b></span>
                    <span>리뷰수 <b>${productDTO.reviewCount}</b></span>
                </p>
                <h3 class="text-primary">총 상품금액 <span class="price">${productDTO.unitPrice}</span>원</h3>

                <div class="col-md-12 mt-4">
                    <c:set var="emailId" value="<%= emailId %>"/>
                    <c:choose>
                        <c:when test="${emailId eq 'admin'}">
                            <button id="btn-modify" class="btn btn-secondary">수정</button>
                            <button id="btn-remove" class="btn btn-primary">삭제</button>
                        </c:when>
                        <c:otherwise>
                            <button id="btn-add-cart" class="btn btn-secondary">장바구니</button>
                            <button id="btn-cart" class="btn btn-primary">장바구니 이동</button>
                            <button id="btn-Qna" class="btn btn-primary">상품문의</button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

  <script>
      document.addEventListener('DOMContentLoaded', function () {
          const frmProduct = document.querySelector('form[name=frmProduct]');
          const pno = document.querySelector('input[name=pno]').value;

          // 폼 submit 방지
          frmProduct.addEventListener('submit', function (event) {
              event.preventDefault();
          });

          // 총 상품금액
          const inputCnt = document.querySelector('input[name=cnt]');
          inputCnt.addEventListener('change', function () {
              const spanPrice = document.querySelector('span.price');

              if (inputCnt.value > 0) {
                  spanPrice.textContent = document.querySelector('input[name=unitPrice]').value * inputCnt.value;
              }
              else {
                  inputCnt.value = 1;
                  alert("제품수량은 1개이상 선택해야 합니다.");
              }
          });

          // 장바구니 추가
          const btnAddCart = document.querySelector('#btn-add-cart');
          btnAddCart.addEventListener('click', function () {
              frmProduct.action = '/cart/add';
              frmProduct.submit();
          });

          // 장바구니 이동
          const btnCart = document.querySelector('#btn-cart');
          btnCart.addEventListener('click', function () {
              location.href = '/cart/list';
          });

          // 상품문의 페이지 이동
          const btnQna = document.querySelector('#btn-Qna');
          btnQna.addEventListener('click', function () {
              location.href = '/qnaBoards?pno=' + pno;
          });

          const btnModify = document.querySelector('#btn-modify');
          btnModify.addEventListener('click', function () {
              location.href = '/admin/product/modify?pno=' + pno;
          });

          const btnRemove = document.querySelector('#btn-remove');
          btnModify.addEventListener('click', function () {
              location.href = '/admin/product/remove?pno=' + pno;
          });
      });
  </script>
</body>
</html>
