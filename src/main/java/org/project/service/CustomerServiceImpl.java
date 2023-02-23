package org.project.service;

import org.project.dao.CustomerDAO;
import org.project.dto.CustomerModifyDTO;
import org.project.vo.CustomerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Inject
    private CustomerDAO dao;

    //회원가입
//    @Override
//    public void regist(CustomerVO vo) throws Exception {
//
//    }


    //회원번호로 그놈 회원정보 가져오기
    @Override
    public CustomerVO read(Integer userNo) {
        return dao.read(userNo);
    }

    //    //회원정보수정
    @Override
    public void modify(CustomerModifyDTO dto) throws Exception {
        dao.update(dto);
//    }
//
//
//    //회원탈퇴
//    @Override
//    public void remove(Integer userNo) throws Exception {
//
//    }
    }
}
