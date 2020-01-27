package com.mega.ITMS.userMng.division;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserMngDeptDAOImpl implements UserMngDeptDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	@Override
	public void addDepartment(UserMngDeptDTO userMngDeptDTO) {
		myBatis.insert("deptMng.insert", userMngDeptDTO);
	}

	@Override
	public List<UserMngDeptDTO> getDepartment(UserMngDeptDTO userMngDeptDTO) {
		List<UserMngDeptDTO> list = myBatis.selectList("deptMng.selectDept", userMngDeptDTO);
		return list;
	}

	@Override
	public List<UserMngDeptDTO> getDepartmentAsName(UserMngDeptDTO userMngDeptDTO) {
		List<UserMngDeptDTO> list = myBatis.selectList("deptMng.searchName", userMngDeptDTO);
		return list;
	}

	@Override
	public List<UserMngDeptDTO> getDepartmentAsId(UserMngDeptDTO userMngDeptDTO) {
		List<UserMngDeptDTO> list = myBatis.selectList("deptMng.searchId", userMngDeptDTO);
		return list;
	}

	@Override
	public void editDepartment(UserMngDeptDTO userMngDeptDTO) {
		myBatis.update("deptMng.update", userMngDeptDTO);
	}

	@Override
	public void delDepartment(UserMngDeptDTO userMngDeptDTO) {
		myBatis.delete("deptMng.delete", userMngDeptDTO);
	}

}
