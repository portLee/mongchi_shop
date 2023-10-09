<%@ page import="com.example.mongchi_shop.dto.CartDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.mongchi_shop.dto.MemberDTO" %>
<%@ page import="com.example.mongchi_shop.dto.ProductDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	List<CartDTO> cartDTOList = (List<CartDTO>) session.getAttribute("cartDTOList");
	MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo");
	String orderId = (String) session.getAttribute("orderId");
	int totalAmount = 0;

	for (CartDTO cartDTO : cartDTOList) {
		ProductDTO productDTO = cartDTO.getProductDTO();
		totalAmount += productDTO.getUnitPrice();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>
	
	<div class="container">
		<form action="/shippingInfo" method="post">
			<input type="hidden" name="orderId" value="<%= orderId %>">
			<input type="hidden" name="emailId" value="<%= memberDTO.getEmailId() %>">
			<input type="hidden" name="totalAmount" value="<%= totalAmount %>">
			<input type="hidden" name="orderStatus" value="주문완료">
			<div class="form-group row">
				<label class="col-sm-2">주문자 이름</label>
				<div class="col-sm-3">
					<input type="text" name="orderName" class="form-control" value="<%= memberDTO.getMemberName() %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">연락처</label>
				<div class="col-sm-3">
					<input type="text" name="tel" class="form-control" value="<%= memberDTO.getPhone() %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input type="text" name="zipCode" class="form-control"
						   value="<%= memberDTO.getZipCode() != null ? memberDTO.getZipCode() : "" %>" readonly>
					<span class="btn btn-secondary btnFindZipcode" style="cursor:pointer;">우편번호 검색</span> <br>
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">주소 1</label>
				<div class="col-sm-3">
					<input type="text" name="address01" class="form-control"
						   value="<%= memberDTO.getAddress01() != null ? memberDTO.getAddress01() : "" %>" readonly>
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">주소 2</label>
				<div class="col-sm-3">
					<input type="text" name="address02" class="form-control"
						   value="<%= memberDTO.getAddress02() != null ? memberDTO.getAddress02() : "" %>">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-10">
				<a href="./cart.jsp" class="btn btn-secondary" role="button">이전</a>
					<input type="submit" class="btn btn-primary" value="주문하기">
				</div>
			</div>
		</form>
	</div>

	<!-- 다음 주소 검색 api -->
	<script>
        document.addEventListener('DOMContentLoaded', function () {
            const btnFindZipcode = document.querySelector('.btnFindZipcode');
            btnFindZipcode.addEventListener('click', execDaumPostcode);
        });
    </script>

    <script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
    <script>
        /* 
        카카오 우편번호 검색 가이드 페이지 :  https://postcode.map.daum.net/guide
        */
        function execDaumPostcode() {
            /* 상황에 맞춰서 변경해야 하는 부분 */
            const zipcode = document.querySelector("input[name=zipCode]");
            const address01 = document.querySelector("input[name=address01]");
            const address02 = document.querySelector("input[name=address02]");

            /* 수정없이 사용 하는 부분 */
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;
                    }
                    else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if(data.userSelectedType === 'R'){
                        //법정동명이 있을 경우 추가한다.
                        if(data.bname !== ''){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    zipcode.value = data.zonecode; //5자리 새우편번호 사용
                    address01.value = fullAddr;

                    // 커서를 상세주소 필드로 이동한다.
                    address02.focus();
                }
            }).open();
        }
    </script> 
</body>
</html>