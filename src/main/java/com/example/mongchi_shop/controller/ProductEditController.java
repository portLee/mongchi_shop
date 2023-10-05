package com.example.mongchi_shop.controller;

import com.example.mongchi_shop.dto.ProductDTO;
import com.example.mongchi_shop.service.ProductService;
import lombok.extern.log4j.Log4j2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@Log4j2
@WebServlet("/admin/products")
public class ProductEditController extends HttpServlet {
    static final int LISTCOUNT = 10; // 페이지당 게시물 숫자
    ProductService PRODUCTSERVICE = ProductService.INSTANCE;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
        log.info("/admin/products(GET)...");

        int currentPage = 1; // 페이지 번호의 기본 값
        int limit = LISTCOUNT; // 페이지당 게시물 수
        if (req.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(req.getParameter("currentPage"));
        }

//        int totalRecord = dao.getListCount(items, text); // 전체 게시물 수
//        boardlist = dao.getBoardList(pageNum, limit, items, text);
//
//        int totalPage; // 전체 페이지 계산
//        if (totalRecord % limit == 0) {
//            totalPage = totalRecord / limit;
//            Math.floor(totalPage); // 왜하는거지?
//        }
//        else {
//            totalPage = totalRecord / limit;
//            Math.floor(totalPage);
//            totalPage = totalPage + 1;
//        }
//
//        // 페이지 시작 일련 번호 작업.
//        int startNum = totalRecord - (pageNum - 1) * limit;
//        System.out.println(startNum);
//
//        request.setAttribute("pageNum", pageNum);
//        request.setAttribute("totalPage", totalPage);
//        request.setAttribute("totalRecord", totalRecord);
//        request.setAttribute("boardList", boardlist);
//        request.setAttribute("startNum", startNum);

        try {
            List<ProductDTO> productDTOList = PRODUCTSERVICE.getAllProduct(currentPage, limit);
            log.info("productDTOList: " + productDTOList);
            req.setAttribute("productDTOList", productDTOList);
            req.getRequestDispatcher("/WEB-INF/product/edit.jsp").forward(req, resp);
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new ServletException("edit error");
        }
    }
}
