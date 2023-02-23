package org.project.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CustomerModifyDTO {
    Integer userNo;
    String userPwd;
    String userEmail;
//    String userAddress;
    String phoneNo;
}
