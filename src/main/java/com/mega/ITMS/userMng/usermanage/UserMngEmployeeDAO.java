package com.mega.ITMS.userMng.usermanage;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.mega.ITMS.userMng.division.UserMngDeptDTO;

public interface UserMngEmployeeDAO {

	public List<UserMngDeptDTO> getDepartment(Object com_id);
	
	public void addUser(UserMngEmployeeDTO userMngEmployeeDTO);
	
	public UserMngEmployeeDTO loginUser(UserMngEmployeeDTO userMngEmployeeDTO);
	
	public List<UserMngEmployeeDTO> getUserAll(UserMngEmployeeDTO userMngEmployeeDTO);
	public List<UserMngEmployeeDTO> getUserAsName(UserMngEmployeeDTO userMngEmployeeDTO);
	public List<UserMngEmployeeDTO> getUserAsId(UserMngEmployeeDTO userMngEmployeeDTO);
	public List<UserMngEmployeeDTO> getUserAsDept_id(UserMngEmployeeDTO userMngEmployeeDTO);
	public List<UserMngEmployeeDTO> getUserAsDept_name(UserMngDeptDTO userMngDeptDTO);
	
	public void editUser(UserMngEmployeeDTO userMngEmployeeDTO);
	
	public void delUser(UserMngEmployeeDTO userMngEmployeeDTO);
	
	public UserMngEmployeeDTO getUser(UserMngEmployeeDTO userMngEmployeeDTO);
	
	public void editUserPw(UserMngEmployeeDTO userMngEmployeeDTO);
	
	public List<UserMngEmployeeDTO> delegation(UserMngEmployeeDTO userMngEmployeeDTO);
	
}