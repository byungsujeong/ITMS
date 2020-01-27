package com.mega.ITMS.report.tradeRecord;

import com.mega.ITMS.report.monthly.MonthlyDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class TradeRecordDaoImpl implements TradeRecordDao{
    @Autowired
    SqlSessionTemplate mybatis;
    @Override
    public List<TradeRecordDto> importList() {
        return mybatis.selectList("tradeRecord.import");
    }
    public List<TradeRecordDto> exportList() {
        return mybatis.selectList("tradeRecord.export");
    }

}
