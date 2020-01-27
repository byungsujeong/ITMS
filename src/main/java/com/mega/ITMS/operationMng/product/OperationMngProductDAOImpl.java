package com.mega.ITMS.operationMng.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OperationMngProductDAOImpl implements OperationMngProductDAO{

	@Autowired
	SqlSessionTemplate myBatis;
	
	
////////// 제품 테이블(Product Table) //////////
	
	// insert (제품 정보 등록 시 실행)
	@Override
	public void addProduct(OperationMngProductDTO omPdDTO) {
		myBatis.insert("product.insertPd", omPdDTO);		
	}
	
	// update (제품 정보 수정 시 실행 : 실제 기능은 insert)
	@Override
	public void editProduct(OperationMngProductDTO omPdDTO) {
		myBatis.insert("product.insertPd2", omPdDTO); // update가 아닌 insert 메서드 사용 : 이력관리를 위해	
	}
	
	// delete (제품 정보 삭제 시 실행)
	@Override
	public void delProduct(OperationMngProductDTO omPdDTO) {
		myBatis.delete("product.deletePd", omPdDTO);	
	}

	// selectOne (제품 수정/삭제 페이지에서 선택한 정보를 출력해주기 위해 실행)
	@Override
	public OperationMngProductDTO getProductRead(OperationMngProductDTO omPdDTO) {
		omPdDTO = myBatis.selectOne("product.selectPd", omPdDTO);
		return omPdDTO;		
	}

	// selectAll (제품 관리 페이지 탭 클릭 시 실행)
	@Override
	public List<OperationMngProductDTO> getProductReadAll(Object com_id) {
		// Controller에서 getProductReadAll의 입력값으로 넣어준
		// session값을 받아 주기 위한 Object com_id
		
		List<OperationMngProductDTO> list = myBatis.selectList("product.selectAllPd", com_id);
		
		return list;
		
	}
	
	
	// selectAll (제품 관리 페이지에서 검색 시 실행) : 검색(productSearch) 제품명 : dropdown == 0
	@Override
	public List<OperationMngProductDTO> getProductReadAllSearchZero(OperationMngProductDTO omPdDTO) {
		// Controller에서 code, session com_id 값을 omCsJoinDTO에 넣어주고
		// getProductReadAllSearchZero의 입력값으로 넣어준 omPdDTO를 받기 위한 DTO
		
		List<OperationMngProductDTO> list = myBatis.selectList("product.selectAllPdSearchZero", omPdDTO);
		
		return list;
		
	}
	

	// selectAll (제품 관리 페이지에서 검색 시 실행) : 검색(productSearch) 제품코드 : dropdown == 1
	@Override
	public List<OperationMngProductDTO> getProductReadAllSearchOne(OperationMngProductDTO omPdDTO) {
		// Controller에서 code, session com_id 값을 omCsJoinDTO에 넣어주고
		// getProductReadAllSearchZero의 입력값으로 넣어준 omPdDTO를 받기 위한 DTO
		
		List<OperationMngProductDTO> list = myBatis.selectList("product.selectAllPdSearchOne", omPdDTO);
		
		return list;
		
	}
	

	// selectAll (HistoryDown) (제품 관리 페이지에서 모달창(제품 단가 이력) 실행 시 실행) : 내림차순 (priceHistory)
	@Override
	public List<OperationMngProductDTO> getProductReadAllHistoryDown(OperationMngProductDTO omPdDTO) {
		// Controller에서 code, session com_id 값을 omCsJoinDTO에 넣어주고
		// getProductReadAllHistoryDown의 입력값으로 넣어준 omPdDTO를 받기 위한 DTO
		
		List<OperationMngProductDTO> list = myBatis.selectList("product.selectAllHistoryDown", omPdDTO);
		
		return list;
		
	}

	// selectAll (HistoryUp) (제품 관리 페이지에서 모달창(제품 단가 이력) 실행 시 실행) : 오름차순 (priceHistory)
	@Override
	public List<OperationMngProductDTO> getProductReadAllHistoryUp(OperationMngProductDTO omPdDTO) {
		// Controller에서 code, session com_id 값을 omCsJoinDTO에 넣어주고
		// getProductReadAllHistoryUp의 입력값으로 넣어준 omPdDTO를 받기 위한 DTO
		
		List<OperationMngProductDTO> list = myBatis.selectList("product.selectAllHistoryUp", omPdDTO);
		
		return list;
		
	}

}
