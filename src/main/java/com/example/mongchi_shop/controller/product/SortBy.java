package com.example.mongchi_shop.controller.product;

import lombok.Getter;

@Getter
public enum SortBy {
    NEW("addDate"), // 신상품순
    PRICE_LOW("unitPrice"), // 가격낮은순
    PRICE_HIGH("unitPrice"), // 가격높은순
    SALES("accumulatedOrders"), // 판매많은순
    REVIEW("reviewCount"); // 리뷰많은순

    private String field;

    private SortBy(String field) {
        this.field = field;
    }
}
