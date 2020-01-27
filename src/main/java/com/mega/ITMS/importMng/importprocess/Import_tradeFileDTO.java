package com.mega.ITMS.importMng.importprocess;

public class Import_tradeFileDTO {
	private String file_name, issued_date;
	private int id, basic_id, type_file;
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getIssued_date() {
		return issued_date;
	}
	public void setIssued_date(String issued_date) {
		this.issued_date = issued_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	@Override
	public String toString() {
		return "Import_tradeFileDTO [file_name=" + file_name + ", issued_date=" + issued_date + ", id=" + id
				+ ", basic_id=" + basic_id + ", type_file=" + type_file + "]";
	}
	
	
	
	
}
