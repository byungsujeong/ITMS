package com.mega.ITMS;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mega.ITMS.userMng.corporate.UserMngCorpDAOImpl;
import com.mega.ITMS.userMng.corporate.UserMngCorpDTO;
import com.mega.ITMS.userMng.usermanage.UserMngEmployeeDAOImpl;
import com.mega.ITMS.userMng.usermanage.UserMngEmployeeDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	UserMngCorpDAOImpl userMngCorpDAOImpl;
	
	@Autowired
	UserMngEmployeeDAOImpl userMngEmployeeDAOImpl;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session) {
		if(session.getAttribute("com_id")==null) {
			return "login";
		}else {
			return "home";
		}
	}
	
	@ResponseBody
	@RequestMapping("loginCheck") // dto로 받으면 법인id는 int타입 직원id는 string타입이어서 오류 발생
	public int loginCheck(String id, String com_id, String pw, HttpSession session) {
		int result = 0;
		UserMngEmployeeDTO userMngEmployeeDTO = new UserMngEmployeeDTO();
		UserMngCorpDTO userMngCorpDTO = new UserMngCorpDTO();
		if(id=="") {
			userMngCorpDTO.setId(Integer.parseInt(com_id));
			userMngCorpDTO.setPw(pw);
			userMngCorpDTO = userMngCorpDAOImpl.loginCorporate(userMngCorpDTO);
			try {
				session.setAttribute("com_id", userMngCorpDTO.getId());
				result = 1;
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else {
			userMngEmployeeDTO.setId(id);
			userMngEmployeeDTO.setCom_id(Integer.parseInt(com_id));
			userMngEmployeeDTO.setPw(pw);
			userMngEmployeeDTO = userMngEmployeeDAOImpl.loginUser(userMngEmployeeDTO);
			try {
				session.setAttribute("com_id", userMngEmployeeDTO.getCom_id());		
				session.setAttribute("id", userMngEmployeeDTO.getId());	
				result = 1;
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return result;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
//	@Autowired
//	MonthlyDao monthlyDao;
//
//	@RequestMapping(value = "/pdf", method = RequestMethod.GET)
//	public String pdf(Model model) throws Exception {
//		List<SumMonthlyDto> list=monthlyDao.list();
//
//		//뷰에게 전달할 데이터 저장
//		model.addAttribute("list", list);
//
//		//출력할 뷰 이름 리턴
//		return "pdf";
//	}
}
