package com.mega.ITMS.report.tradeRecord;

import java.util.Date;

public class TradeRecordDto {
    private String customer;
    private Date  issued_date;
    private String po_num;
    private String p_name;
    private String p_spec;
    private int qty;
    private int unit_price;
    private int total;
    private Date close_date;
    private String notes;

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public Date getIssued_date() {
        return issued_date;
    }

    public void setIssued_date(Date issued_date) {
        this.issued_date = issued_date;
    }

    public String getPo_num() {
        return po_num;
    }

    public void setPo_num(String po_num) {
        this.po_num = po_num;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_spec() {
        return p_spec;
    }

    public void setP_spec(String p_spec) {
        this.p_spec = p_spec;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public int getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(int unit_price) {
        this.unit_price = unit_price;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Date getClose_date() {
        return close_date;
    }

    public void setClose_date(Date close_date) {
        this.close_date = close_date;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
