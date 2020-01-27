package com.mega.ITMS.operationMng.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.executor.ReuseExecutor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OperationMngCustomerDAOImpl implements OperationMngCustomerDAO{

	@Autowired
	SqlSessionTemplate myBatis;

	
/////////// 거래처 테이블(Business Table) ///////////	
	
	// insert (거래처 정보 등록 시 실행)
	@Override
	public void addBusiness(OperationMngBusinessDTO omBnDTO) {
		myBatis.insert("customer.insertBn", omBnDTO);		
	}
	
	// update (거래처 정보 수정 시 실행)
	@Override
	public void editBusiness(OperationMngBusinessDTO omBnDTO) {
		myBatis.update("customer.updateBn", omBnDTO);	
	}

	// delete (거래처 정보 삭제 시 실행 : 담당자 정보도 같이 삭제 / 외래키 CASECADE 설정 때문에 / 거래처가 없어지면 담당자도 필요가 없어지므로)
	@Override
	public void delBusiness(OperationMngBusinessDTO omBnDTO) {
		myBatis.delete("customer.deleteBn", omBnDTO);		
	}

	// selectOne (거래처 수정/삭제 페이지에서 선택한 정보를 출력해주기 위해 실행)
	@Override
	public OperationMngBusinessDTO getBusinessRead(OperationMngBusinessDTO omBnDTO) {
		omBnDTO = myBatis.selectOne("customer.selectBn", omBnDTO);
		return omBnDTO;
	}
	

////////// 담당자 테이블(Customer Table) //////////
	
	// insert (담당자 정보 등록 시 실행)
	@Override
	public void addCustomer(OperationMngCustomerDTO omCsDTO) {
		myBatis.insert("customer.insertCs", omCsDTO);	
	}
	
	// update (거래처 정보 수정 시 실행)
	@Override
	public void editCustomer(OperationMngCustomerDTO omCsDTO) {
		myBatis.update("customer.updateCs", omCsDTO);	
	}

	// delete (거래처 정보 삭제 시 실행 : 담당자 정보만 삭제)
	@Override
	public void delCustomer(OperationMngCustomerDTO omCsDTO) {
		myBatis.delete("customer.deleteCs", omCsDTO);
	}

	// selectOne (담당자 수정/삭제 페이지에서 선택한 정보를 출력해주기 위해 실행) 
	@Override
	public OperationMngCustomerDTO getCustomerRead(OperationMngCustomerDTO omCsDTO) {
		omCsDTO = myBatis.selectOne("customer.selectCs", omCsDTO);
		return omCsDTO;
	}
	
	
//////////	담당자 & 거래처 조인 테이블(Customer & Business Table) //////////
	
	// selectAll (거래처 관리 페이지 탭 클릭 시 실행)
	@Override
	public List<OperationMngCustomerJoinDTO> getCustomerBusinessReadAll(Object com_id) {
		// Controller에서 getCustomerBusinessReadAll의 입력값으로 넣어준
		// session값을 받아 주기 위한 Object com_id
		
		List<OperationMngCustomerJoinDTO> list = myBatis.selectList("customer.selectAllCsJoin", com_id);
		
		return list;
	}
		
	// selectAll (거래처 관리 페이지에서 검색 시 실행) : 검색(searchBnCs) 담당자명 : dropdown == 0
	@Override
	public List<OperationMngCustomerJoinDTO> getCustomerBusinessReadAllSearchZero(OperationMngCustomerJoinDTO omCsJoinDTO) {
		// Controller에서 session com_id, search 값을 omCsJoinDTO에 넣어주고
		// getCustomerBusinessReadAllSearchZero의 입력값으로 넣어준 omCsJoinDTO를 받기 위한 DTO
		
		List<OperationMngCustomerJoinDTO> list = myBatis.selectList("customer.selectAllSearchBnCsZero", omCsJoinDTO);
		
		return list;
	}
		
	// selectAll (거래처 관리 페이지에서 검색 시 실행) : 검색(searchBnCs) 담당자명 : dropdown == 1
	@Override
	public List<OperationMngCustomerJoinDTO> getCustomerBusinessReadAllSearchOne(OperationMngCustomerJoinDTO omCsJoinDTO) {
		// Controller에서 session com_id, search 값을 omCsJoinDTO에 넣어주고
		// getCustomerBusinessReadAllSearchZero의 입력값으로 넣어준 omCsJoinDTO를 받기 위한 DTO
		
		List<OperationMngCustomerJoinDTO> list = myBatis.selectList("customer.selectAllSearchBnCsOne", omCsJoinDTO);
		
		return list;
	}
	
}
