package com.example.mongchi_shop.dao;

import com.example.mongchi_shop.domain.ProductVO;
import lombok.Cleanup;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public List<ProductVO> selectAllProduct(int currentPage, int limit) throws SQLException {

        int beginRow = (currentPage - 1) * limit;
        String sql = "select * from product order by pno desc limit ?, ?";

        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, beginRow);
        preparedStatement.setInt(2, limit);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

        List<ProductVO> list = new ArrayList<>();
        while (resultSet.next()) {
            // 데이터베이스의 데이터를 TodoVO 객체에 저장해서 list에 추가
            ProductVO productVO = ProductVO.builder()
                    .pno(resultSet.getInt("pno"))
                    .pcode(resultSet.getString("pcode"))
                    .productName(resultSet.getString("productName"))
                    .unitPrice(resultSet.getInt("unitPrice"))
                    .description(resultSet.getString("description"))
                    .category(resultSet.getString("category"))
                    .unitsInstock(resultSet.getInt("unitsInstock"))
                    .fileName(resultSet.getString("fileName"))
                    .accumulatedOrders(resultSet.getInt("accumulatedOrders"))
                    .reviewCount(resultSet.getInt("reviewCount"))
                    .addDate(resultSet.getString("addDate"))
                    .build();
            list.add(productVO);
        }
        return list;
    }

    public int selectAllProductCount() throws SQLException {
        // 전체 상품 수 가져오기
        String sql = "select count(*) from product";

        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

        int count = 0;
        if(resultSet.next()) { // 데이터가 있는 경우
            count = resultSet.getInt(1);
        }

        return count;
    }

    public ProductVO selectProductByPno(int pno) throws SQLException {
        // pno와 일치하는 데이터 찾기
        String sql = "select * from product where pno = ?";
        @Cleanup Connection connection = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, pno);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();

        ProductVO productVO = null;
        if (resultSet.next()) {
            productVO = productVO.builder()
                    .pno(resultSet.getInt("pno"))
                    .pcode(resultSet.getString("pcode"))
                    .productName(resultSet.getString("productName"))
                    .unitPrice(resultSet.getInt("unitPrice"))
                    .description(resultSet.getString("description"))
                    .category(resultSet.getString("category"))
                    .unitsInstock(resultSet.getInt("unitsInstock"))
                    .fileName(resultSet.getString("fileName"))
                    .accumulatedOrders(resultSet.getInt("accumulatedOrders"))
                    .reviewCount(resultSet.getInt("reviewCount"))
                    .addDate(resultSet.getString("addDate"))
                    .build();
        }
        return productVO;
    }

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
