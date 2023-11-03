<%@ page import="com.example.mongchi_shop.dto.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.mongchi_shop.dto.CartDTO" %>
<%@ page import="com.example.mongchi_shop.dto.QnABoardDTO" %>
<%@ page import="com.example.mongchi_shop.dto.MemberDTO" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="/css/tiny-slider.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <title>마이페이지</title>
    <%
        List<QnABoardDTO> qnABoardDTOList=(List<QnABoardDTO>) request.getAttribute("qnABoardDTOList");
        int currentPage=(Integer) request.getAttribute("currentPage");
        int totalPage=(Integer) request.getAttribute("totalPage");

        int pagePerBlock=5; // 페이지 출력 시 나올 범위
        int totalBlock=totalPage%pagePerBlock==0 ? totalPage / pagePerBlock : totalPage / pagePerBlock+1; // 전체 블럭 수
        int thisBlock=((currentPage-1)/pagePerBlock)+1; // 현재 블럭
        int firstPage=((thisBlock-1)*pagePerBlock)+1; // 블럭의 첫 페이지
        int lastPage=thisBlock*pagePerBlock; // 블럭의 마지막 페이지
        lastPage=(lastPage>totalPage)?totalPage:lastPage;

        MemberDTO memberDTO= (MemberDTO) session.getAttribute("loginInfo");
        String sessionEmailId=null;
        if(memberDTO!=null) {
            sessionEmailId= memberDTO.getEmailId();
        }
    %>
    <style>
        li { list-style: none; }
        .list { width: 1200px; margin: 0 auto; }
        .notice ul {
            width: 100%;
        }
        .answer {
            width: 100px;
            text-align: center;
        }
        .email {
            width: 150px;
            text-align: center;
        }

        .questionContent {
            width: 700px;
            text-align: center;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .questionDate {
            width: 120px;
            text-align: center;
        }

        .list > ul { position: relative; display: flex; margin-bottom: 0;}
        div ul li { position: relative; }

        .answerToggle li { width: 100%; text-align: center;}
        .toggle li { padding-top: 10px; }
        .toggle:hover {
            background: rgb(220 226 224);
        }


    </style>
</head>

<body>
<jsp:include page="/WEB-INF/inc/menu.jsp"/>

<div class="hero">
    <div class="container">
        <h1 class="font-apply"><span class="d-block">QnA</span></h1>
    </div>
</div>

<section class="untree_co-section before-footer-section">
    <div class="container">
        <jsp:include page="/WEB-INF/inc/mypageNavi.jsp" />
        <div class="row justify-content-center"></div>
        <div class="row">
            <div class="col-md-12">
                <h3 class="h5 mb-4 text-center"></h3>

                <div class="list">
                    <ul style="font-weight: bold; border-bottom: 2px solid black;" class="text-black">
                        <li class="answer">답변 여부</li>
                        <li class="questionContent">내용</li>
                        <li class="email">작성자</li>
                        <li class="questionDate">작성일</li>
                        <li class="questionDate">비고</li>
                    </ul>

                    <c:forEach var="qnaDto" items="${qnABoardDTOList}">
                        <c:if test="${not empty qnABoardDTOList}">
                            <%--            <c:if test="${fn:length(qnABoardDTOList) > 0}">--%>

                            <c:set var="sessionEmailId" value="<%=sessionEmailId%>"/>
                            <c:set var="emailId" value="${qnaDto.emailId}"/>
                            <c:set var="emailIdSplit" value="${fn:substringBefore(emailId,'@')}"/>
                            <c:set var="questionDate" value="${qnaDto.questionDate}"/>
                            <c:set var="questionDateSplit" value="${fn:substringBefore(questionDate,' ')}"/>
                            <c:set var="answerDate" value="${qnaDto.answerDate}"/>
                            <c:set var="answerDateSplit" value="${fn:substringBefore(answerDate,' ')}"/>
                            <ul class="toggle">
                                <li class="answer">${qnaDto.isAnswered() ? "답변 완료" : "미답변"}</li>

                                <c:if test="${qnaDto.secreted == true}">
                                    <c:choose>
                                        <c:when test="${qnaDto.emailId eq sessionEmailId}">
                                            <li class="questionContent">${qnaDto.questionContent}</li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="questionContent"><i class="fa-solid fa-lock"></i>&nbsp;비밀글입니다.</li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${qnaDto.secreted == false}">
                                    <li class="questionContent">${qnaDto.questionContent}</li>
                                </c:if>
                                <li class="email">${emailIdSplit}</li>
                                <li class="questionDate">${questionDateSplit}</li>
                                <li class="questionDate"><a href="/qnaBoard/modifyQuestion?pno=${qnaDto.pno}&qno=${qnaDto.qno}">수정/삭제</a></li>

                            </ul>
                        </c:if>
                    </c:forEach>
                    <hr>
                </div>
            </div>
        </div>
    </div>
</section>



<!-- 페이지 -->
<div>
    <c:set var="currentPage" value="<%=currentPage%>"/>

    <ul class="pagination flex-wrap justify-content-center">
        <c:if test="${thisBlock>1}">
            <li class="page-item">
                <a class="page-link" data-num="<%=firstPage-1%>">prev</a>
            </li>
        </c:if>
        <c:forEach var="num" begin="<%=firstPage%>" end="<%=lastPage%>">
            <li class="page-item ${currentPage == num ? "active" : ""}">
                <a class="page-link" data-num="${num}">${num}</a>
            </li>
        </c:forEach>
        <c:if test="<%=thisBlock<totalBlock%>">
            <li class="page-item">
                <a href="#" class="page-link" data-num="<%=lastPage+1%>">next</a>
            </li>
        </c:if>
    </ul>
</div>

<script>
    document.querySelector('.pagination').addEventListener('click', function (e) {
        e.preventDefault();
        e.stopPropagation();

        const target = e.target;
        if(target.tagName !== 'A') {
            return;
        }
        const num = target.getAttribute('data-num');
        self.location = `/member/myQnA?currentPage=\${num}`;
    });
</script>

    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/tiny-slider.js"></script>
    <script src="/js/custom.js"></script>

</div>

<jsp:include page="/WEB-INF/inc/footer.jsp" />
</body>
</html>
