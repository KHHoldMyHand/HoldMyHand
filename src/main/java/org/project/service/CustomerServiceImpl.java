package org.project.service;

import org.project.dao.CustomerDAO;
import org.project.dto.CustomerModifyDTO;
import org.project.dto.LoginDTO;
import org.project.vo.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Date;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Inject
    private CustomerDAO dao;

    @Override
    public CustomerVO login(LoginDTO dto) throws Exception {
        return dao.login(dto);
    }

    @Override
    public void keepLogin(String userID, String sessionId, Date next) throws Exception {
        System.out.println("service에서 dao의 keepLogin수행.");
        dao.keepLogin(userID,sessionId,next);
//        try{dao.keepLogin(userID,sessionId,next);}
//        catch (Exception e){
//            System.out.println("service - dao에러..");
//        }
    }


    @Override
    public CustomerVO checkLoginBefore(String value) {
        return dao.checkUserWithSessionKey(value);
    }

    //회원번호로 그놈 회원정보 가져오기
    @Override
    public CustomerVO read(Integer userNo) {
        return dao.read(userNo);
    }

    //    //회원정보수정
    @Override
    public void modify(CustomerModifyDTO dto) throws Exception {
        dao.update(dto);
    }
//
//
//    //회원탈퇴
    @Override
    public void remove(Integer userNo) throws Exception {
        dao.delete(userNo);
    }

}
