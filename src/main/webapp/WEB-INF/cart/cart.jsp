<%@ page import="com.example.mongchi_shop.dto.CartDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 이헌구
  Date: 2023-10-03
  Time: 오후 4:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<CartDTO> cartDTOList = (List<CartDTO>) session.getAttribute("cartDTOList");
%>
<html>
<head>
    <title>장바구니</title>
</head>
<body>
    <h3>장바구니</h3>
    <ul>
        <span><a href="#" class="btn-selected">선택삭제</a></span>
        <span><a href="#" class="btn-order">주문</a></span>
        <form action="#" name="frmCart" method="get">
            <c:forEach var="cart" items="<%= cartDTOList %>">
                <li>
                    <input type="hidden" name="cno" value="${cart.cno}">
                    <span><input type="checkbox" name="check" value="${cart.cno}"></span>
                    <span>${cart}</span>
                    <span data-pnm="plus" class="cntBtn">+</span>
                    <span class="cnt">${cart.cnt}</span>
                    <span data-pnm="minus" class="cntBtn">-</span>
                </li>
            </c:forEach>
        </form>
    </ul>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $('.cntBtn').click(function () {
            let pnm = $(this).data("pnm");
            let cnt = $(this).siblings(".cnt");
            let cno = $(this).siblings("input[name=cno]").val();
            console.log('cno: ' + cno, 'cnt: ' + cnt.text(), 'pnm: ' + pnm);

            // AJAX 요청 보내기
            $.ajax({
                url: "/cart/modify",
                method: "POST",
                data: {
                    cno: cno,
                    cnt: cnt.text(),
                    pnm: pnm
                },
                success: function (response) {
                    // 업데이트 성공
                    if (pnm === "plus") {
                        cnt.text(parseInt(cnt.text()) + 1);
                    }
                    else {
                        cnt.text(parseInt(cnt.text()) - 1);
                    }
                    console.log("수량 업데이트 성공: " + response.message);
                },
                error: function (xhr, status, error) {
                    console.error("수량 업데이트 실패: " + error);
                }
            });
        })
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const frmCart = document.querySelector("form[name=frmCart]");

            // 선택삭제
            const btnRemoveSelected = document.querySelector(".btn-selected");
            btnRemoveSelected.addEventListener("click", function () {
                if (confirm("정말 삭제하시겠습니까?")) {
                    frmCart.action = "/cart/remove";
                    frmCart.submit();
                }
            });

            const btnOrder = document.querySelector(".btn-order");
            btnOrder.addEventListener("click", function () {
                frmCart.action = "/shippingInfo";
                frmCart.submit();
            });
        });
    </script>
</body>
</html>
