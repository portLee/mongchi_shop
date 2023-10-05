<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>qnaBoard Add</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="/css/tiny-slider.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<style>
    input[type=text]{
        width: 500px;
        height: 32px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(233, 233, 233);
    }
    textarea {
        width: 500px;
        height: 100px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(233, 233, 233);
    }
    .center {
        text-align: center;
    }
    button {
        width: 100px;
        height: 30px;
        background: darkslategray;
        color: white;
        border: none;
    }
</style>
<body>
    <jsp:include page="../inc/menu.jsp"/>

    <div class="hero">
        <div class="container">
            <h1><span class="d-block">상품 Q&A 작성</span></h1>
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
                            <p><label>내용&nbsp;</label> <textarea name="questionContent" placeholder="문의하실 내용을 입력해 주세요." required></textarea></p>
                            <p><label>이메일&nbsp;</label> <input type="text" name="emailId" required></p>
                            <p><label>상품 코드&nbsp;</label> <input type="text" name="pcode" required></p>
                            <input type="checkbox" name="secreted"><label>&nbsp;비밀글 설정&nbsp;</label>
                            <button type="submit">전송</button>
                        </form>

                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="/js/bootstrap.bundle.min.js"></script>
    <script src="/js/tiny-slider.js"></script>
    <script src="/js/custom.js"></script>

    <jsp:include page="../inc/footer.jsp"/>
</body>
</html>
