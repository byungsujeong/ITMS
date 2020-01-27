package com.mega.ITMS.importMng.importprocess;

public class Import_orderDetailDTO {

	private int id, basic_id, p_id, qty;

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

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "Import_orderDetailDTO [id=" + id + ", basic_id=" + basic_id + ", p_id=" + p_id + ", qty=" + qty + "]";
	}
	
	
}
