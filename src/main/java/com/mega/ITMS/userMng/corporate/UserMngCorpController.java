package com.mega.ITMS.userMng.corporate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("user/corporate")
@Controller
public class UserMngCorpController {

	@Autowired
	UserMngCorpDAOImpl userMngCorpDAOImpl;
	
	@RequestMapping("register_corp")
	public void register_corp() {
		
	}
	
	@ResponseBody
	@RequestMapping("overlapCheck")
	public int overlapcheck(UserMngCorpDTO userMngCorpDTO) {
		int count = 0;
		userMngCorpDTO = userMngCorpDAOImpl.getCorporate(userMngCorpDTO.getId());
		if(userMngCorpDTO==null) {
			count=1;
		}
		return count;
	}
	
	@RequestMapping("addCorporate")
	public String addCorporate(UserMngCorpDTO userMngCorpDTO) {
		userMngCorpDAOImpl.addCorporate(userMngCorpDTO);
		return "redirect:../../";
	}
	
	@RequestMapping("corporateInfo")
	public void infoCorporate(Model model, HttpSession session) {
		UserMngCorpDTO userMngCorpDTO = new UserMngCorpDTO();
		userMngCorpDTO = userMngCorpDAOImpl.getCorporate(session.getAttribute("com_id"));
		model.addAttribute("userMngCorpDTO", userMngCorpDTO);
	}
	
	@RequestMapping("pwCheck")
	public @ResponseBody String pwCheck(UserMngCorpDTO userMngCorpDTO, Model model, HttpSession session) {
		userMngCorpDTO.setId((Integer) session.getAttribute("com_id"));
		userMngCorpDTO = userMngCorpDAOImpl.loginCorporate(userMngCorpDTO);
		String result = "0";
		if(userMngCorpDTO!=null) {
			result = "1";
		}	
		return result;
	}
	
	@RequestMapping("editCorporate")
	public String editCorporate(UserMngCorpDTO userMngCorpDTO) {
		if(userMngCorpDTO.getPw()=="") {
			UserMngCorpDTO userMngCorpDTO2 = new UserMngCorpDTO();
			userMngCorpDTO2 = userMngCorpDAOImpl.getCorporate(userMngCorpDTO.getId());
			userMngCorpDTO.setPw(userMngCorpDTO2.getPw());
		}
		userMngCorpDAOImpl.editCorporate(userMngCorpDTO);
		return "redirect:corporateInfo";
	}
	
	@RequestMapping("delCorporate")
	public String delCorporate(HttpSession session) {
		userMngCorpDAOImpl.delCorporate(session.getAttribute("com_id"));
		userMngCorpDAOImpl.delUser(session.getAttribute("com_id"));
		session.invalidate();
		return "redirect:../../";
	}
	
}
