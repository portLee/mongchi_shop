package com.example.mongchi_shop.controller.admin;

import com.example.mongchi_shop.controller.product.SortBy;
import com.example.mongchi_shop.dto.ProductDTO;
import com.example.mongchi_shop.service.AdminService;
import lombok.extern.log4j.Log4j2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Log4j2
@WebServlet("/admin/products")
public class AdProductListController extends HttpServlet {
    static final int ROW_PER_PAGE = 10; // 페이지당 게시물 숫자
    private final AdminService adminService = AdminService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("product list(GET)...");

        int currentPage = 1; // 페이지 번호의 기본 값
        int limit = ROW_PER_PAGE; // 페이지당 게시물 수
        String sort = req.getParameter("sort"); // 정렬 기준
        String option = "desc";
        log.info("sort: " + sort);
        log.info("option: " + option);

        // sort 값이 null이면 "NEW"를 삽입.
        if (sort == null) {
            sort = "NEW";
        }
        String field = SortBy.valueOf(sort).getField();
        log.info("field: " + field);

        if (req.getParameter("option") != null) {
            option = req.getParameter("option");
        }

        if (req.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(req.getParameter("currentPage"));
        }

        try {
            int totalRecord = adminService.getAllProductCount(); // 전체 게시물 수
            List<ProductDTO> productDTOList = adminService.getAllProduct(field, option, currentPage, limit);

            int totalPage; // 전체 페이지 계산
            if (totalRecord % limit == 0) {
                totalPage = totalRecord / limit;
                Math.floor(totalPage);
            }
            else {
                totalPage = totalRecord / limit;
                Math.floor(totalPage);
                totalPage = totalPage + 1;
            }

            req.setAttribute("currentPage", currentPage);
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("sort", sort);
            req.setAttribute("option", option);
            req.setAttribute("productDTOList", productDTOList);
            req.getRequestDispatcher("/WEB-INF/admin/products.jsp").forward(req, resp);
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new ServletException("list error");
        }
    }
}
