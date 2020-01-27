package com.mega.ITMS.importMng.importprocess;

public class Import_financeRequestDTO {
	private int id, com_id, basic_id, cb_id, detail_cb_id, amount_krw;
	private String request_id, response_id, issued_date, note, receive_date;
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
	public int getAmount_krw() {
		return amount_krw;
	}
	public void setAmount_krw(int amount_krw) {
		this.amount_krw = amount_krw;
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
	public String getIssued_date() {
		return issued_date;
	}
	public void setIssued_date(String issued_date) {
		this.issued_date = issued_date;
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
	@Override
	public String toString() {
		return "import_financeRequestDTO [id=" + id + ", com_id=" + com_id + ", basic_id=" + basic_id + ", cb_id="
				+ cb_id + ", detail_cb_id=" + detail_cb_id + ", amount_krw=" + amount_krw + ", request_id=" + request_id
				+ ", response_id=" + response_id + ", issued_date=" + issued_date + ", note=" + note + ", receive_date="
				+ receive_date + ", getId()=" + getId() + ", getCom_id()=" + getCom_id() + ", getBasic_id()="
				+ getBasic_id() + ", getCb_id()=" + getCb_id() + ", getDetail_cb_id()=" + getDetail_cb_id()
				+ ", getAmount_krw()=" + getAmount_krw() + ", getRequest_id()=" + getRequest_id()
				+ ", getResponse_id()=" + getResponse_id() + ", getIssued_date()=" + getIssued_date() + ", getNote()="
				+ getNote() + ", getReceive_date()=" + getReceive_date() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
