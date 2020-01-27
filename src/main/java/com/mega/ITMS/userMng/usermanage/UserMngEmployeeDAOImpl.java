package com.mega.ITMS.userMng.usermanage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mega.ITMS.userMng.division.UserMngDeptDTO;

@Repository
public class UserMngEmployeeDAOImpl implements UserMngEmployeeDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	@Override
	public List<UserMngDeptDTO> getDepartment(Object com_id) {
		List<UserMngDeptDTO> list = myBatis.selectList("employeeMng.selectDept", com_id);
		return list;
	}

	@Override
	public void addUser(UserMngEmployeeDTO userMngEmployeeDTO) {
		myBatis.insert("employeeMng.insert", userMngEmployeeDTO);
	}

	@Override
	public UserMngEmployeeDTO loginUser(UserMngEmployeeDTO userMngEmployeeDTO) {
		userMngEmployeeDTO = myBatis.selectOne("employeeMng.select", userMngEmployeeDTO);
		return userMngEmployeeDTO;
	}

	@Override
	public List<UserMngEmployeeDTO> getUserAll(UserMngEmployeeDTO userMngEmployeeDTO) {
		List<UserMngEmployeeDTO> list = myBatis.selectList("employeeMng.selectAll", userMngEmployeeDTO);
		return list;
	}

	@Override
	public List<UserMngEmployeeDTO> getUserAsName(UserMngEmployeeDTO userMngEmployeeDTO) {
		List<UserMngEmployeeDTO> list = myBatis.selectList("employeeMng.searchName", userMngEmployeeDTO);
		return list;
	}

	@Override
	public List<UserMngEmployeeDTO> getUserAsId(UserMngEmployeeDTO userMngEmployeeDTO) {
		List<UserMngEmployeeDTO> list = myBatis.selectList("employeeMng.searchId", userMngEmployeeDTO);
		return list;
	}

	@Override
	public List<UserMngEmployeeDTO> getUserAsDept_id(UserMngEmployeeDTO userMngEmployeeDTO) {
		List<UserMngEmployeeDTO> list = myBatis.selectList("employeeMng.searchDept_id", userMngEmployeeDTO);
		return list;
	}

	@Override
	public List<UserMngEmployeeDTO> getUserAsDept_name(UserMngDeptDTO userMngDeptDTO) {
		List<UserMngEmployeeDTO> list = myBatis.selectList("employeeMng.searchDept_name", userMngDeptDTO);
		return list;
	}

	@Override
	public void editUser(UserMngEmployeeDTO userMngEmployeeDTO) {
		myBatis.update("employeeMng.update", userMngEmployeeDTO);
	}

	@Override
	public void delUser(UserMngEmployeeDTO userMngEmployeeDTO) {
		myBatis.update("employeeMng.flag", userMngEmployeeDTO);
	}
	
	@Override
	public UserMngEmployeeDTO getUser(UserMngEmployeeDTO userMngEmployeeDTO) {
		userMngEmployeeDTO = myBatis.selectOne("employeeMng.getUser", userMngEmployeeDTO);
		return userMngEmployeeDTO;
	}

	@Override
	public void editUserPw(UserMngEmployeeDTO userMngEmployeeDTO) {
		myBatis.update("employeeMng.updatePw", userMngEmployeeDTO);
	}

	@Override
	public List<UserMngEmployeeDTO> delegation(UserMngEmployeeDTO userMngEmployeeDTO) {
		List<UserMngEmployeeDTO> list = myBatis.selectList("employeeMng.delegation", userMngEmployeeDTO);
		return list;
	}

}
