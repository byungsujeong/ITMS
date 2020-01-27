package com.mega.ITMS.report.monthly;

import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface MonthlyDao {
    List<MonthlyDto> list() throws Exception;
}
