package com.mega.ITMS.operationMng.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mega.ITMS.Excel;
import com.mega.ITMS.operationMng.customer.OperationMngCustomerJoinDTO;

@RequestMapping("operation/product") // 현재 Controller에서의 default 주소
@Controller
public class OperationMngProductController {
	
	@Autowired
	OperationMngProductDAOImpl omPdDAO;

	
////////// 제품 관리 페이지(제품 관리 탭 클릭시 보이는 페이지)(selectAll 기능) ////////
	
	@RequestMapping("productRead")
	public void productRead(Model model, HttpSession session) {
		// select결과를 productRead.jsp로 보내주기 위한 Model,
		// select시 where 조건을 위해 필요한 HttpSession
		
		System.out.println("제품 관리 페이지");
		List<OperationMngProductDTO> list = omPdDAO.getProductReadAll(session.getAttribute("com_id"));
		// DAO의 메서드 입력값으로 session값을 넣어줘서 Mapper에서 where조건으로 사용
		
		model.addAttribute("list", list);
	}

	
////////// 제품 관리 목록 검색(selectAll 기능) ////////
	
	@ResponseBody
	// ajax 사용시 result jsp파일을 따로 생성하지 않고 result값에 해당하는 데이터를 ResponseBody에 담아서 바로 전송
	// pom.xml의 dependency에 jackson-databind 라이브러리를 추가하고 Response 어노테이션을 사용하면
	// Model 객체 없이도 return 값으로 검색결과를 담아준 변수로 데이터 전송 가능	
	
	@RequestMapping("productSearch")
	public List<OperationMngProductDTO> productReadSearch(OperationMngProductDTO omPdDTO, HttpSession session, int dropdown, String search){
		// select시 where 조건을 위해 필요한 HttpSession,
		// session을 담아줄 DTO(session을 DTO에 담아 DAO의 입력값으로 넣어 Mapper의 where조건으로 사용),
		// customerRead.jsp에서 넘겨받은 dropdown에서 선택된 값 + search의 검색어 값
		
		omPdDTO.setCom_id((Integer) session.getAttribute("com_id"));
		// DTO에 session값 com_id 담아주기(Object session이라 형변환). DTO에 담아주어야 Mapper에서 where 조건으로 사용 가능
		System.out.println("제품 관리 페이지");
		
		List<OperationMngProductDTO> list = null; // if문 밖에서 객체 생성을 해줘야 return list가 밖에서 가능
		
		if (dropdown == 0) { // 제품명 일 때
			omPdDTO.setName(search); // 검색어 값을 DTO에 담아 Mapper에서 where 조건으로 사용
			list = omPdDAO.getProductReadAllSearchZero(omPdDTO);
		} else if (dropdown == 1){ // 제품코드 일 때
			omPdDTO.setCode(search); // 검색어 값을 DTO에 담아 Mapper에서 where 조건으로 사용
			list = omPdDAO.getProductReadAllSearchOne(omPdDTO);
		}
		
		return list;
	}
	
		
////////// 제품 이력 목록 : 모달창 (getProductReadAllHistory, selectAll) + 내림차순/오름차순 //////////
	
	// ajax 통신 시 따로 result를 출력할 jsp파일을 생성하지 않고 현재 컨트롤러에서 모달창으로 전달할 데이터들을 담아준 list를
	// ajax result로 바로 쏴주기 위해 @ResponseBody 사용 
	@ResponseBody
	// ajax 사용시 result jsp파일을 따로 생성하지 않고 result값에 해당하는 데이터를 ResponseBody에 담아서 바로 전송
	// pom.xml의 dependency에 jackson-databind 라이브러리를 추가하고 Response 어노테이션을 사용하면
	// Model 객체 없이도 return 값으로 검색결과를 담아준 변수로 데이터 전송 가능	
	
	@RequestMapping("priceHistory") // result 출력 파일을 생성하지 않기 때문에 ajax url의 요청 주소와 동일하게만 해주면 됨
	public List<OperationMngProductDTO> productReadHistory(OperationMngProductDTO omPdDTO, HttpSession session, int filter) {
		// code를 받아주기 위한 OperationMngProductDTO
		// select시 where 조건을 위해 필요한 HttpSession,
		// session을 담아줄 DTO(session을 DTO에 담아 DAO의 입력값으로 넣어 Mapper의 where조건으로 사용),
		// productRead.jsp의 모달창 부분에서 0 or 1 형식으로 넘겨받은 filter값
		// 여기서는 ajax의 result로 list에 담아준 데이터들을 보내주기 때문에 Model 객체가 입력값으로 필요하지 않음
		
		omPdDTO.setCom_id((Integer) session.getAttribute("com_id"));
		// DTO에 session값 com_id 담아주기(Object session이라 형변환). DTO에 담아주어야 Mapper에서 where 조건으로 사용 가능
		System.out.println("제품 관리 페이지");
		
		List<OperationMngProductDTO> list = null; // if문 밖에서 객체 생성을 해줘야 return list가 밖에서 가능
		
		// productRead.jsp의 오름차순, 내림차순 버튼 클릭시 받아올 filter 값을 if문으로 분기
		if (filter == 0) { // 내림차순 일 때
			list = omPdDAO.getProductReadAllHistoryDown(omPdDTO); // 내림차순 DAO
		}else { // 오름차순 일 때
			list = omPdDAO.getProductReadAllHistoryUp(omPdDTO); // 오름차순 DAO
		}		
		return list;		
	}
	
	
////////// 제품 정보 등록 페이지(제품 등록 버튼 클릭시 보이는 페이지) //////////
	
