package com.mega.ITMS.report.monthly;

public class SumMonthlyDto {
    private int payment;
    private int customs;
    private int logistical_cost;
    private int domestic_logistical_cost;
    private int others;
    private int import_total;
    private int manage_total;

    public int getImport_total() {
        return import_total;
    }

    public void setImport_total(int import_total) {
        this.import_total = import_total;
    }

    public int getManage_total() {
        return manage_total;
    }

    public void setManage_total(int manage_total) {
        this.manage_total = manage_total;
    }

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }

    public int getCustoms() {
        return customs;
    }

    public void setCustoms(int customs) {
        this.customs = customs;
    }

    public int getLogistical_cost() {
        return logistical_cost;
    }

    public void setLogistical_cost(int logistical_cost) {
        this.logistical_cost = logistical_cost;
    }

    public int getDomestic_logistical_cost() {
        return domestic_logistical_cost;
    }

    public void setDomestic_logistical_cost(int domestic_logistical_cost) {
        this.domestic_logistical_cost = domestic_logistical_cost;
    }

    public int getOthers() {
        return others;
    }

    public void setOthers(int others) {
        this.others = others;
    }
}
