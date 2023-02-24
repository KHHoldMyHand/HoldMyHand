package org.project.vo;

import lombok.Data;
import lombok.ToString;
import java.util.Date;

@Data
@ToString
public class CustomerVO {
    Integer userNo;
    String userID;
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
