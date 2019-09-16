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
public class BikeRent {
    
    private int id;
    private String rent_id;
    private String uid;
    private String u_lic_no;
    private String g_nid;
    private String bike_id;
    private String b_lic_no;
    private String category;
    private String from_date;
    private String to_date;
    private String pick_point;
    private String drop_point;
    private String tx_id;
    private String total;
    private String advance;
    private String due;
    private String request_time;

    @Override
    public String toString() {
        return "BikeRent{" + "id=" + id + ", rent_id=" + rent_id + ", uid=" + uid + ", u_lic_no=" + u_lic_no + ", g_nid=" + g_nid + ", bike_id=" + bike_id + ", b_lic_no=" + b_lic_no + ", category=" + category + ", from_date=" + from_date + ", to_date=" + to_date + ", pick_point=" + pick_point + ", drop_point=" + drop_point + ", tx_id=" + tx_id + ", total=" + total + ", advance=" + advance + ", due=" + due + ", request_time=" + request_time + ", comments=" + comments + ", status=" + status + ", confirmed_by=" + confirmed_by + '}';
    }
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

    public String getU_lic_no() {
        return u_lic_no;
    }

    public void setU_lic_no(String u_lic_no) {
        this.u_lic_no = u_lic_no;
    }

    public String getG_nid() {
        return g_nid;
    }

    public void setG_nid(String g_nid) {
        this.g_nid = g_nid;
    }

    public String getBike_id() {
        return bike_id;
    }

    public void setBike_id(String bike_id) {
        this.bike_id = bike_id;
    }



    public String getB_lic_no() {
        return b_lic_no;
    }

    public void setB_lic_no(String b_lic_no) {
        this.b_lic_no = b_lic_no;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getFrom_date() {
        return from_date;
    }

    public void setFrom_date(String from_date) {
        this.from_date = from_date;
    }

    public String getTo_date() {
        return to_date;
    }

    public void setTo_date(String to_date) {
        this.to_date = to_date;
    }

    public String getPick_point() {
        return pick_point;
    }

    public void setPick_point(String pick_point) {
        this.pick_point = pick_point;
    }

    public String getDrop_point() {
        return drop_point;
    }

    public void setDrop_point(String drop_point) {
        this.drop_point = drop_point;
    }

    public String getTx_id() {
        return tx_id;
    }

    public void setTx_id(String tx_id) {
        this.tx_id = tx_id;
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

    public String getRequest_time() {
        return request_time;
    }

    public void setRequest_time(String request_time) {
        this.request_time = request_time;
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
