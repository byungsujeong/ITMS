package com.mega.ITMS.report.monthly;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
@Controller
@RequestMapping("report/monthly/")
public class MonthlyController {
    @Autowired
    MonthlyDao monthlyDao;

    @RequestMapping(value = "/monthly.do" , method = RequestMethod.GET)
    public ModelAndView list(ModelAndView mav) throws Exception {
        List<MonthlyDto> list=monthlyDao.list();
        mav.setViewName("report/monthly/monthly");
        mav.addObject("list",list);
        return mav;
    }
}
