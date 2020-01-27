package com.mega.ITMS.operationMng.customer;

import java.sql.Timestamp;

//import java.sql.Timestamp;

// 거래처 관리 DTO - Join 테이블
public class OperationMngCustomerJoinDTO {

	// 멤버변수
	
	// Customer Table - a
	int a_id; // 코드번호
	int a_b_id; // 업체코드
	int a_com_id; // 회사 아이디
	String a_name; // 담당자명
	String a_tel; // 담당자 연락처
	String a_c_key; // 비고-키
	String a_c_value; // 비고-값
	Timestamp a_date; // 입력일자
	
	// Business Table - b
	int b_id; // 업체코드
	int b_com_id; // 회사 아이디
	String b_type; // 구분
	String b_name; // 거래처명
	String b_ceo; // 대표자명
	String b_addr; // 회사 주소
	String b_tel; // 회사 전화번호
	int b_country_code; // 회사 국가번호
	Timestamp b_date; // 입력일자
	

	// 기본 생성자
	public OperationMngCustomerJoinDTO() {
	}

	// 파라메터 생성자
	public OperationMngCustomerJoinDTO(int a_id, int a_b_id, int a_com_id, String a_name, String a_tel,
			String a_c_key, String a_c_value, Timestamp a_date, int b_id, int b_com_id, String b_type, String b_name,
			String b_ceo, String b_addr, String b_tel, int b_country_code, Timestamp b_date) {
		super();
		this.a_id = a_id;
		this.a_b_id = a_b_id;
		this.a_com_id = a_com_id;
		this.a_name = a_name;
		this.a_tel = a_tel;
		this.a_c_key = a_c_key;
		this.a_c_value = a_c_value;
		this.a_date = a_date;
		this.b_id = b_id;
		this.b_com_id = b_com_id;
		this.b_type = b_type;
		this.b_name = b_name;
		this.b_ceo = b_ceo;
		this.b_addr = b_addr;
		this.b_tel = b_tel;
		this.b_country_code = b_country_code;
		this.b_date = b_date;
	}

	// get/set 메서드
	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public int getA_b_id() {
		return a_b_id;
	}

	public void setA_b_id(int a_b_id) {
		this.a_b_id = a_b_id;
	}

	public int getA_com_id() {
		return a_com_id;
	}

	public void setA_com_id(int a_com_id) {
		this.a_com_id = a_com_id;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_tel() {
		return a_tel;
	}

	public void setA_tel(String a_tel) {
		this.a_tel = a_tel;
	}

	public String getA_c_key() {
		return a_c_key;
	}

	public void setA_c_key(String a_c_key) {
		this.a_c_key = a_c_key;
	}

	public String getA_c_value() {
		return a_c_value;
	}

	public void setA_c_value(String a_c_value) {
		this.a_c_value = a_c_value;
	}

	public Timestamp getA_date() {
		return a_date;
	}

	public void setA_date(Timestamp a_date) {
		this.a_date = a_date;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public int getB_com_id() {
		return b_com_id;
	}

	public void setB_com_id(int b_com_id) {
		this.b_com_id = b_com_id;
	}

	public String getB_type() {
		return b_type;
	}

	public void setB_type(String b_type) {
		this.b_type = b_type;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_ceo() {
		return b_ceo;
	}

	public void setB_ceo(String b_ceo) {
		this.b_ceo = b_ceo;
	}

	public String getB_addr() {
		return b_addr;
	}

	public void setB_addr(String b_addr) {
		this.b_addr = b_addr;
	}

	public String getB_tel() {
		return b_tel;
	}

	public void setB_tel(String b_tel) {
		this.b_tel = b_tel;
	}

	public int getB_country_code() {
		return b_country_code;
	}

	public void setB_country_code(int b_country_code) {
		this.b_country_code = b_country_code;
	}

	public Timestamp getB_date() {
		return b_date;
	}

	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}

	//toString
	@Override
	public String toString() {
		return "OperationMngCustomerJoinDTO [a_id=" + a_id + ", a_b_id=" + a_b_id + ", a_com_id=" + a_com_id
				+ ", a_name=" + a_name + ", a_tel=" + a_tel + ", a_c_key=" + a_c_key + ", a_c_value=" + a_c_value
				+ ", a_date=" + a_date + ", b_id=" + b_id + ", b_com_id=" + b_com_id + ", b_type=" + b_type
				+ ", b_name=" + b_name + ", b_ceo=" + b_ceo + ", b_addr=" + b_addr + ", b_tel=" + b_tel
				+ ", b_country_code=" + b_country_code + ", b_date=" + b_date + "]";
	}

	
}
