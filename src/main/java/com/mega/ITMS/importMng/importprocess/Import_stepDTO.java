package com.mega.ITMS.importMng.importprocess;

public class Import_stepDTO {
	private int trade_id, basic_id, type_file, com_id, b_id, c_id, type_tr;
	private String file_name, user_id, doc_no, issued_date, required_date, closed_date, notes;
	public int getTrade_id() {
		return trade_id;
	}
	public void setTrade_id(int trade_id) {
		this.trade_id = trade_id;
	}
	public int getBasic_id() {
		return basic_id;
	}
	public void setBasic_id(int basic_id) {
		this.basic_id = basic_id;
	}
	public int getType_file() {
		return type_file;
	}
	public void setType_file(int type_file) {
		this.type_file = type_file;
	}
	public int getCom_id() {
		return com_id;
	}
	public void setCom_id(int com_id) {
		this.com_id = com_id;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getType_tr() {
		return type_tr;
	}
	public void setType_tr(int type_tr) {
		this.type_tr = type_tr;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDoc_no() {
		return doc_no;
	}
	public void setDoc_no(String doc_no) {
		this.doc_no = doc_no;
	}
	public String getIssued_date() {
		return issued_date;
	}
	public void setIssued_date(String issued_date) {
		this.issued_date = issued_date;
	}
	public String getRequired_date() {
		return required_date;
	}
	public void setRequired_date(String required_date) {
		this.required_date = required_date;
	}
	public String getClosed_date() {
		return closed_date;
	}
	public void setClosed_date(String closed_date) {
		this.closed_date = closed_date;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	@Override
	public String toString() {
		return "Import_stepDTO [trade_id=" + trade_id + ", basic_id=" + basic_id + ", type_file=" + type_file + ", com_id=" + com_id
				+ ", b_id=" + b_id + ", c_id=" + c_id + ", type_tr=" + type_tr + ", file_name=" + file_name
				+ ", user_id=" + user_id + ", doc_no=" + doc_no + ", issued_date=" + issued_date + ", required_date="
				+ required_date + ", closed_date=" + closed_date + ", notes=" + notes + "]";
	}
	
	
	
}
