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
public class BikeInfo {
    
    private int id;
    private String bike_id;
    private String bike_model;
    private String b_lic_no;
    private String b_eng_no;
    private String category;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBike_id() {
        return bike_id;
    }

    public void setBike_id(String bike_id) {
        this.bike_id = bike_id;
    }

    public String getBike_model() {
        return bike_model;
    }

    public void setBike_model(String bike_model) {
        this.bike_model = bike_model;
    }

    public String getB_lic_no() {
        return b_lic_no;
    }

    public void setB_lic_no(String b_lic_no) {
        this.b_lic_no = b_lic_no;
    }

    public String getB_eng_no() {
        return b_eng_no;
    }

    public void setB_eng_no(String b_eng_no) {
        this.b_eng_no = b_eng_no;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    private String pic_name;
    private String picture;
    private String p_day;
    private String status;
}
