package com.mega.ITMS.financialMng.request;

import java.sql.Timestamp;
import java.util.Date;

public class RequestDTO {
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


	@Override
	public String toString() {
		return "RequestDTO [id=" + id + ", com_id=" + com_id + ", basic_id=" + basic_id + ", request_id=" + request_id
				+ ", response_id=" + response_id + ", cb_id=" + cb_id + ", detail_cb_id=" + detail_cb_id
				+ ", issued_date=" + issued_date + ", amount_usd=" + amount_usd + ", amount_krw=" + amount_krw
				+ ", note=" + note + ", receive_date=" + receive_date + "]";
	}
	
	
}