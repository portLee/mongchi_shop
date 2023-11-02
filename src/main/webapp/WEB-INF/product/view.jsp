<%@ page import="com.example.mongchi_shop.dto.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: 이헌구
  Date: 2023-09-27
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo");
    String emailId = null;
    if (memberDTO != null) {
        emailId = memberDTO.getEmailId();
    }
%>
<html>
<head>
    <link rel="stylesheet" href="/css/review_star.css">
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
                        <h1 class="font-apply">상품정보</h1>
                    </div>
                </div>
                <div class="col-lg-7">

                </div>
            </div>
        </div>
    </div>
    <!-- End Hero Section -->

    <div class="container" style="max-width: 1200px;">
        <div class="row mt-5 border bg-white">
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
                <h3 class="text-primary">
                    총 상품금액
                    <span class="price">
                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${productDTO.unitPrice}"/>
                    </span>원
                </h3>

                <div class="col-md-12">
                    <div class="mt-4">
                        <button id="btn-add-cart" class="btn btn-secondary" style="width: 100%;">장바구니</button>
                    </div>
                    <div class="mt-3">
                        <button id="btn-cart" class="btn btn-primary">장바구니 이동</button>
                        <button id="btn-Qna" class="btn btn-primary">상품문의</button>
                        <button id="btn-list" class="btn btn-black">상품목록</button>
                    </div>
                    <c:if test="${role eq 'product'}">
                        <div class="mt-3">
                            <button id="btn-modify" class="btn btn-danger">상품수정</button>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- 리뷰 목록 UI 구현 -->

    <!-- 리뷰 목록 및 작성 섹션 -->
    <div class="container mt-5 mb-5" style="max-width: 1200px;">

        <!-- 리뷰 목록 헤더 -->
        <div class="row">
            <div class="col">
                <h1 class="mt-5 text-black font-apply">상품 리뷰</h1>
            </div>
        </div>

        <!-- 리뷰 목록 -->
        <div class="row mt-3">
            <div class="col-lg-12">

                <div class="card border bg-white">
                    <div class="card-body">
                        <table class="table">
                            <thead>
                            <tr class="title" align="center">
                                <th>번호</th>
                                <th>상품 이미지</th>
                                <th>내용</th>
                                <th>아이디</th>
                                <th>별점</th>
                                <th>작성일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- 리뷰 목록 반복문 -->
                            <c:forEach var="reviewVO" items="${reviewVOList}" varStatus="status">
                                <c:set var="reviewDateStr" value="${reviewVO.addDate}" />
                                <c:set var="reviewDateStrSplit" value="${fn:substringBefore(reviewDateStr,' ')}"/>
                                <c:set var="emailIdStr" value="${reviewVO.emailId}" />
                                <c:set var="emailIdStrSplit" value="${fn:substringBefore(emailIdStr,'@')}"/>
                                <tr class="content" align="center">
                                    <td style="font-size: 20px; vertical-align: middle;">${status.index + 1}</td>
                                    <td style="vertical-align: middle;"><img src="${reviewVO.fileName}" style="max-width: 100px; max-height: 100px;" alt="상품 이미지"></td>
                                    <td style="vertical-align: middle;">${reviewVO.content}</td>
                                    <td style="vertical-align: middle;">${emailIdStrSplit}</td>
                                    <td>
                                        <span class="star">
                                            ★★★★★
                                            <span style="width: ${reviewVO.rate * 10}%;">★★★★★</span>
                                            <input type="range" name="rate" value="${reviewVO.rate}" step="1" min="1" max="10" disabled>
                                        </span>
                                    </td>
                                    <td style="vertical-align: middle;">${reviewDateStrSplit}</td>
                                </tr>
                            </c:forEach>
                            <!-- 리뷰 목록 반복문 끝 -->
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/inc/footer.jsp" />

    <script>
      document.addEventListener('DOMContentLoaded', function () {
          const frmProduct = document.querySelector('form[name=frmProduct]');
          // const pno = document.querySelector('input[name=pno]').value;

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
              location.href = '/qnaBoards?pno=${productDTO.pno}&productName=${productDTO.productName}';
          });

          // 상품목록 페이지 이동
          const btnList = document.querySelector('#btn-list');
          btnList.addEventListener('click', function () {
              location.href = '/products';
          });

          // 상품수정
          const btnModify = document.querySelector('#btn-modify');
          btnModify.addEventListener('click', function () {
              location.href = '/product/modify?pno=${productDTO.pno}';
          });
      });
  </script>
</body>
</html>
