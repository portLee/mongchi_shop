package com.example.mongchi_shop.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AdminVO {
    private int ano;
    private String id;
    private String passwd;
    private String name;
//    private String[] roles;
}
