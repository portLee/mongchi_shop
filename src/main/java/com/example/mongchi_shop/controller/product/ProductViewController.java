package com.example.mongchi_shop.controller.product;

import com.example.mongchi_shop.domain.ReviewVO;
import com.example.mongchi_shop.dto.MemberDTO;
import com.example.mongchi_shop.dto.ProductDTO;
import com.example.mongchi_shop.service.ProductService;
import com.example.mongchi_shop.service.QnABoardService;
import com.example.mongchi_shop.service.ReviewService;
import lombok.extern.log4j.Log4j2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j2
@WebServlet("/products/product")
public class ProductViewController extends HttpServlet {
    private final ProductService productService = ProductService.INSTANCE;
    private final ReviewService reviewService = ReviewService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException {
        log.info("/products/product(GET)...");

        HttpSession session = req.getSession();
        MemberDTO memberDTO = null;
        String role = "member";
        int pno = Integer.parseInt(req.getParameter("pno"));
        log.info("pno: " + pno);

        try {
            // ProductService에서 상품 데이터 가져오기
            ProductDTO productDTO = productService.getProductByPno(pno);
            // ReviewService에서 리뷰 데이터를 가져오기
            List<ReviewVO> reviewVOList = reviewService.getReview(pno);

            log.info("productDTO: " + productDTO);
            log.info("reviewVOList: " + reviewVOList);

            if (session.getAttribute("loginInfo") != null) {
                memberDTO = (MemberDTO) session.getAttribute("loginInfo");

                // 회원 역할 가져오기
                if(!memberDTO.getRole().isEmpty()) {
                    role = memberDTO.getRole();
                }
            }

            req.setAttribute("role", role);
            req.setAttribute("productDTO", productDTO);
            req.setAttribute("reviewVOList", reviewVOList);
            req.getRequestDispatcher("/WEB-INF/product/view.jsp").forward(req, resp);
        } catch (Exception e) {
            log.info(e.getMessage());
            throw new ServletException("view error");
        }
    }
}
