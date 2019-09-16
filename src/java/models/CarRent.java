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
public class CarRent {
    
    private int id;
    private String rent_id;

   
    private String car_id;
    private String car_lic_no;
    private String uid;
    private String category;
    private String rent_type;
    private String pick_point;
    private String drop_point;
    private String hr_date;
    private String hr_from;
    private String hr_to;
    private String day_from;
    private String day_to;
    private String tx_id;
    private String total;
    private String advance;
    private String due;
    private String request_time;
    private String comments;
    private String status;
    private String confirmed_by;
    
      public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAdvance() {
        return advance;
    }

    public void setAdvance(String advance) {
        this.advance = advance;
    }

    public String getRequest_time() {
        return request_time;
    }

    public void setRequest_time(String request_time) {
        this.request_time = request_time;
    }

    public String getConfirmed_by() {
        return confirmed_by;
    }

    public void setConfirmed_by(String confirmed_by) {
        this.confirmed_by = confirmed_by;
    }
   
    
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

    public String getCar_id() {
        return car_id;
    }

    public void setCar_id(String car_id) {
        this.car_id = car_id;
    }

    public String getCar_lic_no() {
        return car_lic_no;
    }

    public void setCar_lic_no(String car_lic_no) {
        this.car_lic_no = car_lic_no;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getRent_type() {
        return rent_type;
    }

    public void setRent_type(String rent_type) {
        this.rent_type = rent_type;
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

    public String getHr_date() {
        return hr_date;
    }

    public void setHr_date(String hr_date) {
        this.hr_date = hr_date;
    }

    public String getHr_from() {
        return hr_from;
    }

    public void setHr_from(String hr_from) {
        this.hr_from = hr_from;
    }

    public String getHr_to() {
        return hr_to;
    }

    public void setHr_to(String hr_to) {
        this.hr_to = hr_to;
    }

    public String getDay_from() {
        return day_from;
    }

    public void setDay_from(String day_from) {
        this.day_from = day_from;
    }

    public String getDay_to() {
        return day_to;
    }

    public void setDay_to(String day_to) {
        this.day_to = day_to;
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
            
    
}
