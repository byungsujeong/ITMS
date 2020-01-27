package com.mega.ITMS.importMng.importprocess;

public class Import_employeeDTO {
	private int com_id, pmenu, imunu, emenu, fmenu, rmenu, imenu1, flag;
	private String id, pw, dept_id, name, tel, email, delegation,date;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getCom_id() {
		return com_id;
	}
	public void setCom_id(int com_id) {
		this.com_id = com_id;
	}
	public int getPmenu() {
		return pmenu;
	}
	public void setPmenu(int pmenu) {
		this.pmenu = pmenu;
	}
	public int getImunu() {
		return imunu;
	}
	public void setImunu(int imunu) {
		this.imunu = imunu;
	}
	public int getEmenu() {
		return emenu;
	}
	public void setEmenu(int emenu) {
		this.emenu = emenu;
	}
	public int getFmenu() {
		return fmenu;
	}
	public void setFmenu(int fmenu) {
		this.fmenu = fmenu;
	}
	public int getRmenu() {
		return rmenu;
	}
	public void setRmenu(int rmenu) {
		this.rmenu = rmenu;
	}
	public int getImenu1() {
		return imenu1;
	}
	public void setImenu1(int imenu1) {
		this.imenu1 = imenu1;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDelegation() {
		return delegation;
	}
	public void setDelegation(String delegation) {
		this.delegation = delegation;
	}
	@Override
	public String toString() {
		return "Import_employeeDTO [com_id=" + com_id + ", pmenu=" + pmenu + ", imunu=" + imunu + ", emenu=" + emenu
				+ ", fmenu=" + fmenu + ", rmenu=" + rmenu + ", imenu1=" + imenu1 + ", flag=" + flag + ", id=" + id
				+ ", pw=" + pw + ", dept_id=" + dept_id + ", name=" + name + ", tel=" + tel + ", email=" + email
				+ ", delegation=" + delegation + ", date=" + date + "]";
	}
	
	
	
	
}
