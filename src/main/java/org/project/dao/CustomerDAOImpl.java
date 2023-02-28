package org.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.project.dto.CustomerModifyDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.dto.JoinDTO;
import org.project.dto.LoginDTO;
import org.project.vo.CustomerVO;
import org.project.vo.PagingVO;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CustomerDAOImpl implements CustomerDAO{

    @Inject
    private SqlSession session;

    private static String namespace = "org.project.dao.CustomerDAO";

    //모든 회원 리스트로 불러오기
    @Override
    public List<CustomerVO> listCustomer() {
        return null;
    }

    @Override
    public CustomerVO login(LoginDTO dto) throws Exception {
        return session.selectOne(namespace+".login",dto);
    }

    @Override
    public void keepLogin(Map<String,Object> map) {
        System.out.println("dao에서 keeplogin 내용 수행해서 mapper로 보낼준비.");
        System.out.println("세션아이디 : "+map.get("sessionId"));
        session.update(namespace+".keepLogin",map);
    }

    @Override
    public CustomerVO checkUserWithSessionKey(String value) {
        return session.selectOne(namespace+".checkUserWithSessionKey",value);
    }

    @Override
    public String findUserId(HttpServletResponse response, String userEmail){
        return session.selectOne(namespace+".findUserId", userEmail);
    }
    //로그인
//회원가입
//    @Override
//    public void create(CustomerVO vo) throws Exception {
//
//    }

    //회원번호로 회원정보 불러오기
    @Override
    public CustomerVO read(Integer userNo){
        return session.selectOne(namespace + ".read",userNo);
    }

//    //회원정보수정
    @Override
    public void update(CustomerModifyDTO dto) throws Exception {
        session.update(namespace + ".update",dto);
    }
//    //회원탈퇴
    @Override
    public void delete(Integer userNo) throws Exception {
        session.delete(namespace + ".delete",userNo);
    }

    @Override
    public void modUserStatus(Integer userNo) throws Exception {
        session.update(namespace+".modUserStatus",userNo);
    }

    @Override
    public void create(JoinDTO dto) throws Exception {
        System.out.println(dto.toString());
        session.insert(namespace + ".create", dto);
    }

    @Override
    public int countCustomer() throws Exception {
        return session.selectOne(namespace+".countCustomer");
    }

    @Override
    public List<CustomerVO> selectCustomer(PagingVO vo) throws Exception {
        return session.selectList(namespace+".selectCustomer",vo);
    }
}
