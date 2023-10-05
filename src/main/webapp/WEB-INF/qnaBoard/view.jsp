<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%--        <a href="/qnaBoard/view?pcode=${qnaDto.pcode}&qno=${qnaDto.qno}">${qnaDto.qno}</a>--%>
        <p>${qnABoardDTO.questionSubject}</p>
        <p>${qnABoardDTO.emailId}</p>
        <p>${qnABoardDTO.pcode}</p>
        <p>${qnABoardDTO.questionContent}</p>
        <p>${qnABoardDTO.questionDate}</p>
        <p>${qnABoardDTO.answered ? "답변 완료" : "답변 미완료"}</p>

    <form id="deleteForm" action="/qnaBoard/remove" method="post">
        <input type="hidden" name="qno" value="${qnABoardDTO.qno}" readonly>
        <div>
            <button type="submit">삭제</button>
        </div>
    </form>
</body>
</html>
