package com.mega.ITMS.report.monthly;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class MonthlyDaoImpl implements MonthlyDao {
    @Autowired
    SqlSessionTemplate mybatis;
    @Override
    public List<MonthlyDto> list() {
        return mybatis.selectList("monthly.list_finance_transfer");
    }

}
