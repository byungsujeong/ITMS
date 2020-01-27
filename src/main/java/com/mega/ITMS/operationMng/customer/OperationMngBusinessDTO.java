package com.mega.ITMS.operationMng.customer;

import java.sql.Timestamp;

public class OperationMngBusinessDTO {

	// 멤버변수
	int id; // 업체코드
	int com_id; // 회사 아이디
	String type; // 구분
	String name; // 거래처명
	String ceo; // 대표자명
	String addr; // 회사 주소
	String tel; // 회사 전화번호
	int country_code; // 회사 국가번호
	Timestamp date; // 입력일자
	
	// 기본 생성자
	public OperationMngBusinessDTO() {
	}

	// 파라메터 생성자
	public OperationMngBusinessDTO(int id, int com_id, String type, String name, String ceo, String addr, String tel,
			int country_code, Timestamp date) {
		super();
		this.id = id;
		this.com_id = com_id;
		this.type = type;
		this.name = name;
		this.ceo = ceo;
		this.addr = addr;
		this.tel = tel;
		this.country_code = country_code;
		this.date = date;
	}

	// get/set 메서드
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getCountry_code() {
		return country_code;
	}

	public void setCountry_code(int country_code) {
		this.country_code = country_code;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	//toString
	@Override
	public String toString() {
		return "OperationMngBusinessDTO [id=" + id + ", com_id=" + com_id + ", type=" + type + ", name=" + name
				+ ", ceo=" + ceo + ", addr=" + addr + ", tel=" + tel + ", country_code=" + country_code + ", date="
				+ date + "]";
	}
	
	
	
}
