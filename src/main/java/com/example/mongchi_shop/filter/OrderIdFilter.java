package com.example.mongchi_shop.filter;

import com.example.mongchi_shop.dto.MemberDTO;
import com.example.mongchi_shop.service.CartService;
import lombok.extern.log4j.Log4j2;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log4j2
@WebFilter(urlPatterns = {"/cart/*"})
public class OrderIdFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        log.info("OrderIdFilter...");

        // 주문번호 생성 및 사용
        HttpServletRequest req = (HttpServletRequest) request;

        HttpSession session = req.getSession();
        String orderId = (String) session.getAttribute("orderId");
        log.info("orderId: " + orderId);

        if (orderId == null) {
            // 세션 ID 가져오기
            String sessionId = session.getId();

            // 현재 날짜와 시간 가져오기
            java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
            String currentDateTime = simpleDateFormat.format(new java.util.Date());

            orderId = currentDateTime + "-" + sessionId;
            session.setAttribute("orderId", orderId);
            log.info("create orderId: " + orderId);

            MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo");
            String emailId = memberDTO.getEmailId();

            try {
                CartService.INSTANCE.modifyOrderId(orderId, emailId);
            } catch (Exception e) {
                log.info(e.getMessage());
                throw new ServletException("update error");
            }
        }

        chain.doFilter(request, response);
    }
}
