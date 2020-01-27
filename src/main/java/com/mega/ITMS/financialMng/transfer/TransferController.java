package com.mega.ITMS.financialMng.transfer;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mega.ITMS.financialMng.request.RequestDAO;
import com.mega.ITMS.financialMng.request.RequestDTO;

@Controller
@RequestMapping("/financialMng/transfer")
public class TransferController {

	@Autowired
	TransferDAO dao;
	
	@RequestMapping("/page3.do")
	private ModelAndView transfer(ModelAndView mav, HttpSession session){
		List<TransferDTO> list = dao.selectAll();
		
		session.setAttribute("com_id", 2138615419);
		
		List<RequestDTO> request_list = dao.selectRequest((Integer)session.getAttribute("com_id"));
		System.out.println(">>>request_list:" + request_list);
		mav.setViewName("financial/transfer/transfer_manage");
		mav.addObject("list", list);
		mav.addObject("request_list", request_list);
		return mav;
		
	}
	
	@RequestMapping("transfer_update")
	private ModelAndView transfer_update(ModelAndView mav, int id){
		TransferDTO dto = dao.selectfid(id);
		mav.setViewName("financial/transfer/transfer_update");
		mav.addObject("dto", dto);
		return mav;
		
	}
	
	@ResponseBody
	@RequestMapping("transfer_update_btn")
	private void transfer_update_btn(TransferDTO transferDTO) throws Exception{
		dao.update(transferDTO);

	}
	
	@ResponseBody
	@RequestMapping("/insertAll")
	private void insertAll(TransferDTO transferDTO){
		dao.insertAll(transferDTO);
	}
	
	@ResponseBody
	@RequestMapping("transfer_delete")
	private void transfer_delete(int id) {
		dao.delete(id);
	}
}
