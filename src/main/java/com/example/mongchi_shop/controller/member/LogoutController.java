package com.example.mongchi_shop.controller.member;

import lombok.extern.log4j.Log4j2;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@Log4j2
@WebServlet("/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session=req.getSession();
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("remember-me")) {
                    cookie.setMaxAge(0); // 쿠키의 유효 시간을 0으로 설정하여 삭제
                    resp.addCookie(cookie); // 응답에 삭제된 쿠키를 추가
                }
            }
        }
        session.invalidate();
        log.info("로그아웃");
        resp.sendRedirect("/");
    }
}