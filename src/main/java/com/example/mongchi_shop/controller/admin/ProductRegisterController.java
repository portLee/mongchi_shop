package com.example.mongchi_shop.controller.admin;

import com.example.mongchi_shop.dto.ProductDTO;
import com.example.mongchi_shop.service.AdminService;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@Log4j2
@WebServlet("/admin/product/register")
@MultipartConfig(maxFileSize = 10 * 1024 * 1024, location = "c:/upload/product")
public class ProductRegisterController extends HttpServlet {
    private final AdminService adminService = AdminService.INSTANCE.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("/admin/product/register(GET)...");
        req.getRequestDispatcher("/WEB-INF/product/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("/admin/product/register(POST)...");
        ProductDTO productDTO = new ProductDTO();
        try {
            // 이미지 파일 저장을 위해 request로 부터 Part 객체 참조.
            Part part = req.getPart("file");
            String fileName = adminService.getFileName(part);
            log.info("fileName: " + fileName);
            if (fileName != null && !fileName.isEmpty()) {
                part.write(fileName); // 파일 이름이 있으면 파일 저장
            }

            BeanUtils.populate(productDTO, req.getParameterMap());
            log.info("productDTO: " + productDTO);

            // 이미지 파일 이름을 News 객체에 저장.
            productDTO.setFileName("/upload/product/" + fileName);

            adminService.registerProduct(productDTO);
        } catch (Exception e) {
            log.info(e.getMessage());
            throw new ServletException("register error");
        }

        resp.sendRedirect("/admin/products");
    }

}
