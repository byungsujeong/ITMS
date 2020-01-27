package com.mega.ITMS.operationMng.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mega.ITMS.Excel;

import net.sf.jxls.exception.ParsePropertyException;


@RequestMapping("operation/customer") // 현재 Controller에서의 default 주소

@Controller
class OperationMngCustomerController {

	@Autowired
	OperationMngCustomerDAOImpl omCsDAO;
	
	
/////////// 거래처 관리 페이지(거래처 관리 탭 클릭시 보이는 페이지)(selectAll 기능) //////////
	
	@RequestMapping("customerRead")
	public void customerPage(Model model, HttpSession session) {
		// select결과를 customerRead.jsp로 보내주기 위한 Model,
		// select시 where 조건을 위해 필요한 HttpSession
		
		System.out.println("거래처 관리 페이지");
		List<OperationMngCustomerJoinDTO> list = omCsDAO.getCustomerBusinessReadAll(session.getAttribute("com_id"));
		// DAO의 메서드 입력값으로 session값을 넣어줘서 Mapper에서 where조건으로 사용
		
		model.addAttribute("list", list);
	}
	
	
////////// 거래처 관리 목록 검색(selectAll 기능) //////////
	
	@ResponseBody
	// ajax 사용시 result jsp파일을 따로 생성하지 않고 result값에 해당하는 데이터를 ResponseBody에 담아서 바로 전송
	// pom.xml의 dependency에 jackson-databind 라이브러리를 추가하고 Response 어노테이션을 사용하면
	// Model 객체 없이도 return 값으로 검색결과를 담아준 변수로 데이터 전송 가능	
	
	@RequestMapping("searchBnCs") // result 출력 파일을 생성하지 않기 때문에 ajax url의 요청 주소와 동일하게만 해주면 됨
	public List<OperationMngCustomerJoinDTO> searchBnCs(OperationMngCustomerJoinDTO omCsJoinDTO, HttpSession session, int dropdown, String search) {
		// select시 where 조건을 위해 필요한 HttpSession,
		// session을 담아줄 DTO(session을 DTO에 담아 DAO의 입력값으로 넣어 Mapper의 where조건으로 사용),
		// customerRead.jsp에서 넘겨받은 dropdown에서 선택된 값 + search의 검색어 값
		
		omCsJoinDTO.setA_com_id((Integer) session.getAttribute("com_id"));
		// DTO에 session값 com_id 담아주기(Object session이라 형변환). DTO에 담아주어야 Mapper에서 where 조건으로 사용 가능
		System.out.println("거래처 관리 검색 페이지");
		
		List<OperationMngCustomerJoinDTO> list = null; // if문 밖에서 객체 생성을 해줘야 return list가 밖에서 가능
		
		if (dropdown == 0) { // 담당자명 일 때
			omCsJoinDTO.setA_name(search); // 검색어 값을 DTO에 담아 Mapper에서 where 조건으로 사용
			list = omCsDAO.getCustomerBusinessReadAllSearchZero(omCsJoinDTO);
		} else { // 거래처명 일 때
			omCsJoinDTO.setB_name(search); // 검색어 값을 DTO에 담아 Mapper에서 where 조건으로 사용
			list = omCsDAO.getCustomerBusinessReadAllSearchOne(omCsJoinDTO);
		}
		return list;
	}
	

////////// 거래처 등록 페이지(거래처 등록 버튼 클릭시 보이는 페이지) //////////
	
	@RequestMapping("customerAdd1")
	public void customerAdd1Page() {
		System.out.println("거래처 정보 등록 페이지");
	}
	
	
/////////// 담당자 등록 페이지(담당자 등록 버튼 클릭시 보이는 페이지) //////////
	
	@RequestMapping("customerAdd2")
	public void customerAdd2Page() {
		System.out.println("담당자 정보 등록 페이지");
	}
	
	
////////// 거래처 수정/삭제 페이지(거래처 수정/삭제 버튼 클릭시 보이는 페이지)(selectOne 기능) //////////
	
