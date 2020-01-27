package com.mega.ITMS.userMng.account;

import java.util.List;

import com.mega.ITMS.userMng.division.UserMngDeptDTO;

public interface UserMngAccountDAO {

	public void addAccount(UserMngAccountDTO userMngAccountDTO);
	
	public List<UserMngAccountDTO> getAccount(UserMngAccountDTO userMngAccountDTO);
	public List<UserMngAccountDTO> getAccountAsName(UserMngAccountDTO userMngAccountDTO);
	public List<UserMngAccountDTO> getAccountAsBank(UserMngAccountDTO userMngAccountDTO);
	public List<UserMngAccountDTO> getAccountAsAcc(UserMngAccountDTO userMngAccountDTO);
	
	public void editAccount(UserMngAccountDTO userMngAccountDTO);
	
	public void delAccount(UserMngAccountDTO userMngAccountDTO);
	
}
