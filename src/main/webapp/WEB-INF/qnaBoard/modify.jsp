
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.mongchi_shop.dto.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QnA Modify</title>
  <link href="/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <link href="/css/tiny-slider.css" rel="stylesheet">
  <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<%
  int pno=(Integer)request.getAttribute("pno"); // doGet
//  int pno=Integer.parseInt(request.getParameter("pno"));
  MemberDTO memberDTO= (MemberDTO) session.getAttribute("loginInfo");
  String sessionEmailId=null;
  if(memberDTO!=null) {
    sessionEmailId= memberDTO.getEmailId();
  }
%>

  <jsp:include page="../inc/menu.jsp"/>

  <div class="hero">
    <div class="container">
      <h1 class="font-apply"><span class="d-block">Q&A 수정</span></h1>
    </div>
  </div>

  <section class="ftco-section">
    <div class="container">
      <div class="row justify-content-center"></div>
      <div class="row">
        <div class="col-md-12">
          <h3 class="h5 mb-4 text-black"></h3>
          <h3 class="h5 mb-4 text-black"><b>질문 수정</b></h3>

              <form id="modifyQuestionForm" action="/qnaBoards/modifyQuestion" method="post">
                <input type="hidden" name="qno" value="${qnABoardDTO.qno}" >
                <input type="hidden" name="pno" value="${qnABoardDTO.pno}" >
                <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="text-black">제품명</label>
                      <input type="text" name="productName" class="form-control" value="${qnABoardDTO.productName}" readonly>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="text-black">이메일</label>
                      <input type="text" name="emailId" class="form-control" value="<%=sessionEmailId%>" readonly>
                    </div>
                  </div>
                </div>
                <div class="form-group mb-5">
                  <label class="text-black">내용</label>
                  <textarea name="questionContent" class="form-control" cols="30" rows="5" required>
                    ${qnABoardDTO.questionContent}
                  </textarea>
                  <p><input type="checkbox" name="secreted" ${qnABoardDTO.secreted ? "checked " : ""}><label class="text-black">&nbsp;비밀글 설정&nbsp;</label></p>
                </div>
                <div class="form-group" style="margin-top: -30px;">
                  <button id="send" type="button" class="btn btn-primary-hover-outline" style="background: #3b5d50 !important; padding: 10px 20px !important;">수정</button>
                  <button type="reset" class="btn btn-primary-hover-outline" style="padding: 10px 20px !important;">초기화</button>
                  <button class="btn btn-secondary-hover-outline" style="padding: 10px 20px !important;"><a href="/qnaBoards?pno=<%=pno%>" style="text-decoration: none;" class="text-white">뒤로 가기</a></button>
                </div>

              </form>

        </div>
      </div>
    </div>
  </section>

<script>
  const questionForm = document.querySelector("#modifyQuestionForm");
  const questionContent = document.querySelector("#modifyQuestionForm textarea");
  const btn = document.querySelector("#send");
  btn.addEventListener("click", function () {
    questionContent.value = questionContent.value.trim();
    questionForm.submit();
  });
  document.addEventListener('DOMContentLoaded', function() {
    const content = document.querySelector("textarea");
    content.value = content.value.trim();
  });
</script>

  <script src="/js/bootstrap.bundle.min.js"></script>
  <script src="/js/tiny-slider.js"></script>
  <script src="/js/custom.js"></script>

  <jsp:include page="../inc/footer.jsp"/>
</body>
</html>
