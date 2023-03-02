package org.project.vo;

import lombok.Data;
import lombok.ToString;

import java.util.Date;


@Data
@ToString
public class BoardVO {
    Integer QANo;
    String title;
    String content;
    Date writeDate;
    Integer userNo;
    Integer count;
    String writer;
}
