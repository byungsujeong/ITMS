package com.mega.ITMS.financialMng.request;

public class IncomeDTO {
   String user_id, doc_no, notes;
   String note;
   String receive_date, name, acc, bank;
   int fq_id, com_id, b_id, c_id, type_tr;
   String fq_issued_date, required_date, closed_date;
   int basic_id, bs_id;
   String request_id;
   String response_id;
   int cb_id;
   int detail_cb_id;
   String basic_issued_date;
   int amount_usd;
   int amount_krw, action_type;

   public int getAction_type() {
      return action_type;
   }

   public void setAction_type(int action_type) {
      this.action_type = action_type;
   }

   public String getBank() {
      return bank;
   }

   public void setBank(String bank) {
      this.bank = bank;
   }


   public String getAcc() {
      return acc;
   }

   public void setAcc(String acc) {
      this.acc = acc;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public int getBs_id() {
      return bs_id;
   }

   public void setBs_id(int bs_id) {
      this.bs_id = bs_id;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public String getDoc_no() {
      return doc_no;
   }

   public void setDoc_no(String doc_no) {
      this.doc_no = doc_no;
   }

   public String getNotes() {
      return notes;
   }

   public void setNotes(String notes) {
      this.notes = notes;
   }

   public int getFq_id() {
      return fq_id;
   }

   public void setFq_id(int fq_id) {
      this.fq_id = fq_id;
   }

   public int getCom_id() {
      return com_id;
   }

   public void setCom_id(int com_id) {
      this.com_id = com_id;
   }

   public int getB_id() {
      return b_id;
   }

   public void setB_id(int b_id) {
      this.b_id = b_id;
   }

   public int getC_id() {
      return c_id;
   }

   public void setC_id(int c_id) {
      this.c_id = c_id;
   }

   public int getType_tr() {
      return type_tr;
   }

   public void setType_tr(int type_tr) {
      this.type_tr = type_tr;
   }

   public String getFq_issued_date() {
      return fq_issued_date;
   }

   public void setFq_issued_date(String fq_issued_date) {
      this.fq_issued_date = fq_issued_date;
   }

   public String getRequired_date() {
      return required_date;
   }

   public void setRequired_date(String required_date) {
      this.required_date = required_date;
   }

   public String getClosed_date() {
      return closed_date;
   }

   public void setClosed_date(String closed_date) {
      this.closed_date = closed_date;
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

   public String getBasic_issued_date() {
      return basic_issued_date;
   }

   public void setBasic_issued_date(String basic_issued_date) {
      this.basic_issued_date = basic_issued_date;
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
      return "IncomeDTO [user_id=" + user_id + ", doc_no=" + doc_no + ", notes=" + notes + ", fq_id=" + fq_id
            + ", com_id=" + com_id + ", b_id=" + b_id + ", c_id=" + c_id + ", type_tr=" + type_tr
            + ", fq_issued_date=" + fq_issued_date + ", required_date=" + required_date + ", closed_date="
            + closed_date + ", basic_id=" + basic_id + ", request_id=" + request_id + ", response_id=" + response_id
            + ", cb_id=" + cb_id + ", detail_cb_id=" + detail_cb_id + ", basic_issued_date=" + basic_issued_date
            + ", amount_usd=" + amount_usd + ", amount_krw=" + amount_krw + ", note=" + note + ", receive_date="
            + receive_date + "]";
   }

}