package com.example.mongchi_shop.domain;

import lombok.*;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class ReviewVO {
    private Integer rno;
    private String emailId;
    private int pno;
    private Integer rate;
    private String content;
    private String addDate;
    private String fileName;
}