	@RequestMapping("customerEditDel1")
	public void customerEditDel1Page(OperationMngBusinessDTO omBnDTO, Model model, HttpSession session) {
		// customerRead.jsp에서 넘겨 받은 id를 받기 위한 DTO,
		// select결과를 customerEditDel1.jsp로 보내주기 위한 Model,
		// select시 where 조건을 위해 필요한 HttpSession
		
		omBnDTO.setCom_id((Integer) session.getAttribute("com_id"));
		// DTO에 session값 com_id 담아주기(Object session이라 형변환). DTO에 담아주어야 Mapper에서 where 조건으로 사용 가능
		
		System.out.println("거래처 정보 수정/삭제 페이지");
		omBnDTO = omCsDAO.getBusinessRead(omBnDTO); // customerRead.jsp에서 받아온 id값을 DTO에 담아주었기 때문에 새로 객체 생성하면 안됨
		model.addAttribute("omBnDTO", omBnDTO); // ("select결과 페이지에서 써줄 이름", 넘겨줄 데이터)
	}
	

////////// 담당자 수정/삭제 페이지(담당자 수정/삭제 버튼 클릭시 보이는 페이지)(selectOne 기능) //////////
	
	@RequestMapping("customerEditDel2")
	public void customerEditDel2Page(OperationMngCustomerDTO omCsDTO, Model model, HttpSession session) {
		// customerRead.jsp에서 넘겨 받은 id를 받기 위한 DTO,
		// select결과를 customerEditDel1.jsp로 보내주기 위한 Model,
		// select시 where 조건을 위해 필요한 HttpSession
		
		omCsDTO.setCom_id((Integer) session.getAttribute("com_id"));
		// DTO에 session값 com_id 담아주기(Object session이라 형변환). DTO에 담아주어야 Mapper에서 where 조건으로 사용 가능
		
		System.out.println("담당자 정보 수정/삭제 페이지");
		omCsDTO = omCsDAO.getCustomerRead(omCsDTO); // customerRead.jsp에서 받아온 id값을 DTO에 담아주었기 때문에 새로 객체 생성하면 안됨
		model.addAttribute("omCsDTO", omCsDTO); // ("select결과 페이지에서 써줄 이름", 넘겨줄 데이터)
	}
	
	
////////// 거래처 등록(insert 기능) //////////
	
	@RequestMapping("insertBn")
	public String insertBn(OperationMngBusinessDTO omBnDTO, HttpSession session) {
		// customerRead.jsp에서 넘겨 받은 type, name, ceo, addr, tel, country를 받기 위한 DTO,
		// select시 where 조건을 위해 필요한 HttpSession
		
		omBnDTO.setCom_id((Integer) session.getAttribute("com_id"));
		// DTO에 session값 com_id 담아주기(Object session이라 형변환). DTO에 담아주어야 Mapper에서 where 조건으로 사용 가능
		
		omCsDAO.addBusiness(omBnDTO);
		
		return "redirect:customerRead";
		// insert기능을 수행하면서 완료시 customerRead 컨트롤러에 들려서
		// selectAll을 해주고 customerRead페이지로 이동하도록 redirect
	}
	
	
////////// 거래처 수정(update 기능) //////////
	
	@RequestMapping("updateBn")
	public String updateBn(OperationMngBusinessDTO omBnDTO) {
		// customerRead.jsp에서 넘겨 받은 id, com_id, type, name, ceo, addr, tel, country_code를 받기 위한 DTO
		
		omCsDAO.editBusiness(omBnDTO);
		
		return "redirect:customerRead";
		// update기능을 수행하면서 완료시 customerRead 컨트롤러에 들려서
		// selectAll을 해주고 customerRead페이지로 이동하도록 redirect
	}
	
	
////////// 거래처 삭제(delete 기능) //////////
	
	@RequestMapping("deleteBn")
	public String deleteBn(OperationMngBusinessDTO omBnDTO) {
		// customerRead.jsp에서 넘겨 받은 id, com_id를 받기 위한 DTO
		
		omCsDAO.delBusiness(omBnDTO);
		
		return "redirect:customerRead";
		// delete기능을 수행하면서 완료시 customerRead 컨트롤러에 들려서
		// selectAll을 해주고 customerRead페이지로 이동하도록 redirect
	}
	
	
////////// 담당자 등록(insert 기능) //////////
	
