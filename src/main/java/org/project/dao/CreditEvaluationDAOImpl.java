package org.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.project.dto.CreditEvaluationDTO;
import org.project.dto.EvaluateSuccessDTO;
import org.project.vo.CustomerVO;

import javax.inject.Inject;
import java.util.List;

public class CreditEvaluationDAOImpl implements CreditEvaluationDAO {

    @Inject
    private SqlSession session;

    private static String namespace = "org.project.dao.CreditEvaluationDAO";
    @Override
    public CreditEvaluationDTO creditevaluationdto(Integer userNo) {
        return null;
    }

    @Override
    public void createReport(EvaluateSuccessDTO dto){
        session.insert(namespace+".createReport",dto);
    }

}
