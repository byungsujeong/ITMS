package com.mega.ITMS.financialMng.transfer;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.mega.ITMS.financialMng.request.RequestDTO;

@Repository
public class TransferDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	
	public void insert(TransferDTO transferDTO) {
		myBatis.insert("transfer.payinsert", transferDTO);
	}
	
	public void insertAll(TransferDTO transferDTO) {
		try {
			myBatis.insert("transfer.insertAll", transferDTO);
			System.out.println(">>>ajax for문 insert 성공...");
			System.out.println(transferDTO);
		} catch (Exception e) {
			System.out.println(">>>ajax for문 insert 실패...");
		}
	}


	public TransferDTO selectpayend(TransferDTO transferDTO) {
		transferDTO = myBatis.selectOne("transfer.selectpayend", transferDTO);
		return transferDTO;
	}

	public List<TransferDTO> selectAll() {
		try {
			List<TransferDTO> list = myBatis.selectList("transfer.selectAll");
			return list;
			
		} catch (Exception e) {
		}
		return null;
	}
	
	public List<RequestDTO> selectRequest(int com_id) {
		try {
			List<RequestDTO> list = myBatis.selectList("transfer.selectRequest", com_id);
			System.out.println(list+"@@@@@");
			return list;
			
		} catch (Exception e) {
		}
		return null;
	}
	
	public TransferDTO selectfid(int id) {
		TransferDTO dto = myBatis.selectOne("transfer.selectfid", id);
		return dto;
	}
	
	public void update(TransferDTO transferDTO) {
		myBatis.update("transfer.update", transferDTO);

	}

	public void delete(int id) {
		myBatis.delete("transfer.delete", id);
	}
	
	
}
