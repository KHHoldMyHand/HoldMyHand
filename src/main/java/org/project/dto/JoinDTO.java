package org.project.dto;

import java.util.Date;
import lombok.Data;
import lombok.ToString;
import java.util.Date;

@Data
@ToString
public class JoinDTO {
    private Integer userID;
    private String userPwd;
    private String userEmail;
    private String userAddress;
    private String corpName;
    private String corpType;
    private String corpManager;
    private String phoneNo;
}
