package com.mega.ITMS.importMng.importprocess;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImportDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	public Import_companyDTO importCompanySelect(int id) {
		Import_companyDTO dto = myBatis.selectOne("import.selectCompany", id);
		
		return dto;
	}
	
	public List<Import_employeeDTO> importEmployeeSelectAll(int id) {
		List<Import_employeeDTO> list = myBatis.selectList("import.selectAllEmployee", id);
		
		return list;
	}
	
	public Import_employeeDTO importEmployeeSelectID(String id) {
		try {
			Import_employeeDTO dto = myBatis.selectOne("import.selectEmployee", id);
			System.out.println(">>>성공 selectEmployee ID....");
			return dto;
		} catch (Exception e) {
			System.out.println(">>>실패 selectEmployee ID...");
		}
		return null;
	}

	
	public ArrayList<Import_businessDTO> importBusinessSelectAll(int com_id, String type) {
		List<Import_businessDTO> list = myBatis.selectList("import.selectAllBusiness", com_id);
		ArrayList<Import_businessDTO> Alist = new ArrayList<Import_businessDTO>();
		for (int i = 0; i <list.size(); i++) {
			if(type.equals(list.get(i).getType())){
				Alist.add(list.get(i));
			}
			
		}
		
		return Alist;
	}
	
	
	
	public Import_businessDTO importBusinessSelectOne(int b_id) {
		
		try {
			Import_businessDTO dto = myBatis.selectOne("selectBusiness", b_id);
			System.out.println(">>> SUCCESSED: importBusinessSelectOne +" + dto);
			return dto;
		} catch (Exception e) {
			System.out.println(">>> FAILED: importBusinessSelectOne");
		}
		
		return null;
	}
	
	public Import_orderShipping importOrderShippingOne(int basic_id) {
		try {
			Import_orderShipping dto = myBatis.selectOne("selectOrderShipping", basic_id);
			System.out.println(">>>SUCCESSED: importOrderShippingOne + " + dto);
			return dto;
		} catch (Exception e) {
			System.out.println(">>>FAILED: importOrderShippingOne ");
		}
		
		return null;
		
	}
	
	public List<Import_customerDTO> importCustomerSelectAll(Import_customerDTO customerDTO) {
		List<Import_customerDTO> list = myBatis.selectList("import.selectAllCustomer", customerDTO);
		
		return list;

	}
	
	public List<Import_productDTO> importProductSelectAll(int com_id) {
		List<Import_productDTO> list = myBatis.selectList("import.selectAllProduct", com_id);
		
		return list;
	}
	
	public Import_customerDTO importCustomerSelectOne(int c_id) {
		
		try {
			Import_customerDTO dto = myBatis.selectOne("import.selectCustomer", c_id);
			return dto;
			
		} catch (Exception e) {
		}
		return null;
	}
	
	public int importBasicTradeDESC() {
		int id = myBatis.selectOne("import.selectBasicTradeDESC");
		
		return id; 
	}
	
	public List<Import_tradeFileDTO> importTradeFileSelect(int com_id) {
		try {
			List<Import_tradeFileDTO> list = myBatis.selectList("import.selectAllTradeFile", com_id);
			return list;
		} catch (Exception e) {
		}
		
		return null;
	}
	
	public List<Import_tradeFileDTO> importTradeFileSelectJBS(int com_id) {
		try {
			List<Import_tradeFileDTO> list = myBatis.selectList("import.test", com_id);
			return list;
		} catch (Exception e) {
		}
		
		return null;
	}
	
	public List<Import_tradeFileDTO> importTradeFileSelectJBSSearch(Import_basicTradeDTO dto) {
		try {
			List<Import_tradeFileDTO> list = myBatis.selectList("import.testSearch", dto);
			return list;
		} catch (Exception e) {
		}
		
		return null;
	}


	
	public List<Import_stepDTO> importTradeFileCASEselect(int com_id) {
		try {
			List<Import_stepDTO> list = myBatis.selectList("import.selectTradeFIleCASE", com_id);
			return list;
		} catch (Exception e) {
		}
		
		return null;
	}
	
	public List<Import_financeRequestDTO> importFinanceRequestSelectAll(int com_id) {
		try {
			List<Import_financeRequestDTO> list = myBatis.selectList("import.selectAllFinanceRequest", com_id);
			System.out.println(">>>SUCCESSED: importFinanceRequestSelectAll");
			return list;
		} catch (Exception e) {
			System.out.println(">>>FAILED: importFinanceRequestSelectAll");
		}
		
		return null;
	}
	
	public List<Import_financeRequestDTO> importFinanceRequestSelectAllSearch(Import_basicTradeDTO dto) {
		try {
			List<Import_financeRequestDTO> list = myBatis.selectList("import.selectAllFinanceRequestSearch", dto);
			System.out.println(">>>SUCCESSED: importFinanceRequestSelectAllSearch");
			return list;
		} catch (Exception e) {
			System.out.println(">>>FAILED: importFinanceRequestSelectAllSearch");
		}
		
		return null;
	}


	
	public List<Import_productDTO> importProductSelectAllPID(int p_id) {
		try {
			List<Import_productDTO> list = myBatis.selectList("import.selectAllProductPID", p_id);
			return list;
		} catch (Exception e) {
		}
		
		return null;
	}

	
	public List<Import_basicTradeDTO> importBasicTradeSelect(int com_id) {
		try {
			List<Import_basicTradeDTO> list = myBatis.selectList("import.selectAllBasicTrade", com_id);
			return list;
		} catch (Exception e) {
		}
		
		return null;

	}
	
	public Import_basicTradeDTO importBasicTradeSelectPK(int id) {
		try {
			Import_basicTradeDTO dto = myBatis.selectOne("import.selectBasicTrade", id);
			System.out.println(">>>basicTradePK select....");
			return dto;
		} catch (Exception e) {
			System.out.println(">>>basicTradePK select....");
		}
		
		return null;

	}
	
	public Import_productDTO importProductSelectPID(int p_id) {
		try {
			Import_productDTO dto = myBatis.selectOne("import.selectProductPID", p_id);
			return dto;
		} catch (Exception e) {
		}
		
		return null;

	}

	
	public List<Import_orderDetailDTO> importOrderDetailAll(int basic_id) {
		try {
			List<Import_orderDetailDTO> list= myBatis.selectList("import.selectAllOrderDetail", basic_id);
			return list;
			
		} catch (Exception e) {
		}
		
		return null;
	}


	
	public void importBasictradeInsert(Import_basicTradeDTO basicTradeDTO) {
		try {
			myBatis.insert("import.insertBasicTrade", basicTradeDTO);
			System.out.println(">>>basicTrade insert");
		} catch (Exception e) {
			System.out.println(">>>basicTrade insert....");
		}
	}
	
	public void importProductInsert(Import_orderDetailDTO orderDetailDTO) {
		try {
			myBatis.insert("import.insertOrderDetail", orderDetailDTO);
			System.out.println(">>>SUCCESSED: ProductInsert.....");
		} catch (Exception e) {
			System.out.println(">>>FAILED: ProductInsert.....");
		}
	}
	
	public void importTradeFileInsert(Import_tradeFileDTO tradeFileDTO) {
		try {
			myBatis.insert("import.insertTradeFile", tradeFileDTO);
			System.out.println(">>>insertTradeFile insert....");
		} catch (Exception e) {
			System.out.println(">>>insertTradeFile insert...." + tradeFileDTO);
		}
	}
	
	public void importOrderShippingInsert(Import_orderShipping dto) {
		try {
			myBatis.insert("import.insertOrderShipping1", dto);
			System.out.println(">>>insertOrderShipping1 INSERT");
		} catch (Exception e) {
			System.out.println(">>>insertOrderShipping1 INSERT");
		}
	}
	
	public List<Import_customerDTO> importCustomerJoinSelect(int b_id) {
		try {
			List<Import_customerDTO> list = myBatis.selectList("import.selectAllCustomerJoin", b_id);
			System.out.println(">>>importCustomerJoinSelect SELECT Successed");
			return list;
		} catch (Exception e) {
			System.out.println(">>>importCustomerJoinSelect SELECT Failed");
		}
		return null;
	}
	
	public void importPOeditAjax(Import_basicTradeDTO dto) {
		try {
			myBatis.update("import.POeditUpdate", dto);
			System.out.println(">>>SUCCESSED: POeditUpdate...");
		} catch (Exception e) {
			System.out.println(">>>FAILED: POeditUpdate...");
		}
	}
	
	public void importDeletePOdetailAjax(int id) {
		
		try {
			myBatis.delete("import.deleteDetailPID", id);
			System.out.println(">>>SUCCESSED: importPOdetailAjax");
		} catch (Exception e) {
			System.out.println(">>>FAILED: importPOdetailAjax");
		}
	}
	
	public void importShipPIedit(Import_orderShipping dto) {
		try {
			myBatis.insert("import.PIeditUpdate", dto);
			System.out.println(">>>SUCCESSED: importShipPIedit.do");
		} catch (Exception e) {
			System.out.println(">>>FAILED: importShipPIedit.do");
		}
	}
	
	public void insertFinanceRequest(Import_financeRequestDTO dto) {
		try {
			myBatis.insert("import.importInsertFinanceRequest", dto);
			System.out.println(">>>SUCCESSED: importInsertFinanceRequest " + dto);
		} catch (Exception e) {
			System.out.println(">>>FAILED: importInsertFinanceRequest "+dto);
		}
	}
	
}
