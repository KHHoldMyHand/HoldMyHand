package org.project.vo;

import lombok.Data;

@Data
public class ReplyVO {
    private Integer replyNo;
    private String replyContent;
    private Integer qaNo;
    private Integer userNo;
    private String reWriter;
}