	@RequestMapping("insertCs")
	public String insertCs(OperationMngCustomerDTO omCsDTO, HttpSession session) {
		// customerRead.jsp에서 넘겨 받은 b_id, name, tel, c_key, c_value를 받기 위한 DTO,
		// select시 where 조건을 위해 필요한 HttpSession
		
		omCsDTO.setCom_id((Integer) session.getAttribute("com_id"));
		// DTO에 session값 com_id 담아주기(Object session이라 형변환). DTO에 담아주어야 Mapper에서 where 조건으로 사용 가능
		omCsDAO.addCustomer(omCsDTO);
		
		return "redirect:customerRead";
		// insert기능을 수행하면서 완료시 customerRead 컨트롤러에 들려서
		// selectAll을 해주고 customerRead페이지로 이동하도록 redirect
	}
	
	
////////// 담당자 수정(update 기능) //////////
	
	@RequestMapping("updateCs")
	public String updateCs(OperationMngCustomerDTO omCsDTO) {
		// customerRead.jsp에서 넘겨 받은 id, b_id, com_id, name, tel, c_key, c_value를 받기 위한 DTO
		
		omCsDAO.editCustomer(omCsDTO);
		
		return "redirect:customerRead";
		// update기능을 수행하면서 완료시 customerRead 컨트롤러에 들려서
		// selectAll을 해주고 customerRead페이지로 이동하도록 redirect
	}
	
	
////////// 담당자 삭제(delete 기능) //////////
	
	@RequestMapping("deleteCs")
	public String deleteCs(OperationMngCustomerDTO omCsDTO) {
		// customerRead.jsp에서 넘겨 받은 id, b_id, com_id를 받기 위한 DTO
		
		omCsDAO.delCustomer(omCsDTO);
		
		return "redirect:customerRead";
		// delete기능을 수행하면서 완료시 customerRead 컨트롤러에 들려서
		// selectAll을 해주고 customerRead페이지로 이동하도록 redirect
	}
	
	
////////// 거래처 관리 목록 엑셀 파일 다운로드(selectAll 기능) //////////
	
	@RequestMapping("excelCsBn")
	public void excelCsBn(OperationMngCustomerJoinDTO omCsJoinDTO, HttpServletRequest request, HttpServletResponse response, HttpSession session, int dropdown, String search) throws Exception {
		// select시 where 조건을 위해 필요한 HttpSession,
		// session을 담아줄 DTO(session을 DTO에 담아 DAO의 입력값으로 넣어 Mapper의 where조건으로 사용),
		// customerRead.jsp에서 넘겨받은 dropdown에서 선택된 값 + search의 검색어 값
		
		omCsJoinDTO.setA_com_id((Integer) session.getAttribute("com_id"));
		// DTO에 session값 com_id 담아주기(Object session이라 형변환). DTO에 담아주어야 Mapper에서 where 조건으로 사용 가능
		System.out.println("거래처 관리 검색 페이지");
				
		List<OperationMngCustomerJoinDTO> list = null; // if문 밖에서 객체 생성을 해줘야 return list가 밖에서 가능
				
		if (dropdown == 0) { // 담당자명 일 때
			omCsJoinDTO.setA_name(search); // 검색어 값을 DTO에 담아 Mapper에서 where 조건으로 사용
			list = omCsDAO.getCustomerBusinessReadAllSearchZero(omCsJoinDTO);
		} else if (dropdown == 1){ // 거래처명 일 때
			omCsJoinDTO.setB_name(search); // 검색어 값을 DTO에 담아 Mapper에서 where 조건으로 사용
			list = omCsDAO.getCustomerBusinessReadAllSearchOne(omCsJoinDTO);
		}else { // 검색을 선택하지 않은 상태의 거래처 관리 화면의 기본 목록일 때
			list = omCsDAO.getCustomerBusinessReadAll(session.getAttribute("com_id"));
		}
		
		// 받은 데이터를 맵 형식으로 담는다
		Map<String, Object> beans = new HashMap<String, Object>();
        beans.put("list", list); // ("엑셀 파일에서 출력해줄 변수명 : ${list.변수명}", 검색결과를 담아준 변수명) 
		        
        // 엑셀 다운로드 메소드가 담겨 있는 객체
        Excel me = new Excel();

        me.download(request, response, beans, "CsBn", "CsBn.xlsx",""); // ( , , , "다운시 생성해줄 엑셀 파일명", "기본 형식을 지정한 엑셀 파일명.xlsx", "")			
	}
	
	
}

