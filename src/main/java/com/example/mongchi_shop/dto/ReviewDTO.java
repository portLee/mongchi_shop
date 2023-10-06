package com.example.mongchi_shop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class ReviewDTO {
    private Integer rno;
    private String emailId;
    private int pno;
    private Integer rate;
    private String content;
    private String addDate;
    private String fileName;
}
