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

<!-- Navigation Bar -->
<jsp:include page="/WEB-INF/inc/menu.jsp" />

<!-- Start Hero Section -->
<div class="hero">
  <div class="container">
    <div class="row justify-content-between">
      <div class="col-lg-5">
        <div class="intro-excerpt">
          <h1 class="font-apply">상품 등록</h1>
        </div>
      </div>
      <div class="col-lg-7">

      </div>
    </div>
  </div>
</div>
<!-- End Hero Section -->

<div class="untree_co-section">
  <div class="container">
    <form action="/product/register" method="post" enctype="multipart/form-data">
      <div class="row">
        <div class="col-md-6 mb-5 mb-md-0">
          <h2 class="h3 mb-3 text-black font-apply">상품 등록</h2>
          <div class="p-3 p-lg-5 border bg-white">

            <div class="form-group row">
              <div class="col-md-12">
                <label for="pcode" class="text-black">상품코드 </label>
                <input type="text" class="form-control" id="pcode" name="pcode">
              </div>
            </div>

            <div class="form-group row">
              <div class="col-md-12">
                <label for="productName" class="text-black">상품이름 </label>
                <input type="text" class="form-control" id="productName" name="productName">
              </div>
            </div>

            <div class="form-group row">
              <div class="col-md-12">
                <label for="unitPrice" class="text-black">상품가격 </label>
                <input type="text" class="form-control" id="unitPrice" name="unitPrice">
              </div>
            </div>

            <div class="form-group row">
              <div class="col-md-12">
                <label class="text-black">상품종류 </label>
                <div class="form-check">
                  티셔츠 <input class="form-check-input" type="radio" name="category" value="T_shirt" checked>
                </div>
                <div class="form-check">
                  케이스 <input class="form-check-input" type="radio" name="category" value="Case">
                </div>
                <div class="form-check">
                  파우치 <input class="form-check-input" type="radio" name="category" value="Pouch">
                </div>
                <div class="form-check">
                  에코백 <input class="form-check-input" type="radio" name="category" value="Echo_bag">
                </div>
              </div>
            </div>

            <div class="form-group">
              <label for="description" class="text-black">상품 설명</label>
              <textarea name="description" id="description" cols="30" rows="5" class="form-control"></textarea>
            </div>

            <div class="form-group mt-3">
              <label for="unitsInstock" class="text-black">재고수 </label>
              <input type="number" class="form-control" name="unitsInstock" id="unitsInstock">
            </div>

            <div class="form-group row mb-5 mt-3">
                <div class="input-group mb-3">
                  <label class="input-group-text" for="file">Upload</label>
                  <input type="file" class="form-control" id="file" name="file" style="height: 38px;">
                </div>
            </div>

            <button type="submit" class="btn btn-primary">등록</button>
            <a href="/products" class="btn btn-danger">취소</a>
          </div>
        </div>
      </div>
    </form>
  </div>
</div>

<jsp:include page="/WEB-INF/inc/footer.jsp" />
</body>
</html>
