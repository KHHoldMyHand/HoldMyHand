package org.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.project.dto.CorporationBoardDTO;
import org.project.dto.CorporationDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.vo.FileVO;

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

}
