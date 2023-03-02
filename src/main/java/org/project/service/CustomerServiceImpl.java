package org.project.service;

import org.apache.commons.mail.HtmlEmail;
import org.project.dao.CustomerDAO;
import org.project.dto.CustomerModifyDTO;
import org.project.dto.JoinDTO;
import org.project.dto.LoginDTO;
import org.project.vo.CustomerVO;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
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
    public CustomerVO readCustomer(String userID) {
        CustomerVO vo = null;
        try {
            vo = dao.readCustomer(userID);
            System.out.println("S : readMember()실행");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vo;
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
    public CustomerVO checkId(HttpServletResponse response, String userID) throws Exception{
        return dao.checkId(userID);
    }

    @Override
    public void sendmail(CustomerVO vo, String div) throws Exception {
        // Mail Server 설정
        String charSet = "utf-8";
        String hostSMTP = "smtp.naver.com";
        String hostSMTPid = "kyb1002@naver.com";
        String hostSMTPpwd = "zv1271vpkyb";

        // 보내는 사람 EMail, 제목, 내용
        String fromEmail = "kyb1002@naver.com";
        String fromName = "credit java";
        String subject = "";
        String msg = "";

        if(div.equals("findUserPwd"))
            subject = "credit java 임시 비밀번호 입니다.";
            msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
            msg += "<h3 style='color: blue;'>";
            msg += vo.getUserID() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
            msg += "<p>임시 비밀번호 : ";
            msg += vo.getUserPwd() + "</p></div>";

        // 받는 사람 E-Mail 주소
        String mail = vo.getUserEmail();
        try {
            HtmlEmail email = new HtmlEmail();
            email.setDebug(true);
            email.setCharset(charSet);
            email.setSSL(true);
            email.setHostName(hostSMTP);
            email.setSmtpPort(465);

            email.setAuthentication(hostSMTPid, hostSMTPpwd);
            email.setTLS(true);
            email.addTo(mail, charSet);
            email.setFrom(fromEmail, fromName, charSet);
            email.setSubject(subject);
            email.setHtmlMsg(msg);
            email.send();
        } catch (Exception e) {
            System.out.println("메일발송 실패 : " + e);
        }
    }

    @Override
    public void findUserPwd(HttpServletResponse response, CustomerVO vo) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        CustomerVO ck = dao.readCustomer(vo.getUserID());
        PrintWriter out = response.getWriter();
        // 아이디가 없으면
        if(dao.checkId(vo.getUserID()) == null) {
            out.print("아이디가 없습니다.");
            out.close();
        }
        // 가입에 사용한 이메일이 아니면
        else if(!vo.getUserEmail().equals(ck.getUserEmail()))
        {
            out.print("잘못된 이메일 입니다.");
            out.close();
        }else  {
            // 임시 비밀번호 생성
            String pw = "";
            for (int i = 0; i < 12; i++) {
                pw += (char) ((Math.random() * 26) + 97);
            }
            vo.setUserPwd(pw);
            // 비밀번호 변경
            dao.updatePwd(vo);
            // 비밀번호 변경 메일 발송

            sendmail(vo,"findUserPwd");

            out.print("이메일로 임시 비밀번호를 발송하였습니다.");
            out.close();
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

}
