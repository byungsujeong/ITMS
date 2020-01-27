package com.mega.ITMS.report.myReport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("report/myReport/")
public class MyReportController {
    @Autowired
    MyReportDao myReportDao;

    @RequestMapping(value = "myReportList.do", method = RequestMethod.GET)
    public ModelAndView myReportList(ModelAndView mav) throws Exception {
        List<MyReportDto> list = myReportDao.list();
        mav.addObject("list", list);
        mav.setViewName("report/myReport/myReportList");
        return mav;
    }

    @RequestMapping(value = "myReportNew.do", method = RequestMethod.GET)
    public ModelAndView myReportNew(ModelAndView mav) {
        mav.setViewName("report/myReport/myReportNew");
        return mav;
    }

    @RequestMapping(value = "submitMyReport.do")
    public String insert(@ModelAttribute MyReportDto dto) throws Exception {
        myReportDao.insertReport(dto);
        return "redirect:myReportList.do";
    }

    @RequestMapping(value = "detail/{id}")
    public ModelAndView myReportDetail(@PathVariable("id") int id, ModelAndView mav){
        mav.setViewName("report/myReport/myReportDetail");
        mav.addObject("dto", myReportDao.myReportDetail(id));
        return mav;
    }

    @RequestMapping(value = "edit/{id}")
    public ModelAndView myReportEdit(@PathVariable("id") int id, ModelAndView mav){
        mav.setViewName("report/myReport/myReportEdit");
        mav.addObject("dto", myReportDao.myReportDetail(id));
        return mav;
    }

    @RequestMapping(value = "del/{id}")
    public String myReportDel(@PathVariable int id) {
        myReportDao.myReportDel(id);
        return "redirect:../myReportList.do";
    }

    @RequestMapping(value = "update/{id}", method = RequestMethod.POST)
    public String updateMyReport(@ModelAttribute MyReportDto dto) {
        myReportDao.updateMyReport(dto);
        return "redirect:../myReportList.do";
    }
}
