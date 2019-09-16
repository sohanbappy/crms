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
public class CarInfo {
    
    private int id;
    private String car_id;
    private String car_model;
    private String c_lic_no;
    private String c_eng_no;
    private String pic_name;
    private String picture;
    private String rent_type;
    private String category;
    private String p_day;
    private String p_hr;

    
    
     public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRent_type() {
        return rent_type;
    }

    public void setRent_type(String rent_type) {
        this.rent_type = rent_type;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
    
    public String getCar_id() {
        return car_id;
    }

    public void setCar_id(String car_id) {
        this.car_id = car_id;
    }

    public String getCar_model() {
        return car_model;
    }

    public void setCar_model(String car_model) {
        this.car_model = car_model;
    }

    public String getC_lic_no() {
        return c_lic_no;
    }

    public void setC_lic_no(String c_lic_no) {
        this.c_lic_no = c_lic_no;
    }

    public String getC_eng_no() {
        return c_eng_no;
    }

    public void setC_eng_no(String c_eng_no) {
        this.c_eng_no = c_eng_no;
    }

    public String getPic_name() {
        return pic_name;
    }

    public void setPic_name(String pic_name) {
        this.pic_name = pic_name;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getP_day() {
        return p_day;
    }

    public void setP_day(String p_day) {
        this.p_day = p_day;
    }

    public String getP_hr() {
        return p_hr;
    }

    public void setP_hr(String p_hr) {
        this.p_hr = p_hr;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    private String status;
}
