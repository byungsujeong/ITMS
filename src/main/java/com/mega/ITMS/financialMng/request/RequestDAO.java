package com.mega.ITMS.financialMng.request;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mega.ITMS.financialMng.transfer.TransferDTO;

@Repository
public class RequestDAO {

	@Autowired
	SqlSessionTemplate myBatis;

//	public List<RequestDTO> selectAll() {
//		List<RequestDTO> list = myBatis.selectList("request.selectAll");
//		return list;
//	}

	public List<payDTO> selectAll() {
		List<payDTO> list = myBatis.selectList("request.selectAll");
		return list;
	}

	public void update(RequestDTO requestDTO) {
		myBatis.update("request.pay_check", requestDTO);
	}

	public void pay_update(RequestDTO requestDTO) {
		myBatis.update("request.pay_update", requestDTO);
	}

	public List<TransferDTO> transfer_selectAll() {
		List<TransferDTO> transfer_list = myBatis.selectList("request.transfer_selectAll");
		return transfer_list;
	}

	public payDTO selectrid(int id) {
		payDTO dto = myBatis.selectOne("request.selectrid", id);
		return dto;
	}

	public void delete(int id) {
		System.out.println("222222@@@@@@@222");
		myBatis.delete("request.delete", id);
		System.out.println("333@@@@@@@333333333333");
	}

	public List<IncomeDTO> selectIncomeJoin(int com_id) { // 지수
		try {
			List<IncomeDTO> list = myBatis.selectList("request.selectIncomeJoin", com_id);
			System.out.println(">>>SUCCESSED: selectIncomeJoin");
			return list;
		} catch (Exception e) {
			System.out.println(">>>FAILED: selectIncomeJoin" + com_id);

		}
		return null;
	}

	public List<TransferDTO> transfer_selectAllJS(int com_id) { // 지수
		List<TransferDTO> transfer_list = myBatis.selectList("request.transfer_selectAllJISOO", com_id);
		return transfer_list;
	}

//	public TransferDTO transfer_select(int fid) {
//		TransferDTO transfer_dto= myBatis.selectOne("request.transfer_select", fid);
//		return transfer_dto;
//	}
}
