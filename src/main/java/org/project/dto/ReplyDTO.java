package org.project.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ReplyDTO {

    private Integer replyNo;
    private String replyContent;
    private Integer qaNo;
    private Integer userNo;
    private String reWriter;
}