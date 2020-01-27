package com.mega.ITMS.report.tradeRecord;

import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TradeRecordDao {
    List<TradeRecordDto> importList();
    List<TradeRecordDto> exportList();
}
