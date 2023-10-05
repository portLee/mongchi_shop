<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>qnaBoard Add</title>
</head>
<body>
    <form action="/qnaBoard/add" method="post">
        <p>상품 이름: <input type="text" name="productName" value="<%= request.getParameter("productName") %>" readonly></p>
        <p>질문 내용: <textarea name="questionContent"></textarea></p>
        <input type="hidden" name="emailId" value="abcd1234@naver.com">
        <input type="hidden" name="pno" value="<%= request.getParameter("pno") %>">
        <input type="checkbox" name="secreted"><label>비밀글 설정</label>
        <button type="submit">전송</button>
    </form>

</body>
</html>
