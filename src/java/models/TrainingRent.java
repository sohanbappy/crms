/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author Bappy
 */
public class TrainingRent {
    
    private int id;
    private String rent_id;
    private String uid;
    private String tr_id;
    private String tx_id;
    private String request_time;
    private String total;
    private String advance;
    private String due;
    private String comments;
    private String status;
    private String confirmed_by;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
      public String getRent_id() {
        return rent_id;
    }

    public void setRent_id(String rent_id) {
        this.rent_id = rent_id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getTr_id() {
        return tr_id;
    }

    public void setTr_id(String tr_id) {
        this.tr_id = tr_id;
    }

    
   
    public String getTx_id() {
        return tx_id;
    }

    public void setTx_id(String tx_id) {
        this.tx_id = tx_id;
    } 

    @Override
    public String toString() {
        return "TrainingRent{" + "id=" + id + ", rent_id=" + rent_id + ", uid=" + uid + ", tr_id=" + tr_id + ", tx_id=" + tx_id + ", request_time=" + request_time + ", total=" + total + ", advance=" + advance + ", due=" + due + ", comments=" + comments + ", status=" + status + ", confirmed_by=" + confirmed_by + '}';
    }
    
    public String getRequest_time() {
        return request_time;
    }

    public void setRequest_time(String request_time) {
        this.request_time = request_time;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getAdvance() {
        return advance;
    }

    public void setAdvance(String advance) {
        this.advance = advance;
    }

    public String getDue() {
        return due;
    }

    public void setDue(String due) {
        this.due = due;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getConfirmed_by() {
        return confirmed_by;
    }

    public void setConfirmed_by(String confirmed_by) {
        this.confirmed_by = confirmed_by;
    }
    
}
