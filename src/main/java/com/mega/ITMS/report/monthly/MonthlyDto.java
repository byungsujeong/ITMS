package com.mega.ITMS.report.monthly;

import java.util.Date;

public class MonthlyDto {
    private int action_type;
    private String item;
    private int amount_usd;
    private int amount_krw;
    private int amount_hdc;
    private Date closed_date;


    public int getAction_type() {

        return action_type;
    }

    public void setAction_type(int action_type) {

        this.action_type = action_type;
    }

    public String getItem() {

        return item;
    }

    public void setItem(String item) {

        this.item = item;
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

    public int getAmount_hdc() {

        return amount_hdc;
    }

    public void setAmount_hdc(int amount_hdc) {

        this.amount_hdc = amount_hdc;
    }

    public Date getClosed_date() {

        return closed_date;
    }

    public void setClosed_date(Date closed_date) {

        this.closed_date = closed_date;
    }
}
