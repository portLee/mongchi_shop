package com.example.mongchi_shop.controller;

import com.example.mongchi_shop.dto.CartDTO;
import com.example.mongchi_shop.service.CartService;
import lombok.extern.log4j.Log4j2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log4j2
@WebServlet("/cart/add")
public class CartAddController extends HttpServlet {
    private final CartService CARTSERVICE = CartService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("/cart/add");

        HttpSession session = req.getSession();
        String orderId = (String) session.getAttribute("orderId");
        log.info(orderId);

        int pno = Integer.parseInt(req.getParameter("pno"));
        log.info("pno: " + pno);

        try {
            CartDTO cartDTO = CartDTO.builder()
                    .orderId(orderId)
                    .emailId("test@naver.com")
                    .pno(pno)
                    .build();
            log.info("cartDTO: " + cartDTO);

            CARTSERVICE.addCart(cartDTO);
        } catch (Exception e) {
            log.info(e.getMessage());
            throw new ServletException("add error");
        }

        resp.sendRedirect("/products/product?pno="+pno);
    }
}
