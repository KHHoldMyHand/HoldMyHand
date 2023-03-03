package org.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.project.dto.CorporationBoardDTO;
import org.project.dto.CorporationDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.vo.CorporationVO;
import org.project.vo.CustomerVO;
import org.project.vo.FileVO;
import org.project.vo.PagingVO;

import javax.inject.Inject;
import java.util.List;

public class CorporationDAOImpl implements CorporationDAO{

    @Inject
    private SqlSession session;


    private static String namespace = "org.project.dao.CorporationDAO";

    @Override
    public int create(CorporationDTO dto) {
        return 0;
    }

    // 평가 진행 목록
    @Override
    public List<CorporationBoardDTO> listCorporation() {
        return null;
    }

    @Override
    public void modCS(EvaluateSuccessDTO dto) throws Exception{
        session.update(namespace+".modCS",dto);
    }

    // 신용정보 등록
    @Override
    public void submitCreditInfo(CorporationDTO dto) {
        session.insert(namespace + ".submitCreditInfo", dto);
    }

    // 파일 정보 가져오기
    @Override
    public FileVO getFileName(CorporationDTO dto) {
        return session.selectOne(namespace + ".getFileName", dto);
    }

    // 신용정보 등록 고객 목록 페이징처리
    @Override
    public int countCorporation() throws Exception {
        return session.selectOne(namespace+".countCustomer");
    }
    @Override
    public List<CustomerVO> selectSubmitCustomer(PagingVO vo) {
        return session.selectList(namespace+".selectCustomer",vo);
    }

    // 등록 정보 가져오기
    @Override
    public CorporationVO getCustomerInfo(Integer userno) {
        return session.selectOne(namespace+".getCustomerInfo", userno);
    }

}
