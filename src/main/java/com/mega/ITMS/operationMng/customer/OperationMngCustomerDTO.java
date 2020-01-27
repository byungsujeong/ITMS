package com.mega.ITMS.operationMng.customer;

import java.sql.Timestamp;

public class OperationMngCustomerDTO {
	
	// 멤버 변수
	int id; // 고유번호
	int b_id; // 업체 아이디
	int com_id; // 회사 아이디
	String name; // 담당자명
	String tel; // 담당자 연락처
	String c_key; // 비고-키
	String c_value; // 비고-값
	Timestamp date; // 입력일자
	
	// 기본 생성자
	public OperationMngCustomerDTO() {
	}

	// 파라메터 생성자
	public OperationMngCustomerDTO(int id, int b_id, int com_id, String name, String tel, String c_key, String c_value,
			Timestamp date) {
		super();
		this.id = id;
		this.b_id = b_id;
		this.com_id = com_id;
		this.name = name;
		this.tel = tel;
		this.c_key = c_key;
		this.c_value = c_value;
		this.date = date;
	}

	// get/set 메서드
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

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	// toString
	@Override
	public String toString() {
		return "OperationMngCustomerDTO [id=" + id + ", b_id=" + b_id + ", com_id=" + com_id + ", name=" + name
				+ ", tel=" + tel + ", c_key=" + c_key + ", c_value=" + c_value + ", date=" + date + "]";
	}
	
	
	
	
	
}
