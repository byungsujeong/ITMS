package com.mega.ITMS.report.myReport;

import com.mega.ITMS.report.monthly.MonthlyDto;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class MyReportDaoImpl implements MyReportDao{
    @Autowired
    SqlSessionTemplate mybatis;
    @Override
    public List<MyReportDto> list() {
        return mybatis.selectList("report.list_report");
    }

    @Override
    public void insertReport(MyReportDto dto) {
        mybatis.insert("report.insert",dto);
    }
    public MyReportDto myReportDetail(int id){

        return mybatis.selectOne("report.myReportDetail", id);
    }

    @Override
    public void myReportDel(int id) {
        mybatis.delete("report.myReportDel", id);
    }

    @Override
    public void updateMyReport(MyReportDto dto) {
        mybatis.update("report.update", dto);
    }
}
