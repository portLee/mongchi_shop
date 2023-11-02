package com.example.mongchi_shop.controller.product;

import com.example.mongchi_shop.service.ProductService;
import lombok.extern.log4j.Log4j2;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j2
@WebServlet("/product/remove")
public class ProductRemoveController extends HttpServlet {
    private final ProductService productService = ProductService.INSTANCE;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("/product/remove(POST)...");
        int pno = Integer.parseInt(req.getParameter("pno"));
        log.info("pno: " + pno);

        try {
            productService.removeProduct(pno);
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new ServletException("remove error");
        }
        resp.sendRedirect("/products");
    }
}
