package serviceTest;

import com.example.mongchi_shop.dto.ProductDTO;
import com.example.mongchi_shop.service.ProductService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

@Log4j2
public class ProductServiceTests {

    @Test
    public void testGetAllProduct() throws SQLException, InvocationTargetException, IllegalAccessException {
//        List<ProductDTO> list = ProductService.INSTANCE.getAllProduct();
//        for (ProductDTO productDTO : list) {
//            log.info(productDTO);
//        }
    }

    @Test
    public void testgetProductByPno() throws SQLException, InvocationTargetException, IllegalAccessException {
        log.info(ProductService.INSTANCE.getProductByPno(3));
    }

    @Test
    public void testAddProduct() throws SQLException, InvocationTargetException, IllegalAccessException {
        ProductDTO productDTO = ProductDTO.builder()
                .pcode("P055")
                .productName("상품1000")
                .unitPrice(10000)
                .description("상품상세내용1000")
                .category("종류1000")
                .unitsInstock(100)
                .fileName("sample.jpg")
                .accumulatedOrders(10)
                .reviewCount(5)
                .build();
//        ProductService.INSTANCE.addProduct(productDTO);
    }

    @Test
    public void testModifyProduct() throws SQLException {
        ProductDTO productDTO = ProductDTO.builder()
                .pcode("P055")
                .productName("상품2000")
                .unitPrice(10000)
                .description("상품상세내용1000")
                .category("종류1000")
                .unitsInstock(100)
                .fileName("sample.jpg")
                .accumulatedOrders(10)
                .reviewCount(5)
                .build();
        ProductService.INSTANCE.modifyProduct(productDTO);
    }

    @Test
    public void testRemoveProduct() throws SQLException, InvocationTargetException, IllegalAccessException {
        ProductService.INSTANCE.removeProduct(52);
        ProductService.INSTANCE.getProductByPno(52);
    }
}
