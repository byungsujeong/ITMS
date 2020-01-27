package com.mega.ITMS.userMng.corporate;

public interface UserMngCorpDAO {
	
	public void addCorporate(UserMngCorpDTO userMngCorpDTO);
	
	public UserMngCorpDTO loginCorporate(UserMngCorpDTO userMngCorpDTO);

	public UserMngCorpDTO getCorporate(Object id);
	
	public void editCorporate(UserMngCorpDTO userMngCorpDTO);
	
	public void delCorporate(Object id);
	public void delUser(Object id);
	
}
