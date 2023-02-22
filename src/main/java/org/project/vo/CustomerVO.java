package org.project.vo;

import lombok.Data;
import oracle.sql.CHAR;

import java.util.Date;

@Data
public class CustomerVO {
    Integer userNo;
    Integer userID;
    String userPwd;
    String userEmail;
    Date userJoinDate;
    Character managerClassification;
    String userAddress;
    String corpName;
    String corpType;
    String corpManager;
    String phoneNo;
}
