package com.example.mongchi_shop.dto;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdminDTO {
    private int ano;
    private String id;
    private String passwd;
    private String name;
//    private String[] roles;
}
