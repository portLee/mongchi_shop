package serviceTest;

import com.example.mongchi_shop.dto.CartDTO;
import com.example.mongchi_shop.service.CartService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;
import java.util.List;

@Log4j2
public class CartServiceTests {
    private CartService cartService;

    @BeforeEach
    public void ready() {
        cartService = CartService.INSTANCE;
    }

    @Test
    public void testGetCartByOrderId() throws SQLException {
//        List<CartDTO> list = cartService.getCartByOrderId("1111");
//        log.info(list);
    }

    @Test
    public void testAddCart() throws SQLException {
        CartDTO cartDTO = CartDTO.builder()
                .orderId("2222")
                .emailId("2456")
                .pno(4)
                .build();
        cartService.addCart(cartDTO);
    }
}
