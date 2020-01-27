package com.mega.ITMS.userMng.usermanage;

import java.sql.Timestamp;

public class UserMngEmployeeDTO {
	String id;
	String pw;
	int com_id;
	String dept_id;
	String name;
	String tel;
	String email;
	Timestamp r_date;
	int pmenu;
	int imenu;
	int emenu;
	int fmenu;
	int rmenu;
	String delegation;
	int flag;
	
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
	public int getCom_id() {
		return com_id;
	}
	public void setCom_id(int com_id) {
		this.com_id = com_id;
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
	public Timestamp getR_date() {
		return r_date;
	}
	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}
	public int getPmenu() {
		return pmenu;
	}
	public void setPmenu(int pmenu) {
		this.pmenu = pmenu;
	}
	public int getImenu() {
		return imenu;
	}
	public void setImenu(int imenu) {
		this.imenu = imenu;
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
	public String getDelegation() {
		return delegation;
	}
	public void setDelegation(String delegation) {
		this.delegation = delegation;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
}
