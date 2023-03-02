package org.project.service;

import org.project.dto.EvaluateSuccessDTO;
import org.springframework.stereotype.Service;

public interface CreditEvaluationService {

    public void createReport(EvaluateSuccessDTO dto);

}
