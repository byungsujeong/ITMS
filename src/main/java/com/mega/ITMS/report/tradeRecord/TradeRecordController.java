package com.mega.ITMS.report.tradeRecord;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("report/tradeRecord/")
public class TradeRecordController {
    @Autowired
    TradeRecordDao tradeRecordDao;
    @RequestMapping(value = "/tradeRecord.do", method = RequestMethod.GET)
    public ModelAndView record(ModelAndView mav) {
        List<TradeRecordDto>  importList=tradeRecordDao.importList();
        List<TradeRecordDto>  exportList=tradeRecordDao.exportList();
        mav.setViewName("report/tradeRecord/tradeRecord");
        mav.addObject("importList", importList);
        mav.addObject("exportList", exportList);
        return mav;
    }
}