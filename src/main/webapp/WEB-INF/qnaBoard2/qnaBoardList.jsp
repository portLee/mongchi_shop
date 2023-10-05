<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <link href="/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <link href="/css/tiny-slider.css" rel="stylesheet">
  <link href="/css/style.css" rel="stylesheet">
  <link href="/scss/table.scss" rel="stylesheet">

  <script src="https://kit.fontawesome.com/dc88001a08.js" crossorigin="anonymous"></script>
    <title>qna</title>
</head>
<body>
<%
  List qnABoardDTOList=(List) request.getAttribute("qnABoardDTOList");
  int currentPage=(Integer) request.getAttribute("currentPage");
  int totalPage=(Integer) request.getAttribute("totalPage");

  int pagePerBlock=5; // 페이지 출력 시 나올 범위
  int totalBlock=totalPage%pagePerBlock==0 ? totalPage / pagePerBlock : totalPage / pagePerBlock+1; // 전체 블럭 수
  int thisBlock=((currentPage-1)/pagePerBlock)+1; // 현재 블럭
  int firstPage=((thisBlock-1)*pagePerBlock)+1; // 블럭의 첫 페이지
  int lastPage=thisBlock*pagePerBlock; // 블럭의 마지막 페이지
  lastPage=(lastPage>totalPage)?totalPage:lastPage;

  String emailId="d";


//  MemberDTO memberDTO=session.getAttribute("loginInfo");
//  String emailId=memberDTO.getEmailId();
%>


<%--<jsp:include page="../inc/menu.jsp"/>--%>

<!-- Start Hero Section -->
<div class="hero">
  <div class="container">
    <h1><span class="d-block">p126의 QnA 목록</span></h1>
  </div>
</div>
<!-- End Hero Section -->


<table class="fold-table">
  <thead>
  <tr>
    <th>답변 여부</th>
    <th>아이디</th>
    <th>제목</th>
    <th>작성일</th>
    <th>내용</th>
  </tr>
  </thead>

  <c:forEach var="qnaDto" items="${qnABoardDTOList}">
  <tbody>
  <tr class="view">
    <td>${qnaDto.isAnswered() ? "답변 완료" : "미답변"}</td>
    <td>${qnaDto.getEmailId()}</td>
    <c:if test="${qnaDto.secreted == true}">
      <c:choose>
        <c:when test="${qnaDto.emailId eq 'a'}">
          <td><a href="/qnaBoard/view?pcode=${qnaDto.pcode}&qno=${qnaDto.qno}">${qnaDto.questionSubject}</a></td>
        </c:when>
        <c:otherwise>
          <td><i class="fa-solid fa-lock"></i>&nbsp;비밀글입니다</td>
        </c:otherwise>
      </c:choose>
    </c:if>
    <td>${qnaDto.getQuestionDate()}</td>
    <td>${qnaDto.getQuestionContent()}</td>
    <p><a href="/qnaBoard/remove?qno=${qnaDto.qno}">삭제</a></p>
  </tr>
  </c:forEach>

  <tr class="fold">
    <td colspan="7">
      <c:forEach var="qnaDto" items="${qnABoardDTOList}">
        <div class="fold-content">
          <c:if test="${qnaDto.secreted == true && qnaDto.answered == true}">
            <c:choose>
              <c:when test="${qnaDto.emailId eq 'a'}">
                <p><a href="/qnaBoard/view?pcode=${qnaDto.pcode}&qno=${qnaDto.qno}">${qnaDto.questionSubject}</a></p>
                <p>${qnaDto.questionContent}</p>
                <p>${qnaDto.answerContent}</p>
                <p>${qnaDto.answerDate}</p>
              </c:when>
              <c:otherwise>
                <td><i class="fa-solid fa-lock"></i>&nbsp;비밀글입니다</td>
              </c:otherwise>
            </c:choose>
          </c:if>
        </div>
      </c:forEach>
    </td>
  </tr>


  </tbody>
</table>


<div></div>

<!-- 페이지 -->
<div style="text-align: center">
  <c:set var="currentPage" value="<%=currentPage%>"/>

  <a href="/qnaBoard/qnaList?currentPage=1"/><span>첫 페이지</span></a>
  <c:if test="${thisBlock>1}">
    <a href="/qnaBoard/qnaList?currentPage=${firstPage-1}"/><span>이전</span></a>
  </c:if>
  <c:forEach var="i" begin="<%=firstPage%>" end="<%=lastPage%>">
    <a href="/qnaBoard/qnaList?currentPage=${i}">
        <%--                    <a href="./boardList.do?pageNum=${i}&items=<%=items%>&text=<%=text%>">--%>
      <c:choose>
        <c:when test="${currentPage==i}">
          <font color="#2f4f4f"><b>[${i}]</b></font>
        </c:when>
        <c:otherwise>
          <font color="#696969">[${i}]</font>
        </c:otherwise>
      </c:choose>
    </a>
  </c:forEach>

  <c:if test="${thisBlock<totalBlock}">
    <a href="/qnaBoard/qnaList?currentPage=${lastPage+1}"/><span>다음</span></a>
  </c:if>
  <a href="/qnaBoard/qnaList?currentPage=${totalPage}"/><span>끝 페이지</span></a>

  <script src="/js/bootstrap.bundle.min.js"></script>
  <script src="/js/tiny-slider.js"></script>
  <script src="/js/custom.js"></script>
  <script src="/js/table.js"></script>
<%--  <jsp:include page="../inc/footer.jsp"/>--%>
</div>
</div>
</ul>
</body>
</html>
