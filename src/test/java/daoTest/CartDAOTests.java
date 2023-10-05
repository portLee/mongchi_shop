package daoTest;

import com.example.mongchi_shop.dao.CartDAO;
import com.example.mongchi_shop.domain.CartVO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;
import java.util.List;

@Log4j2
public class CartDAOTests {
    private CartDAO cartDAO;

    @BeforeEach
    public void ready() {
        cartDAO = new CartDAO();
    }

    @Test
    public void testInsertCart() throws SQLException {
        CartVO cartVO = CartVO.builder()
                .orderId("1111")
                .emailId("1234")
                .pno(2)
                .build();
        cartDAO.insertCart(cartVO);
    }

    @Test
    public void testSelectCartByOrderId() throws SQLException {
        List<CartVO> list = cartDAO.selectCartByOrderId("1111");
        log.info(list);
    }
}
