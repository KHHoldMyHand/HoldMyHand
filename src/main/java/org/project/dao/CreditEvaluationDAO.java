package org.project.dao;

import org.apache.ibatis.annotations.Mapper;
import org.project.dto.CorporationDTO;
import org.project.dto.CreditEvaluationDTO;
import org.project.vo.CustomerVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CreditEvaluationDAO {
    public CreditEvaluationDTO creditevaluationdto();
}
