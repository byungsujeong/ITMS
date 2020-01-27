package com.mega.ITMS.userMng.corporate;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserMngCorpDAOImpl implements UserMngCorpDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	@Override
	public void addCorporate(UserMngCorpDTO userMngCorpDTO) {
		myBatis.insert("corpMng.insert", userMngCorpDTO);
	}

	@Override
	public UserMngCorpDTO loginCorporate(UserMngCorpDTO userMngCorpDTO) {
		userMngCorpDTO = myBatis.selectOne("corpMng.select", userMngCorpDTO);
		return userMngCorpDTO;
	}

	@Override
	public UserMngCorpDTO getCorporate(Object id) {
		UserMngCorpDTO userMngCorpDTO = new UserMngCorpDTO();
		userMngCorpDTO = myBatis.selectOne("corpMng.getCorporate", id);
		return userMngCorpDTO;
	}

	@Override
	public void editCorporate(UserMngCorpDTO userMngCorpDTO) {
		myBatis.update("corpMng.update", userMngCorpDTO);
	}

	@Override
	public void delCorporate(Object id) {
		myBatis.update("corpMng.flag", id);
	}

	@Override
	public void delUser(Object com_id) {
		myBatis.update("corpMng.flag2", com_id);
	}

}
