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
                <h1 class="mt-5 text-black">해당 상품리뷰</h1>
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
                                <tr class="content" align="center">
                                    <td>${status.index + 1}</td>
                                    <td><img src="${reviewVO.fileName}" style="max-width: 100px; max-height: 100px;" alt="상품 이미지"></td>
                                    <td>${reviewVO.content}</td>
                                    <td>${reviewVO.emailId}</td>
                                    <td>
                                        <span class="star">
                                            ★★★★★
                                            <span style="width: ${reviewVO.rate * 10}%;">★★★★★</span>
                                            <input type="range" value="${reviewVO.rate}" step="1" min="1" max="10" disabled>
                                        </span>
                                    </td>
                                    <td>${reviewVO.addDate}</td>
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
      });
  </script>

    <%-- 리뷰관련 script --%>
    <script>
        // 별점 관련 이벤트
        document.addEventListener('DOMContentLoaded', function () {
            const star_input = document.querySelector('.star > input.rate');
            const star_span = document.querySelector('.star > .rate');

            /* console.log(star_input);
             console.log(star_span);*/
            // 별점 드래그 할 때
            star_input.addEventListener('input', () => {
                console.log(star_input.value);
                let rate = (star_input.value * 10);
                star_span.style.width = rate + "%";

                document.querySelector("input[name=rate]").value = rate / 10;
                console.log("rate :" + document.querySelector("input[name=rate]").value);
                console.log(rate);
            });
        });

        // 리뷰 작성 폼 제출 전에 별점과 리뷰가 입력되었는지 확인
        document.querySelector('#reviewForm').addEventListener('submit', function (event) {
            const selectedRate = document.querySelector("input[name=rate]").value;
            const selectedText = document.querySelector("textarea[name=content]").value;

            console.log("Selected Rate:", selectedRate);
            console.log("Selected Text:", selectedText);

            // 별점을 입력하지 않았을 경우
            if (selectedRate === "") {
                alert("별점을 선택해주세요");
                event.preventDefault(); // 폼 제출을 막음
                return; // 다음 if절이 시행되지 않도록 return
            }

            // 리뷰를 작성하지 않았을 경우
            if (selectedText === "") {
                alert("리뷰를 작성해주세요")
                event.preventDefault(); // 폼 제출을 막음
            }
        });

        // 삭제 여부를 확인하는 JavaScript 함수
        function confirmDelete() {
            let result = window.confirm("정말 삭제하시겠습니까?");
            return result;
        }
    </script>
    <%-- 리뷰관련 script/ --%>
</body>
</html>