	@RequestMapping("productAdd")
	public void productAdd1Page() {
		System.out.println("제품 정보 등록 페이지");
	}
	
	
////////// 제품 정보 수정(제품 수정/삭제 버튼 클릭시 보이는 페이지)(selectOne 기능) //////////
	
	@RequestMapping("productEditDel")
	public void productEditDel1Page(OperationMngProductDTO omPdDTO, Model model, HttpSession session) {
		// productRead.jsp에서 넘겨 받은 id를 받기 위한 DTO,
		// select결과를 productEditDel.jsp로 보내주기 위한 Model,
		// select시 where 조건을 위해 필요한 HttpSession
		
		omPdDTO.setCom_id((Integer) session.getAttribute("com_id"));
		// DTO에 session값 com_id 담아주기(Object session이라 형변환). DTO에 담아주어야 Mapper에서 where 조건으로 사용 가능
		System.out.println("제품 정보 수정/삭제 페이지");
		
		omPdDTO = omPdDAO.getProductRead(omPdDTO); // productRead.jsp에서 받아온 id값을 DTO에 담아주었기 때문에 새로 객체 생성하면 안됨
		
		model.addAttribute("omPdDTO", omPdDTO); // ("select결과 페이지에서 써줄 이름", 넘겨줄 데이터)
	}
	
	
////////// 제품 등록(insert 기능) //////////	
	
	@RequestMapping("insertPd")
	public String insertPd(OperationMngProductDTO omPdDTO, HttpSession session) {
		// productRead.jsp에서 넘겨 받은 code, name, spec, price를 받기 위한 DTO,
		// select시 where 조건을 위해 필요한 HttpSession
		
		omPdDTO.setCom_id((Integer) session.getAttribute("com_id"));
		// DTO에 session값 com_id 담아주기(Object session이라 형변환). DTO에 담아주어야 Mapper에서 where 조건으로 사용 가능
		
		omPdDAO.addProduct(omPdDTO);
		
		return "redirect:productRead";
		// insert기능을 수행하면서 완료시 productRead 컨트롤러에 들려서
		// selectAll을 해주고 productRead페이지로 이동하도록 redirect
	}
	
	
////////// 제품 수정(update 기능) //////////
	
	@RequestMapping("updatePd")
	public String updatePd(OperationMngProductDTO omPdDTO) {
		// productRead.jsp에서 넘겨 받은 id, com_id, code, name, spec, price를 받기 위한 DTO
		
		omPdDAO.editProduct(omPdDTO); // 이력관리를 위해 update가 아닌 **insert** 메서드 사용
		
		return "redirect:productRead";
		// **insert** 기능을 수행하면서 완료시 productRead 컨트롤러에 들려서
		// selectAll을 해주고 productRead페이지로 이동하도록 redirect
	}
	
	
////////// 제품 삭제(delete 기능) //////////
	
	@RequestMapping("deletePd")
	public String deletePd(OperationMngProductDTO omPdDTO) {
		// productRead.jsp에서 넘겨 받은 id, code, com_id를 받기 위한 DTO
		
		omPdDAO.delProduct(omPdDTO);
		
		return "redirect:productRead";
		// delete 기능을 수행하면서 완료시 productRead 컨트롤러에 들려서
		// selectAll을 해주고 productRead페이지로 이동하도록 redirect
	}


////////// 제품 관리 목록 엑셀 파일 다운로드(selectAll 기능) //////////	

	@RequestMapping("excelPd")
	public void excelPd(OperationMngProductDTO omPdDTO, HttpServletRequest request, HttpServletResponse response, HttpSession session, int dropdown, String search) throws Exception {
		// select시 where 조건을 위해 필요한 HttpSession,
		// session을 담아줄 DTO(session을 DTO에 담아 DAO의 입력값으로 넣어 Mapper의 where조건으로 사용),
		// customerRead.jsp에서 넘겨받은 dropdown에서 선택된 값 + search의 검색어 값
		
		omPdDTO.setCom_id((Integer) session.getAttribute("com_id"));
		// DTO에 session값 com_id 담아주기(Object session이라 형변환). DTO에 담아주어야 Mapper에서 where 조건으로 사용 가능
		System.out.println("거래처 관리 검색 페이지");
				
		List<OperationMngProductDTO> list = null; // if문 밖에서 객체 생성을 해줘야 return list가 밖에서 가능
				
		if (dropdown == 0) { // 제품명 일 때
			omPdDTO.setName(search); // 검색어 값을 DTO에 담아 Mapper에서 where 조건으로 사용
			list = omPdDAO.getProductReadAllSearchZero(omPdDTO);
		} else if (dropdown == 1){ // 제품코드 일 때
			omPdDTO.setCode(search); // 검색어 값을 DTO에 담아 Mapper에서 where 조건으로 사용
			list = omPdDAO.getProductReadAllSearchOne(omPdDTO);
		} else { // 검색을 선택하지 않은 상태의 제품 관리 화면의 기본 목록일 때
			list = omPdDAO.getProductReadAll(session.getAttribute("com_id"));
		}
				
		// 받은 데이터를 맵 형식으로 담는다
		Map<String, Object> beans = new HashMap<String, Object>();
		beans.put("list", list); // ("엑셀 파일에서 출력해줄 변수명 : ${list.변수명}", 검색결과를 담아준 변수명)
		        
		// 엑셀 다운로드 메소드가 담겨 있는 객체
		Excel me = new Excel();

		me.download(request, response, beans, "Pd", "Pd.xlsx",""); // ( , , , "다운시 생성해줄 엑셀 파일명", "기본 형식을 지정한 엑셀 파일명.xlsx", "")				
	}	
	
	
}
