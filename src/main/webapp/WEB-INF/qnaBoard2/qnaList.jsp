<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>QnAList</title>
</head>
<%
    // 페이지
    int currentPage = 1;
    if(request.getParameter("currentPage")!=null){
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }
    System.out.println(currentPage);

    final int ROW_PER_PAGE = 10; // 페이지에 보일 주문 개수
    int beginRow = (currentPage-1)*ROW_PER_PAGE; // 리스트 목록 시작 부분
%>
<body>
    <div class="jumbo">
        <div class="container">
            <h1 class="display-3">QnAList</h1>
        </div>
    </div>
    <div class="container">
        <div style="padding-top: 50px">
            <table class="table table-hover">
                <tr>
                    <th>qno</th>
                    <th>emailId</th>
                    <th>pcode</th>
                    <th>questionSubject</th>
                    <th>questionDate</th>
                    <th>questionContent</th>
                    <th>answered</th>
                </tr>
                <c:forEach var="dto" items="${qnABoardDTOList}">
                <tr>
                    <td>${dto.qno}</td>
                    <td>${dto.emailId}</td>
                    <td>${dto.pcode}</td>
                    <td>${dto.questionSubject}</td>
                    <td>${dto.questionDate}</td>
                    <td>${dto.questionContent}</td>
                    <td>${dto.answered}</td>
                </tr>
            </table>
        </div>
<%--        <div align="center">--%>
<%--            <c:set var="pageNum" value="<%=pageNum%>"/>--%>
<%--            <c:forEach var="i" begin="1" end="<%=totalPage%>">--%>
<%--                <a href="./boardList.do?pageNum=${i}">--%>
<%--                        &lt;%&ndash;                    <a href="./boardList.do?pageNum=${i}&items=<%=items%>&text=<%=text%>">&ndash;%&gt;--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${pageNum==i}">--%>
<%--                            <font color="plum">[${i}]</font>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <font color="4C5317">[${i}]</font>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                </a>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>

</div>
</body>
</html>
