package com.example.mongchi_shop.domain;

import lombok.*;

@Getter
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {
    private int cno; // 장바구니 번호
    private String orderId; // 주문번호 or 주문아이디
    private String emailId; // 회원 아이디
    private int pno; // 상품번호
    private int cnt; // 장바구니 개수
    private String addDate; // 장바구니 담은 날짜
}
