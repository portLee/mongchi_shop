package com.example.mongchi_shop.service;

import com.example.mongchi_shop.dao.AdminDAO;
import com.example.mongchi_shop.dao.ProductDAO;
import com.example.mongchi_shop.domain.ProductVO;
import com.example.mongchi_shop.dto.ProductDTO;
import com.example.mongchi_shop.util.MapperUtil;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;

import javax.servlet.http.Part;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Log4j2
public enum AdminService {
    INSTANCE; // 싱글톤
    private AdminDAO adminDAO;
    private ProductDAO productDAO;
    private ModelMapper modelMapper;

    AdminService() {
        adminDAO = new AdminDAO();
        productDAO = new ProductDAO();
        modelMapper = MapperUtil.INSTANCE.getInstance();
    }

    public void registerProduct(ProductDTO productDTO) throws SQLException {
        log.info("registerProduct(ProductDTO productDTO)...");
        log.info("productDTO : " + productDTO);

        ProductVO productVO = modelMapper.map(productDTO, ProductVO.class);
        log.info("productVO : " + productVO);

        adminDAO.insertProduct(productVO);
    }

    public String getFileName(Part part) {
        // Part 객체로 전달된 이미지 파일로 부터 파일이름을 추출하기 위한 메서드
        String fileName = null;

        // 파일 이름이 들어있는 헤더 영역을 가져옴.
        String header = part.getHeader("content-disposition");
        log.info("File Header: " + header);

        // 파일 이름이 들어있는 속성 부분의 시작위치를 가져와 쌍따옴표 사이의 값 부분만 가져옴.
        int start = header.indexOf("filename=");
        fileName = header.substring(start + 10, header.length() - 1);
        log.info("파일명: " + fileName);

        return fileName;
    }

    public void modifyProduct(ProductDTO productDTO) throws SQLException {
        log.info("modifyProduct(ProductDTO productDTO)...");
        log.info("productDTO : " + productDTO);

        ProductVO productVO = modelMapper.map(productDTO, ProductVO.class);
        log.info("productVO : " + productVO);

        adminDAO.updateProduct(productVO);
    }

    public void removeProduct(int pno) throws SQLException {
        log.info("removeProduct(int pno)...");
        log.info("pno : " + pno);
        adminDAO.deleteProduct(pno);
    }

    public int getAllProductCount() throws SQLException {
        // 전체 상품 수 가져오기
        int count = productDAO.selectAllProductCount();
        log.info("count: " + count);

        return count;
    }

    public List<ProductDTO> getAllProduct(String field, String option, int currentPage, int limit) throws SQLException {
        List<ProductVO> productVOList = productDAO.selectAllProduct(field, option, currentPage, limit);
        List<ProductDTO> productDTOList = new ArrayList<>();

        for(ProductVO productVO : productVOList) {
            ProductDTO productDTO = modelMapper.map(productVO, ProductDTO.class);
            productDTOList.add(productDTO);
        }

        log.info("productDTOList...");
        for (ProductDTO product : productDTOList) {
            log.info(product);
        }

        return productDTOList;
    }

}
