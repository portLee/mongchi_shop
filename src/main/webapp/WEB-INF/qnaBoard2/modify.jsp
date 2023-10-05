<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QnA Modify</title>
</head>
<body>
  <form id="modifyQuestionForm" action="/qnaBoard/modifyQuestion" method="post">
    <input type="text" name="qno" value="${qnABoardDTO.qno}" readonly>
    <input type="text" name="pcode" value="${qnABoardDTO.pcode}" readonly>
    <input type="text" name="emailId" value="${qnABoardDTO.emailId}" readonly>
    <textarea name="questionContent">${qnABoardDTO.questionContent}</textarea>
    ${qnABoardDTO.questionDate}
    답변 여부: <input type="text" name="answered" value="${qnABoardDTO.answered ? "답변 완료" : "답변 미완료"}">
    <button type="submit">수정</button>
  </form>

  <form id="modifyAnswerForm" action="/qnaBoard/modifyAnswer" method="post">
    <input type="hidden" name="qno" value="${qnABoardDTO.qno}">
    <textarea name="answerContent"></textarea>
    ${qnABoardDTO.answerDate}
    <button type="submit">답변 등록</button>
  </form>
</body>
</html>
