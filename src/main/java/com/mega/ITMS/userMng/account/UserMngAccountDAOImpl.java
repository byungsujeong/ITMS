package com.mega.ITMS.userMng.account;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mega.ITMS.userMng.division.UserMngDeptDTO;

@Repository
public class UserMngAccountDAOImpl implements UserMngAccountDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	@Override
	public void addAccount(UserMngAccountDTO userMngAccountDTO) {
		myBatis.insert("accMng.insert", userMngAccountDTO);
	}

	@Override
	public List<UserMngAccountDTO> getAccount(UserMngAccountDTO userMngAccountDTO) {
		List<UserMngAccountDTO> list = myBatis.selectList("accMng.selectAccount", userMngAccountDTO);
		return list;
	}

	@Override
	public List<UserMngAccountDTO> getAccountAsName(UserMngAccountDTO userMngAccountDTO) {
		List<UserMngAccountDTO> list = myBatis.selectList("accMng.searchName", userMngAccountDTO);
		return list;
	}

	@Override
	public List<UserMngAccountDTO> getAccountAsBank(UserMngAccountDTO userMngAccountDTO) {
		List<UserMngAccountDTO> list = myBatis.selectList("accMng.searchBank", userMngAccountDTO);
		return list;
	}

	@Override
	public List<UserMngAccountDTO> getAccountAsAcc(UserMngAccountDTO userMngAccountDTO) {
		List<UserMngAccountDTO> list = myBatis.selectList("accMng.searchAcc", userMngAccountDTO);
		return list;
	}

	@Override
	public void editAccount(UserMngAccountDTO userMngAccountDTO) {
		myBatis.update("accMng.update", userMngAccountDTO);
	}

	@Override
	public void delAccount(UserMngAccountDTO userMngAccountDTO) {
		myBatis.delete("accMng.delete", userMngAccountDTO);
	}

}
