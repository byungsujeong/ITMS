package com.mega.ITMS.financialMng.request;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mega.ITMS.financialMng.transfer.TransferDAO;
import com.mega.ITMS.financialMng.transfer.TransferDTO;

@RequestMapping("/financialMng/request")

@Controller
public class RequestController {

	@Autowired
	RequestDAO dao;
	
	@Autowired
	TransferDAO transferdao;
	
//	@RequestMapping("/page1.do")
//	private ModelAndView pay(ModelAndView mav){
//		List<RequestDTO> list = dao.selectAll();
//		List<TransferDTO> transfer_list = dao.transfer_selectAll();
//		mav.setViewName("financial/request/pay_request");
//		mav.addObject("list", list);
//		mav.addObject("transfer_list", transfer_list);
//		return mav;
//		
//	}
	
	@RequestMapping("/page1.do")
	private ModelAndView pay(ModelAndView mav){
		List<payDTO> list = dao.selectAll();
		List<TransferDTO> transfer_list = dao.transfer_selectAll();
		mav.setViewName("financial/request/pay_request");
		mav.addObject("list", list);
		mav.addObject("transfer_list", transfer_list);
		return mav;
		
	}

//	@RequestMapping("/page2.do")
//	private ModelAndView receive(ModelAndView mav){
//		mav.setViewName("financial/request/receive_request");
//		return mav;
//	}
	
	   @RequestMapping("/page2.do") // 지수
	   private ModelAndView receive(ModelAndView mav, HttpSession session) {
	      mav.setViewName("financial/request/receive_request");
	      int com_id = (Integer) session.getAttribute("com_id");
	      System.out.println("세션 확인용" + com_id);
	      List<IncomeDTO> list = dao.selectIncomeJoin(com_id);
	      List<TransferDTO> tlist = dao.transfer_selectAllJS(com_id);
	      System.out.println(">>>list" + list);
	      System.out.println(">>>tlist" + tlist);
	      ArrayList<IncomeDTO> incomeList = new ArrayList<IncomeDTO>();
	      ArrayList<IncomeDTO> incomeListRe = new ArrayList<IncomeDTO>();
	      ArrayList<IncomeDTO> incomeList2 = new ArrayList<IncomeDTO>();
	      ArrayList<Integer> test = new ArrayList<Integer>();
	      
	      if(tlist.size()!=0) {
	         for (int i = 0; i < tlist.size(); i++) {
	            if(tlist.get(i).getAction_type() == 1) {
	               test.add(tlist.get(i).getFinance_id());
	            } // if end
	         } //for end
	         for (int i = 0; i < test.size(); i++) {
	            for (int j = 0; j < list.size(); j++) {
	               if(test.get(i) != list.get(j).getFq_id()) {
	                  incomeList.add(list.get(j));
	               }// if end
	            }//for inner end
	         }//for end
	         
	         for (int i = 0; i < test.size(); i++) {
	            for (int j = 0; j < list.size(); j++) {
	               if(test.get(i) == list.get(j).getFq_id()) {
	                  incomeListRe.add(list.get(j));
	               }// if end
	            }//for inner end
	         }//for end

	         
	         for (int i = 0; i < incomeList.size(); i++) {
	            if(!incomeList2.contains(incomeList.get(i)))
	               incomeList2.add(incomeList.get(i));
	         }

	         
	         mav.addObject("blist", list);
	         mav.addObject("tlist", tlist);
	         mav.addObject("alist", incomeList2);
	         mav.addObject("rlist", incomeListRe);
	         System.out.println(">>>결제된것: "+incomeListRe);

	      }else {
	         for (int i = 0; i < list.size(); i++) {
	            incomeList.add(list.get(i));
	         }
	         mav.addObject("alist", incomeList);
	      }
	         
	         
	      return mav;
	   }
	
	@RequestMapping("pay_save")
	private ModelAndView save(ModelAndView mav){
		mav.setViewName("financial/request/pay_save");
		return mav;
	}
	
	@RequestMapping("pay_update")
	private ModelAndView update(ModelAndView mav, int id){
		payDTO dto = dao.selectrid(id);
		mav.setViewName("financial/request/pay_update");
		mav.addObject("dto", dto);
		return mav;
	}
	
	@RequestMapping("pay_update2")
	private ModelAndView update2(ModelAndView mav){
		mav.setViewName("financial/request/pay_update2");
		return mav;
	}
	
	@RequestMapping("pay_account_detail")
	private ModelAndView detail(ModelAndView mav){
		mav.setViewName("financial/request/pay_account_detail");
		return mav;
	}
	
	@RequestMapping("receive_save")
	private ModelAndView receive_save(ModelAndView mav){
		mav.setViewName("financial/request/receive_save");
		return mav;
	}
	
	@RequestMapping("receive_sender_detail")
	private ModelAndView receive_detail(ModelAndView mav){
		mav.setViewName("financial/request/receive_sender_detail");
		return mav;
	}
	@RequestMapping("receive_update")
	private ModelAndView receive_update(ModelAndView mav){
		mav.setViewName("financial/request/receive_update");
		return mav;
	}
	@RequestMapping("receive_update2")
	private ModelAndView receive_update2(ModelAndView mav){
		mav.setViewName("financial/request/receive_update2");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("pay_check")
	public List<payDTO> pay_check(RequestDTO requestDTO, HttpSession session){
		session.setAttribute("id", "temporaryID");
		requestDTO.setResponse_id((String)session.getAttribute("id"));
		System.out.println((String)session.getAttribute("id"));
		dao.update(requestDTO);
		List<payDTO> list = dao.selectAll();
		System.out.println(list.get(0).getReceive_date() + "----------------");
		return list;
	}
	
	@ResponseBody
	@RequestMapping("payend")
	public TransferDTO payend(TransferDTO transferDTO){
		transferdao.insert(transferDTO);
		transferDTO = transferdao.selectpayend(transferDTO);
		return transferDTO;
	}
	
	@ResponseBody
	@RequestMapping("request_update_btn")
	private void request_update_btn(RequestDTO requestDTO) throws Exception{
		dao.pay_update(requestDTO);

	}
	
	@ResponseBody
	@RequestMapping("request_delete")
	private void request_delete(int id) {
		dao.delete(id);
	}
} 			
