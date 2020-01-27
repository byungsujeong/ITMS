package com.mega.ITMS.userMng.division;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mega.ITMS.userMng.usermanage.UserMngEmployeeDTO;
import com.mega.ITMS.userMng.usermanage.UserMngEmployeeDTO2;

@RequestMapping("user/division")
@Controller
public class UserMngDeptController {

	@Autowired
	UserMngDeptDAOImpl userMngDeptDAOImpl;
	
	@RequestMapping("register_dept")
	public void register_dept() {
	}
	
	@RequestMapping("addDepartment")
	public String addDepartment(UserMngDeptDTO userMngDeptDTO) {
		userMngDeptDAOImpl.addDepartment(userMngDeptDTO);
		return "redirect:deptInfo?curPage=1&key=&value=";
	}
	
	@RequestMapping("deptInfo")
	public void deptInfo(UserMngDeptDTO userMngDeptDTO, HttpSession session, Model model, int curPage, String value, String key) {
		List<UserMngDeptDTO> list = null;
		userMngDeptDTO.setCom_id((Integer) session.getAttribute("com_id"));
		try {
			if ("name".equals(key)) {
				userMngDeptDTO.setName(value);
				list = userMngDeptDAOImpl.getDepartmentAsName(userMngDeptDTO);
			} else if ("id".equals(key)) {
				userMngDeptDTO.setId(value);
				list = userMngDeptDAOImpl.getDepartmentAsId(userMngDeptDTO);
			} else {
				list = userMngDeptDAOImpl.getDepartment(userMngDeptDTO);
			}
		} catch (Exception e) {
			list = userMngDeptDAOImpl.getDepartment(userMngDeptDTO);
		}
		
		
		// 한페이지에 보여줄 데이터 크기
		int pageCount = 7;
		double listSize = list.size();
		int pageLen = (int) ((listSize-1)/pageCount+1);
		int lastList = list.size()-1;
		List<UserMngDeptDTO> subList = null;
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
	
	@RequestMapping("editDepartment")
	public String editUser(UserMngDeptDTO userMngDeptDTO, HttpSession session) {
		List<UserMngDeptDTO> list = null;
		String[] id = userMngDeptDTO.getId().split(",");
		String[] name = userMngDeptDTO.getName().split(",");
		for (int i = 0; i < id.length; i++) {
			userMngDeptDTO = new UserMngDeptDTO();
			userMngDeptDTO.setCom_id((Integer) session.getAttribute("com_id"));
			userMngDeptDTO.setId(id[i]);
			userMngDeptDTO.setName(name[i]);
			userMngDeptDAOImpl.editDepartment(userMngDeptDTO);
		}
		return "redirect:deptInfo?curPage=1&key=&value=";
	}
	
	@ResponseBody
	@RequestMapping("delDepartment")
	public int delUser(HttpServletRequest request, HttpSession session) {
		int result = 0;
		String[] id = request.getParameterValues("id[]");
		UserMngDeptDTO userMngDeptDTO = new UserMngDeptDTO();
		for (int i = 0; i < id.length; i++) {
			userMngDeptDTO.setCom_id((Integer) session.getAttribute("com_id"));
			userMngDeptDTO.setId(id[i]);
			userMngDeptDAOImpl.delDepartment(userMngDeptDTO);
			result = 1;
		}
		return result;
	}
	
}
