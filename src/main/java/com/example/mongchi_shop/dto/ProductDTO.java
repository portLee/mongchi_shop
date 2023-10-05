package com.example.mongchi_shop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
    private int pno; // 상품 번호
    private String pcode; // 상품 코드
    private String productName; // 상품 이름
    private int unitPrice; // 상품 가격
    private String description; // 상품 상세 설명
    private String category; // 상품 종류
    private int unitsInstock; // 재고 수
    private String fileName; // 상품 이미지
    private int accumulatedOrders; // 주문수량
    private int reviewCount; // 상품 리뷰수
    private String addDate; // 상품 등록 날짜
}
