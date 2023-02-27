package org.project.service;

import org.project.dto.CustomerModifyDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.dto.JoinDTO;
import org.project.dto.LoginDTO;
import org.project.vo.CustomerVO;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;


public interface CustomerService {
    public CustomerVO login(LoginDTO dto) throws Exception;
    public void keepLogin(Map<String,Object> map)throws Exception;
    public CustomerVO checkLoginBefore(String value);

    //회원가입
//    public void regist(CustomerVO vo) throws Exception;

    //회원번호 받아서 그 한명 회원정보 가져오기
    public CustomerVO read(Integer userNo);

//    //회원정보수정
    public void modify(CustomerModifyDTO dto) throws Exception;
//
//    //회원탈퇴
    public void remove(Integer userNo) throws Exception;

    public void modUserStatus(Integer userNo) throws Exception;

    //회원가입 ^.^
    public CustomerVO regist(JoinDTO dto) throws Exception;



}
