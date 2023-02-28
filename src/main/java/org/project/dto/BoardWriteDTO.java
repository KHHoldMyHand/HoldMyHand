package org.project.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BoardWriteDTO {

    private String title;
    private String content;
    private Integer userNo;
    private String writer;
}