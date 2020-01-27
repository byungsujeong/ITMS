package com.mega.ITMS.importMng.importprocess;

public class Import_customerDTO {
	private String name, tel, c_key, c_value,date;
	private int id, b_id, com_id;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
	public String getC_key() {
		return c_key;
	}
	public void setC_key(String c_key) {
		this.c_key = c_key;
	}
	public String getC_value() {
		return c_value;
	}
	public void setC_value(String c_value) {
		this.c_value = c_value;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getCom_id() {
		return com_id;
	}
	public void setCom_id(int com_id) {
		this.com_id = com_id;
	}
	@Override
	public String toString() {
		return "Import_customerDTO [name=" + name + ", tel=" + tel + ", c_key=" + c_key + ", c_value=" + c_value
				+ ", date=" + date + ", id=" + id + ", b_id=" + b_id + ", com_id=" + com_id + "]";
	}
	
	
	
}
