package com.example.mongchi_shop.dao;

import com.example.mongchi_shop.domain.ProductVO;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminDAO {
    public void insertProduct(ProductVO productVO) throws SQLException {
        // 상품등록
        String sql = "insert into product (pcode, productName, unitPrice, description, category," +
                " unitsInstock, fileName, accumulatedOrders, reviewCount, addDate)" +
                " values (?, ?, ?, ?, ?, ?, ?, ?, ?, now())";

        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, productVO.getPcode());
        preparedStatement.setString(2, productVO.getProductName());
        preparedStatement.setInt(3, productVO.getUnitPrice());
        preparedStatement.setString(4, productVO.getDescription());
        preparedStatement.setString(5, productVO.getCategory());
        preparedStatement.setInt(6, productVO.getUnitsInstock());
        preparedStatement.setString(7, productVO.getFileName());
        preparedStatement.setInt(8, productVO.getAccumulatedOrders());
        preparedStatement.setInt(9, productVO.getReviewCount());
        preparedStatement.executeUpdate();
    }

    public void updateProduct(ProductVO productVO) throws SQLException{
        // 상품 수정
        String sql = "update product set pcode = ?, productName = ?, unitPrice = ?, description = ?, category = ?," +
                " unitsInstock = ?, fileName = ?, accumulatedOrders = ?, reviewCount = ?  where pno = ?";
        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, productVO.getPcode());
        preparedStatement.setString(2, productVO.getProductName());
        preparedStatement.setInt(3, productVO.getUnitPrice());
        preparedStatement.setString(4, productVO.getDescription());
        preparedStatement.setString(5, productVO.getCategory());
        preparedStatement.setInt(6, productVO.getUnitsInstock());
        preparedStatement.setString(7, productVO.getFileName());
        preparedStatement.setInt(8, productVO.getAccumulatedOrders());
        preparedStatement.setInt(9, productVO.getReviewCount());
        preparedStatement.setInt(10, productVO.getPno());

        preparedStatement.executeUpdate();
    }

    public void deleteProduct(int pno) throws SQLException {
        // pno를 받아서 해당 번호의 데이터를 삭제
        String sql = "delete from product where pno = ?";

        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setInt(1, pno);
        preparedStatement.executeUpdate();
    }
}
