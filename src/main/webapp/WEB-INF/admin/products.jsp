<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 이헌구
  Date: 2023-10-19
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Tables</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                    <li class="breadcrumb-item active">Tables</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-body">
                        DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                        <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                        .
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        DataTable Example
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>코드</th>
                                    <th>이름</th>
                                    <th>가격</th>
                                    <th>카테고리</th>
                                    <th>재고</th>
                                    <th>리뷰</th>
                                    <th>날짜</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>코드</th>
                                    <th>이름</th>
                                    <th>가격</th>
                                    <th>카테고리</th>
                                    <th>재고</th>
                                    <th>리뷰</th>
                                    <th>날짜</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <c:forEach var="product" items="${productDTOList}">
                                    <tr>
                                        <td>${product.pcode}</td>
                                        <td>${product.productName}</td>
                                        <td>${product.unitPrice}</td>
                                        <td>${product.category}</td>
                                        <td>${product.unitsInstock}</td>
                                        <td>${product.reviewCount}</td>
                                        <td>${product.addDate}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
