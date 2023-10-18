package daoTest;

import com.example.mongchi_shop.dao.ProductDAO;
import com.example.mongchi_shop.domain.ProductVO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;
import java.util.List;

@Log4j2
public class ProductDAOTests {
    private ProductDAO dao;

    @BeforeEach
    public void ready() {
        dao = new ProductDAO();
    }

    @Test
    public void testProductInsert() throws SQLException {
        for (int i = 0; i < 50; i++) {
            ProductVO productVO = ProductVO.builder()
                    .pcode("P00" + i)
                    .productName("상품" + i)
                    .unitPrice(10000)
                    .description("상품상세내용" + i)
                    .category("종류" + i)
                    .unitsInstock(100)
                    .fileName("sample.jpg")
                    .accumulatedOrders(10)
                    .reviewCount(5)
                    .build();
            dao.insertProduct(productVO);
        }

//        for (ProductVO product : dao.selectAllProduct()) {
//            log.info(product);
//        }
    }

    @Test
    public void testSelectProductByPno() throws SQLException {
        log.info(dao.selectProductByPno(2));
    }

    @Test
    public void testUpdateProduct() throws SQLException {
        ProductVO productVO = ProductVO.builder()
                .pno(1)
                .pcode("P0003")
                .productName("상품3")
                .unitPrice(10000)
                .description("상품상세내용3")
                .category("종류3")
                .unitsInstock(100)
                .fileName("sample.jpg")
                .accumulatedOrders(10)
                .reviewCount(5)
                .build();
        dao.updateProduct(productVO);

//        for (ProductVO product : dao.selectAllProduct()) {
//            log.info(product);
//        }
    }

    @Test
    public void testDeleteProduct() throws SQLException {
        dao.deleteProduct(2);
        log.info(dao.selectProductByPno(2));
    }

    @Test
    public void testSelectAllProductCount() throws SQLException {
        log.info(dao.selectAllProductCount());
    }

}
