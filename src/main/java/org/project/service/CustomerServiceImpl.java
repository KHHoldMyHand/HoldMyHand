package org.project.service;

import org.project.dao.CustomerDAO;
import org.project.dto.CustomerModifyDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.dto.JoinDTO;
import org.project.dto.LoginDTO;
import org.project.vo.CustomerVO;
import org.project.vo.PagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Inject
    private CustomerDAO dao;

    @Override
    public CustomerVO login(LoginDTO dto) throws Exception {
        return dao.login(dto);
    }

    @Override
    public void keepLogin(Map<String,Object> map) throws Exception {
        System.out.println("service에서 dao의 keepLogin수행.");
        dao.keepLogin(map);
//        try{dao.keepLogin(userID,sessionId,next);}
//        catch (Exception e){
//            System.out.println("service - dao에러..");
//        }
    }

    @Override
    public String findUserId(HttpServletResponse response, String userEmail) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String userid = dao.findUserId(response, userEmail);

        if (userid == null) {
            out.println("<script>");
            out.println("alert('가입된 아이디가 없습니다.')");
            out.println("history.go(-1);");
            out.println("</script>");
            out.close();
            return null;
        } else {
            return userid;
        }
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

    @Override
    public void modUserStatus(Integer userNo) throws Exception {
        dao.modUserStatus(userNo);
    }

    @Transactional
    @Override
    public CustomerVO regist(JoinDTO dto) throws Exception {
        dao.create(dto);
        return null;
    }

    @Override
    public int countCustomer() throws Exception {
        return dao.countCustomer();
    }

    @Override
    public List<CustomerVO> selectCustomer(PagingVO vo) throws Exception {
        return dao.selectCustomer(vo);
    }

    @Override
    public int idCheck(String userID) throws Exception {
        int result = dao.idCheck(userID);
        System.out.println("result = dao.idCheck(userID)?: " + result);
        return result;
    }

}
