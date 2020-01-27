package com.mega.ITMS.operationMng.customer;

import java.util.List;

public interface OperationMngCustomerDAO {
	

////////// 거래처 테이블(Business Table) //////////
	
	// insert
	public void addBusiness(OperationMngBusinessDTO omBnDTO);
	
	// update
	public void editBusiness(OperationMngBusinessDTO omBnDTO);
	
	// delete
	public void delBusiness(OperationMngBusinessDTO omBnDTO);
	
	// selectOne
	public OperationMngBusinessDTO getBusinessRead(OperationMngBusinessDTO omBnDTO);
	

////////// 담당자 테이블(Customer Table) ///////////
	
	// insert
	public void addCustomer(OperationMngCustomerDTO omCsDTO);
	
	// update
	public void editCustomer(OperationMngCustomerDTO omCsDTO);
	
	// delete
	public void delCustomer(OperationMngCustomerDTO omCsDTO);
	
	// selectOne
	public OperationMngCustomerDTO getCustomerRead(OperationMngCustomerDTO omCsDTO);
	
	
///// 담당자 & 거래처 조인 테이블(Customer & Business Table) //////	
	
	// selectAll
	List<OperationMngCustomerJoinDTO> getCustomerBusinessReadAll(Object com_id);
	
	// selectAll(SearchZero)
	List<OperationMngCustomerJoinDTO> getCustomerBusinessReadAllSearchZero(OperationMngCustomerJoinDTO omCsJoinDTO);
	
	// selectAll(SearchOne)
	List<OperationMngCustomerJoinDTO> getCustomerBusinessReadAllSearchOne(OperationMngCustomerJoinDTO omCsJoinDTO);
	

	
}
