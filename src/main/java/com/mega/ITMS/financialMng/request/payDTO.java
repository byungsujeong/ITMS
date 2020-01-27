package com.mega.ITMS.financialMng.request;

public class payDTO {
	int id;
	int com_id;
	int basic_id;
	String request_id;
	String response_id;
	int cb_id;
	int detail_cb_id;
	String issued_date;
	int amount_usd;
	int amount_krw;
	String note;
	String receive_date;
	String doc_no, name ,c_key, c_value;
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
	public int getBasic_id() {
		return basic_id;
	}
	public void setBasic_id(int basic_id) {
		this.basic_id = basic_id;
	}
	public String getRequest_id() {
		return request_id;
	}
	public void setRequest_id(String request_id) {
		this.request_id = request_id;
	}
	public String getResponse_id() {
		return response_id;
	}
	public void setResponse_id(String response_id) {
		this.response_id = response_id;
	}
	public int getCb_id() {
		return cb_id;
	}
	public void setCb_id(int cb_id) {
		this.cb_id = cb_id;
	}
	public int getDetail_cb_id() {
		return detail_cb_id;
	}
	public void setDetail_cb_id(int detail_cb_id) {
		this.detail_cb_id = detail_cb_id;
	}
	public String getIssued_date() {
		return issued_date;
	}
	public void setIssued_date(String issued_date) {
		this.issued_date = issued_date;
	}
	public int getAmount_usd() {
		return amount_usd;
	}
	public void setAmount_usd(int amount_usd) {
		this.amount_usd = amount_usd;
	}
	public int getAmount_krw() {
		return amount_krw;
	}
	public void setAmount_krw(int amount_krw) {
		this.amount_krw = amount_krw;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getReceive_date() {
		return receive_date;
	}
	public void setReceive_date(String receive_date) {
		this.receive_date = receive_date;
	}
	public String getDoc_no() {
		return doc_no;
	}
	public void setDoc_no(String doc_no) {
		this.doc_no = doc_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	
	@Override
	public String toString() {
		return "fr_bt_com_cusDTO [id=" + id + ", com_id=" + com_id + ", basic_id=" + basic_id + ", request_id="
				+ request_id + ", response_id=" + response_id + ", cb_id=" + cb_id + ", detail_cb_id=" + detail_cb_id
				+ ", issued_date=" + issued_date + ", amount_usd=" + amount_usd + ", amount_krw=" + amount_krw
				+ ", note=" + note + ", receive_date=" + receive_date + ", doc_no=" + doc_no + ", name=" + name
				+ ", c_key=" + c_key + ", c_value=" + c_value + "]";
	}
	
	
}
