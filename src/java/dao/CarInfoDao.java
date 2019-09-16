package dao;


import connection.dbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import models.CarInfo;



public class CarInfoDao {
    
      
    

	public static int saveCarInfo(CarInfo c) {
		int status = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" insert into car_info_tb (car_id,car_model,c_lic_no,c_eng_no,pic_name,picture,rent_type,category,p_day,p_hr,status) values (?,?,?,?,?,?,?,?,?,?,?)" );
			
                        
                        ps.setString(1, c.getCar_id());
                        ps.setString(2, c.getCar_model());
                        ps.setString(3, c.getC_lic_no());
                        ps.setString(4, c.getC_eng_no());
                        ps.setString(5, c.getPic_name());
                        ps.setString(6, c.getPicture());
                        ps.setString(7, c.getRent_type());
                        ps.setString(8, c.getCategory());
                        ps.setString(9, c.getP_day());
                        ps.setString(10, c.getP_hr());
                        ps.setString(11, c.getStatus());

			status = ps.executeUpdate();

			con.close();
		      }    catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

                public static int updateCarInfo(String sql) {
                    int st = 0;
                    try {
			Connection con = dbConfig.getConnection();
			Statement stmt=con.createStatement();
                       st= stmt.executeUpdate(sql);
                        
			con.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return st;
	}

        
        
	public static int deleteCarInfo(int id) {
		int res = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" Delete from car_info_tb where id= ? " );
			ps.setInt(1, id);
                        
			res = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public static CarInfo getCarInfoById(int id) {
		
            CarInfo c = new CarInfo();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from car_info_tb where id=? ");
			ps.setInt(1, id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				c.setId(rs.getInt(1));
				c.setCar_id(rs.getString(2));
                                c.setCar_model(rs.getString(3));
                                c.setC_lic_no(rs.getString(4));
                                c.setC_eng_no(rs.getString(5));
                                c.setPic_name(rs.getString(6));
                                c.setPicture(rs.getString(7));
                                c.setRent_type(rs.getString(8));
                                c.setCategory(rs.getString(9));
                                c.setP_day(rs.getString(10));
                                c.setP_hr(rs.getString(11));
                                c.setStatus(rs.getString(12));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return c;
	}
        
        public static CarInfo getCarInfoByCarId(String cid) {
		
            CarInfo c = new CarInfo();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from car_info_tb where car_id=? ");
			ps.setString(1, cid);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				c.setId(rs.getInt(1));
				c.setCar_id(rs.getString(2));
                                c.setCar_model(rs.getString(3));
                                c.setC_lic_no(rs.getString(4));
                                c.setC_eng_no(rs.getString(5));
                                c.setPic_name(rs.getString(6));
                                c.setPicture(rs.getString(7));
                                c.setRent_type(rs.getString(8));
                                c.setCategory(rs.getString(9));
                                c.setP_day(rs.getString(10));
                                c.setP_hr(rs.getString(11));
                                c.setStatus(rs.getString(12));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return c;
	}
        
        
        

	public static List<CarInfo> getAllMembers() {
		List<CarInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from car_info_tb ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CarInfo c = new CarInfo();
                                
				c.setId(rs.getInt(1));
				c.setCar_id(rs.getString(2));
                                c.setCar_model(rs.getString(3));
                                c.setC_lic_no(rs.getString(4));
                                c.setC_eng_no(rs.getString(5));
                                c.setPic_name(rs.getString(6));
                                c.setPicture(rs.getString(7));
                                c.setRent_type(rs.getString(8));
                                c.setCategory(rs.getString(9));
                                c.setP_day(rs.getString(10));
                                c.setP_hr(rs.getString(11));
                                c.setStatus(rs.getString(12));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<CarInfo> getAllAvailableMembers() {
		List<CarInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from car_info_tb where status='available' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CarInfo c = new CarInfo();
                                
				c.setId(rs.getInt(1));
				c.setCar_id(rs.getString(2));
                                c.setCar_model(rs.getString(3));
                                c.setC_lic_no(rs.getString(4));
                                c.setC_eng_no(rs.getString(5));
                                c.setPic_name(rs.getString(6));
                                c.setPicture(rs.getString(7));
                                c.setRent_type(rs.getString(8));
                                c.setCategory(rs.getString(9));
                                c.setP_day(rs.getString(10));
                                c.setP_hr(rs.getString(11));
                                c.setStatus(rs.getString(12));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<CarInfo> getAllGaragedMembers() {
		List<CarInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from car_info_tb WHERE status='garaged' ORDER BY id DESC  ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CarInfo c = new CarInfo();
                                
				c.setId(rs.getInt(1));
				c.setCar_id(rs.getString(2));
                                c.setCar_model(rs.getString(3));
                                c.setC_lic_no(rs.getString(4));
                                c.setC_eng_no(rs.getString(5));
                                c.setPic_name(rs.getString(6));
                                c.setPicture(rs.getString(7));
                                c.setRent_type(rs.getString(8));
                                c.setCategory(rs.getString(9));
                                c.setP_day(rs.getString(10));
                                c.setP_hr(rs.getString(11));
                                c.setStatus(rs.getString(12));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        public static List<CarInfo> getMemberByCarId(String cid) {
		List<CarInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from car_info_tb WHERE car_id='"+cid+"' ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CarInfo c = new CarInfo();
                                
				c.setId(rs.getInt(1));
				c.setCar_id(rs.getString(2));
                                c.setCar_model(rs.getString(3));
                                c.setC_lic_no(rs.getString(4));
                                c.setC_eng_no(rs.getString(5));
                                c.setPic_name(rs.getString(6));
                                c.setPicture(rs.getString(7));
                                c.setRent_type(rs.getString(8));
                                c.setCategory(rs.getString(9));
                                c.setP_day(rs.getString(10));
                                c.setP_hr(rs.getString(11));
                                c.setStatus(rs.getString(12));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static int countCar(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT COUNT(*) AS count FROM car_info_tb ");
                     while(rs.next()){
                         num = rs.getInt("count");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
}