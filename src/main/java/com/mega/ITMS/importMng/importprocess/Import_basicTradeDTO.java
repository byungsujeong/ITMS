package com.mega.ITMS.importMng.importprocess;

public class Import_basicTradeDTO {
	private String user_id, doc_no, notes;
	private int id, com_id, b_id, c_id, type_tr;
	private String issued_date, required_date, closed_date;
	
	
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
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	@Override
	public String toString() {
		return "Import_basicTradeDTO [user_id=" + user_id + ", doc_no=" + doc_no + ", notes=" + notes + ", id=" + id
				+ ", com_id=" + com_id + ", b_id=" + b_id + ", c_id=" + c_id + ", type_tr=" + type_tr + ", issued_date="
				+ issued_date + ", required_date=" + required_date + ", closed_date=" + closed_date
				+ ", getIssued_date()=" + getIssued_date() + ", getRequired_date()=" + getRequired_date()
				+ ", getClosed_date()=" + getClosed_date() + ", getUser_id()=" + getUser_id() + ", getDoc_no()="
				+ getDoc_no() + ", getNotes()=" + getNotes() + ", getId()=" + getId() + ", getCom_id()=" + getCom_id()
				+ ", getB_id()=" + getB_id() + ", getC_id()=" + getC_id() + ", getType_tr()=" + getType_tr()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
 