package com.mega.ITMS.userMng.usermanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mega.ITMS.Excel;
import com.mega.ITMS.userMng.division.UserMngDeptDTO;

@RequestMapping("user/usermanage")
@Controller
public class UserMngEmployeeController {

	@Autowired
	UserMngEmployeeDAOImpl userMngEmployeeDAOImpl;
	
	@RequestMapping("register_employee")
	public void register_employee(HttpSession session, Model model) {
		List<UserMngDeptDTO> list =  userMngEmployeeDAOImpl.getDepartment(session.getAttribute("com_id"));
		model.addAttribute("list",list);
	}
	
	@ResponseBody
	@RequestMapping("addUser")
	public String addUser(String csv, UserMngEmployeeDTO userMngEmployeeDTO) {
		String[] line = csv.split("\n");
		for(int i=0; i<line.length; i++) {
			String[] comma = line[i].split(",");
			userMngEmployeeDTO = new UserMngEmployeeDTO();
			userMngEmployeeDTO.setId(comma[0]);
			userMngEmployeeDTO.setCom_id(Integer.parseInt(comma[1]));
			userMngEmployeeDTO.setPw(comma[2]);
			userMngEmployeeDTO.setDept_id(comma[3]);
			userMngEmployeeDTO.setName(comma[4]);
			userMngEmployeeDTO.setTel(comma[5]);
			userMngEmployeeDTO.setEmail(comma[6]);
			try {
				userMngEmployeeDAOImpl.addUser(userMngEmployeeDTO);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return "Success";
		
//		CSV c1 = new CSV();
//		c1.writeCSV(csv);
//		ArrayList<UserMngEmployeeDTO> list = new ArrayList();
//		list = c1.readCSV(null);
//		for(int i=0; i<list.size(); i++){
//			try {
//				userMngEmployeeDAOImpl.addUser(list.get(i));				
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
		
	}
	
	@RequestMapping("authority")
	public void authority(UserMngEmployeeDTO userMngEmployeeDTO, HttpSession session, Model model, int curPage, String value, String key) {
		List<UserMngEmployeeDTO> list=null;
		List<UserMngDeptDTO> deptList = userMngEmployeeDAOImpl.getDepartment(session.getAttribute("com_id"));
		userMngEmployeeDTO.setCom_id((Integer) session.getAttribute("com_id"));
		UserMngDeptDTO userMngDeptDTO = new UserMngDeptDTO();
		try {
			switch (key) {
			case "name":
				userMngEmployeeDTO.setName(value);
				list = userMngEmployeeDAOImpl.getUserAsName(userMngEmployeeDTO);
				break;
			case "id":
				userMngEmployeeDTO.setId(value);
				list = userMngEmployeeDAOImpl.getUserAsId(userMngEmployeeDTO);
				break;
			case "dept_id":
				userMngEmployeeDTO.setDept_id(value);
				list = userMngEmployeeDAOImpl.getUserAsDept_id(userMngEmployeeDTO);
				break;
			case "dept_name":
				userMngDeptDTO.setCom_id((Integer) session.getAttribute("com_id"));
				userMngDeptDTO.setName(value);
				list = userMngEmployeeDAOImpl.getUserAsDept_name(userMngDeptDTO);
				break;
			default:
				list = userMngEmployeeDAOImpl.getUserAll(userMngEmployeeDTO);
			}
		} catch (Exception e) {
			list = userMngEmployeeDAOImpl.getUserAll(userMngEmployeeDTO);
		}
		
		// 한페이지에 보여줄 데이터 크기
		int pageCount = 7;
		double listSize = list.size();
		int pageLen = (int) ((listSize-1)/pageCount+1);
		int lastList = list.size()-1;
		List<UserMngEmployeeDTO> subList = null;
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
		model.addAttribute("deptList",deptList);
		model.addAttribute("list", subList);
	}
	
	@RequestMapping("editUser")
	public String editUser(UserMngEmployeeDTO2 userMngEmployeeDTO2, HttpSession session) {
		List<UserMngEmployeeDTO> list = null;
		String[] id = userMngEmployeeDTO2.getId().split(",");
		String[] name = userMngEmployeeDTO2.getName().split(",");
		String[] dept_id = userMngEmployeeDTO2.getDept_id().split(",");
		String[] tel = userMngEmployeeDTO2.getTel().split(",");
		String[] email = userMngEmployeeDTO2.getEmail().split(",");
		String[] pmenu = userMngEmployeeDTO2.getPmenu().split(",");
		String[] imenu = userMngEmployeeDTO2.getImenu().split(",");
		String[] emenu = userMngEmployeeDTO2.getEmenu().split(",");
		String[] fmenu = userMngEmployeeDTO2.getFmenu().split(",");
		String[] rmenu = userMngEmployeeDTO2.getRmenu().split(",");
		for (int i = 0; i < id.length; i++) {
			UserMngEmployeeDTO userMngEmployeeDTO = new UserMngEmployeeDTO();
			userMngEmployeeDTO.setCom_id((Integer) session.getAttribute("com_id"));
			userMngEmployeeDTO.setId(id[i]);
			userMngEmployeeDTO.setName(name[i]);
			userMngEmployeeDTO.setDept_id(dept_id[i]);
			userMngEmployeeDTO.setTel(tel[i]);
			userMngEmployeeDTO.setEmail(email[i]);
			userMngEmployeeDTO.setPmenu(Integer.parseInt(pmenu[i]));
			userMngEmployeeDTO.setImenu(Integer.parseInt(imenu[i]));
			userMngEmployeeDTO.setEmenu(Integer.parseInt(emenu[i]));
			userMngEmployeeDTO.setFmenu(Integer.parseInt(fmenu[i]));
			userMngEmployeeDTO.setRmenu(Integer.parseInt(rmenu[i]));
			userMngEmployeeDAOImpl.editUser(userMngEmployeeDTO);
		}
		return "redirect:authority?curPage=1&key=&value=";
	}
	
	@ResponseBody
	@RequestMapping("delUser")
	public int delUser(HttpServletRequest request, HttpSession session) {
		int result = 0;
		String[] id = request.getParameterValues("id[]");
		UserMngEmployeeDTO userMngEmployeeDTO = new UserMngEmployeeDTO();
		for (int i = 0; i < id.length; i++) {
			userMngEmployeeDTO.setCom_id((Integer) session.getAttribute("com_id"));
			userMngEmployeeDTO.setId(id[i]);
			userMngEmployeeDAOImpl.delUser(userMngEmployeeDTO);
		}
		result = 1;
		return result;
	}
	
	@RequestMapping("userInfo")
	public void infoUser(Model model, HttpSession session) {
		UserMngEmployeeDTO userMngEmployeeDTO = new UserMngEmployeeDTO();
		List<UserMngDeptDTO> deptList = userMngEmployeeDAOImpl.getDepartment(session.getAttribute("com_id"));
		userMngEmployeeDTO.setCom_id((Integer) session.getAttribute("com_id"));
		userMngEmployeeDTO.setId((String) session.getAttribute("id"));
		userMngEmployeeDTO = userMngEmployeeDAOImpl.getUser(userMngEmployeeDTO);
		
		List<UserMngEmployeeDTO> list = userMngEmployeeDAOImpl.delegation(userMngEmployeeDTO);
		
		model.addAttribute("userMngEmployeeDTO",userMngEmployeeDTO);
		model.addAttribute("deptList",deptList);
		model.addAttribute("list",list);
	}
	
	@RequestMapping("pwCheck")
	public @ResponseBody String pwCheck(UserMngEmployeeDTO userMngEmployeeDTO, Model model, HttpSession session) {
		userMngEmployeeDTO.setCom_id((Integer) session.getAttribute("com_id"));
		userMngEmployeeDTO.setId((String) session.getAttribute("id"));
		userMngEmployeeDTO = userMngEmployeeDAOImpl.loginUser(userMngEmployeeDTO);
		String result = "0";
		if(userMngEmployeeDTO!=null) {
			result = "1";
		}	
		return result;
	}
	
	@RequestMapping("editUserPw")
	public String editUserPw(UserMngEmployeeDTO userMngEmployeeDTO, HttpSession session) {
		userMngEmployeeDTO.setCom_id((Integer) session.getAttribute("com_id"));
		if(userMngEmployeeDTO.getDelegation()==null) {
			userMngEmployeeDTO.setDelegation((String) session.getAttribute("id"));
		}
		if(userMngEmployeeDTO.getPw()=="") {
			UserMngEmployeeDTO userMngEmployeeDTO2 = new UserMngEmployeeDTO();
			userMngEmployeeDTO2 = userMngEmployeeDAOImpl.getUser(userMngEmployeeDTO);
			userMngEmployeeDTO.setPw(userMngEmployeeDTO2.getPw());
		}
		userMngEmployeeDAOImpl.editUserPw(userMngEmployeeDTO);
		return "redirect:userInfo";
	}
	
	@ResponseBody
	@RequestMapping("delegation")
	public List<UserMngEmployeeDTO> delegation(UserMngEmployeeDTO userMngEmployeeDTO, HttpSession session) {
		userMngEmployeeDTO.setCom_id((Integer) session.getAttribute("com_id"));
		List<UserMngEmployeeDTO> list = userMngEmployeeDAOImpl.delegation(userMngEmployeeDTO);
		return list;
	}
	
	@RequestMapping("downExcel")
    public void listExcel(HttpServletRequest request,
            HttpServletResponse response, UserMngEmployeeDTO userMngEmployeeDTO,
            ModelMap modelMap, HttpSession session, String key, String value) throws Exception {

		List<UserMngDeptDTO> deptList = userMngEmployeeDAOImpl.getDepartment(session.getAttribute("com_id"));
		userMngEmployeeDTO.setCom_id((Integer) session.getAttribute("com_id"));
		UserMngDeptDTO userMngDeptDTO = new UserMngDeptDTO();
        // 그냥 평소에 마이바티스에서 데이터 뽑는 방법으로 데이터를 가져온다.
        List<UserMngEmployeeDTO> dataList = null;
        
        try {
			switch (key) {
			case "name":
				userMngEmployeeDTO.setName(value);
				dataList = userMngEmployeeDAOImpl.getUserAsName(userMngEmployeeDTO);
				break;
			case "id":
				userMngEmployeeDTO.setId(value);
				dataList = userMngEmployeeDAOImpl.getUserAsId(userMngEmployeeDTO);
				break;
			case "dept_id":
				userMngEmployeeDTO.setDept_id(value);
				dataList = userMngEmployeeDAOImpl.getUserAsDept_id(userMngEmployeeDTO);
				break;
			case "dept_name":
				userMngDeptDTO.setCom_id((Integer) session.getAttribute("com_id"));
				userMngDeptDTO.setName(value);
				dataList = userMngEmployeeDAOImpl.getUserAsDept_name(userMngDeptDTO);
				break;
			default:
				dataList = userMngEmployeeDAOImpl.getUserAll(userMngEmployeeDTO);
			}
		} catch (Exception e) {
			dataList = userMngEmployeeDAOImpl.getUserAll(userMngEmployeeDTO);
		}
        		
        // 받은 데이터를 맵에 담는다.
        Map<String, Object> beans = new HashMap<String, Object>();
        beans.put("dataList", dataList);
       /* Map<String, Object> beans2 = new HashMap<String, Object>();
        beans2.put("dataList2", deptList);*/
        
        // 엑셀 다운로드 메소드가 담겨 있는 객체
        Excel me = new Excel();

        me.download(request, response, beans, "data1", "data.xlsx","");
    }

}