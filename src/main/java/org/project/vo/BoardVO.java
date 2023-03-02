package org.project.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;


@Data
@ToString
@Getter
@Setter
public class BoardVO {
    Integer QANo;
    String title;
    String content;
    Date writeDate;
    Integer userNo;
    Integer count;
    String writer;
}
