package com.mega.ITMS.userMng.division;

import java.util.List;

import com.mega.ITMS.userMng.usermanage.UserMngEmployeeDTO;

public interface UserMngDeptDAO {

	public void addDepartment(UserMngDeptDTO userMngDeptDTO);
	
	public List<UserMngDeptDTO> getDepartment(UserMngDeptDTO userMngDeptDTO);
	public List<UserMngDeptDTO> getDepartmentAsName(UserMngDeptDTO userMngDeptDTO);
	public List<UserMngDeptDTO> getDepartmentAsId(UserMngDeptDTO userMngDeptDTO);
	
	public void editDepartment(UserMngDeptDTO userMngDeptDTO);
	
	public void delDepartment(UserMngDeptDTO userMngDeptDTO);
	
}
