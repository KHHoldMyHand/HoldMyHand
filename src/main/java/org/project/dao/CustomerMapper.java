package org.project.dao;

import org.project.vo.CustomerVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerMapper {
    public List<CustomerVO> listCustomer();
}
