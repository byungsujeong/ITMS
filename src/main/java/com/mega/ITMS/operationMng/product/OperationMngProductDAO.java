package com.mega.ITMS.operationMng.product;

import java.util.List;

public interface OperationMngProductDAO {
	
	// insert
	public void addProduct(OperationMngProductDTO omPdDTO);
	
	// update
	public void editProduct(OperationMngProductDTO omPdDTO);
	
	// delete
	public void delProduct(OperationMngProductDTO omPdDTO);
	
	// selectOne
	public OperationMngProductDTO getProductRead(OperationMngProductDTO omPdDTO);
	
	// selectAll
	public List<OperationMngProductDTO> getProductReadAll(Object com_id);

	// selectAll(Search) : Zero(제품명 : name)
	public List<OperationMngProductDTO> getProductReadAllSearchZero(OperationMngProductDTO omPdDTO);
	
	// selectAll(Search) : One(제품코드 : code)
	public List<OperationMngProductDTO> getProductReadAllSearchOne(OperationMngProductDTO omPdDTO);
	
	// selectAll(History) : Down(내림차순, default)
	public List<OperationMngProductDTO> getProductReadAllHistoryDown(OperationMngProductDTO omPdDTO);

	// selectAll(History) : Up(오름차순)
	public List<OperationMngProductDTO> getProductReadAllHistoryUp(OperationMngProductDTO omPdDTO);

}
