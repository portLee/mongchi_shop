<%@ page import="com.example.mongchi_shop.dto.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>qnaBoard Add</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="/css/tiny-slider.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<%
    MemberDTO memberDTO= (MemberDTO) session.getAttribute("loginInfo");
    String emailId=null;
    if(memberDTO!=null) {
        emailId= memberDTO.getEmailId();
    }

    String productName= request.getParameter("productName");
%>

<body>
    <jsp:include page="../inc/menu.jsp"/>

    <div class="hero">
        <div class="container">
            <h1 class="font-apply"><span class="d-block">상품 Q&A 작성</span></h1>
        </div>
    </div>

    <div class="center">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center"></div>
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="h5 mb-4 text-center"></h3>

                        <form action="/qnaBoard/add" method="post">
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label class="text-black">제품명</label>
                                        <input type="text" name="productName" class="form-control" value="<%=productName%>" readonly>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label class="text-black">이메일</label>
                                        <input type="text" name="emailId" class="form-control" value="<%=emailId%>" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mb-5">
                                <label class="text-black">내용</label>
                                <textarea name="questionContent" class="form-control" cols="30" rows="5" placeholder="문의하실 내용을 입력해 주세요." required></textarea>
                                <p><input type="checkbox" name="secreted"><label class="text-black">&nbsp;비밀글 설정&nbsp;</label></p>
                            </div>
                            <div class="form-group" style="margin-top: -30px;">
                                <button id="send" type="button" class="btn btn-primary-hover-outline" style="padding: 10px 20px !important; background: #3b5d50 !important;">전송</button>
                                <button type="reset" class="btn btn-primary-hover-outline" style="padding: 10px 20px !important;">초기화</button>
                                <button class="btn btn-secondary-hover-outline" style="padding: 10px 20px !important;"><a href="javascript:history.back()" style="text-decoration: none;" class="text-white">뒤로 가기</a></button>
                            </div>

                            <input type="hidden" name="pno" value="<%= request.getParameter("pno") %>"><%-- 다음 페이지에 pno 전달하는 역할--%>

                        </form>

                    </div>
                </div>
            </div>
        </section>
    </div>

    <script>
        const frm = document.querySelector("form");
        const content = document.querySelector("textarea");
        const btn = document.querySelector("#send");
        btn.addEventListener("click", function () {
            content.value = content.value.trim();
            frm.submit();
        });

    </script>
    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/tiny-slider.js"></script>
    <script src="/js/custom.js"></script>

    <jsp:include page="../inc/footer.jsp"/>
</body>
</html>
