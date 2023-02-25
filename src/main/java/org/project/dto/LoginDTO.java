package org.project.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class LoginDTO {
    private String userID;
    private String userPwd;
    private boolean useCookie;
}
