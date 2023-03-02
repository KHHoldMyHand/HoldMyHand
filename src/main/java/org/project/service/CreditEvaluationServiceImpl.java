package org.project.service;

import org.project.dao.CreditEvaluationDAO;
import org.project.dto.EvaluateSuccessDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class CreditEvaluationServiceImpl implements CreditEvaluationService{

    @Inject
    CreditEvaluationDAO dao;

    @Override
    public void createReport(EvaluateSuccessDTO dto) {
        dao.createReport(dto);
    }
}
