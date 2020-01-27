package com.mega.ITMS.operationMng.product;

import java.sql.Timestamp;

public class OperationMngProductDTO {

	// 멤버 변수
	int id; // 고유번호
	int com_id; // 회사 아이디
	String code; // 제품 코드
	String name; // 제품명
	String spec; // 제품 상세
	int price; // 제품 단가
	Timestamp date; // 입력일자

	// 기본 생성자
	public OperationMngProductDTO() {
	}

	// 파라메터 생성자
	public OperationMngProductDTO(int id, int com_id, String code, String name, String spec, int price,
			Timestamp date) {
		super();
		this.id = id;
		this.com_id = com_id;
		this.code = code;
		this.name = name;
		this.spec = spec;
		this.price = price;
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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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
		return "OperationMngProductDTO [id=" + id + ", com_id=" + com_id + ", code=" + code + ", name=" + name
				+ ", spec=" + spec + ", price=" + price + ", date=" + date + "]";
	}
	
	
	
	
	
	
}
