package org.project.dto;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

@Data
@ToString
public class EvaluateSuccessDTO {
    private Integer userNo;
    private String score;
    private String fileDate;
}
