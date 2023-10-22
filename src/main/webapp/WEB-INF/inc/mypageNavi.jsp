
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="/css/effect.css">

<script>
    // 메뉴 클릭 시 active 클래스 추가
    document.addEventListener('DOMContentLoaded', function () {
        const navItems = document.querySelectorAll('.justify-content-end a');
        const BOLD_CLASSNAME = 'bold';

        window.location.pathname;
        for (const item of navItems) {
            let href = item.getAttribute('href');
            if (window.location.pathname == href) {
                console.log(item);
                item.classList.add(BOLD_CLASSNAME);
                break;
            }
        }
    });
</script>

<nav class="row mb-5">
    <ul class="nav justify-content-end">
        <li class="nav-item">
            <a class="nav-link text-black" href="/member/mypage">장바구니</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-black" href="/member/myQnA">QnA</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-black" href="/review/myReview">나의 리뷰</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-black" href="/member/modify">정보수정</a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-black" href="/member/myorder">주문내역</a>
        </li>
    </ul>
</nav>
