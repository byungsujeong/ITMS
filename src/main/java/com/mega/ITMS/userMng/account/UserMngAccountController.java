package com.mega.ITMS.userMng.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@RequestMapping("user/account")
@Controller
public class UserMngAccountController {

	@Autowired
	UserMngAccountDAOImpl userMngAccountDAOImpl;
	
	@RequestMapping("register_account")
	public void register_account() {
	}
	
	@RequestMapping("addAccount")
	public String addAccount(UserMngAccountDTO userMngAccountDTO) {
		userMngAccountDAOImpl.addAccount(userMngAccountDTO);
		return "redirect:accountInfo?curPage=1&key=&value=";
	}
	
	@RequestMapping("accountInfo")
	public void accountInfo(UserMngAccountDTO userMngAccountDTO, HttpSession session, Model model, int curPage, String value, String key) {
		List<UserMngAccountDTO> list = null;
		userMngAccountDTO.setCom_id((Integer) session.getAttribute("com_id"));
		try {
			if ("name".equals(key)) {
				userMngAccountDTO.setName(value);
				list = userMngAccountDAOImpl.getAccountAsName(userMngAccountDTO);
			} else if ("bank".equals(key)) {
				userMngAccountDTO.setBank(value);
				list = userMngAccountDAOImpl.getAccountAsBank(userMngAccountDTO);
			} else if ("acc".equals(key)) {
				userMngAccountDTO.setAcc(value);
				list = userMngAccountDAOImpl.getAccountAsAcc(userMngAccountDTO);
			} else {
				list = userMngAccountDAOImpl.getAccount(userMngAccountDTO);
			}
		} catch (Exception e) {
			list = userMngAccountDAOImpl.getAccount(userMngAccountDTO);
		}
		
		
		// 한페이지에 보여줄 데이터 크기
		int pageCount = 7;
		double listSize = list.size();
		int pageLen = (int) ((listSize-1)/pageCount+1);
		int lastList = list.size()-1;
		List<UserMngAccountDTO> subList = null;
		// 데이터 순번(페이지가 넘어가도 순번 이어가도록)
		int[] seq = new int[7];
		for (int i = 0; i < seq.length; i++) {
			seq[i] = (curPage-1)*pageCount+(1+i);
		}
		if(lastList>=curPage*pageCount) {
			subList = list.subList((curPage-1)*pageCount, curPage*pageCount);
		}else {
			subList = list.subList((curPage-1)*pageCount, lastList+1);
		}
		model.addAttribute("key",key);
		model.addAttribute("value",value);
		model.addAttribute("seq", seq);
		model.addAttribute("curPage", curPage);
		model.addAttribute("pageLen", pageLen);
		model.addAttribute("list", subList);
	}
	
	@RequestMapping("editAccount")
	public String editAccount(UserMngAccountDTO2 userMngAccountDTO2, HttpSession session) {
		List<UserMngAccountDTO> list = null;
		String[] id = userMngAccountDTO2.getId().split(",");
		String[] name = userMngAccountDTO2.getName().split(",");
		for (int i = 0; i < id.length; i++) {
			UserMngAccountDTO userMngAccountDTO = new UserMngAccountDTO();
			userMngAccountDTO.setCom_id((Integer) session.getAttribute("com_id"));
			userMngAccountDTO.setId(Integer.parseInt(id[i]));
			userMngAccountDTO.setName(name[i]);
			userMngAccountDAOImpl.editAccount(userMngAccountDTO);
		}
		return "redirect:accountInfo?curPage=1&key=&value=";
	}
	
	@ResponseBody
	@RequestMapping("delAccount")
	public int delAccount(HttpServletRequest request, HttpSession session) {
		int result = 0;
		String[] id = request.getParameterValues("id[]");
		UserMngAccountDTO userMngAccountDTO = new UserMngAccountDTO();
		for (int i = 0; i < id.length; i++) {
			userMngAccountDTO.setCom_id((Integer) session.getAttribute("com_id"));
			userMngAccountDTO.setId(Integer.parseInt(id[i]));
			userMngAccountDAOImpl.delAccount(userMngAccountDTO);
			result = 1;
		}
		return result;
	}
	
}
