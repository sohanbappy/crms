package dao;


import connection.dbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import models.BikeInfo;



public class BikeInfoDao {
    
      
    

	public static int saveBikeInfo(BikeInfo c) {
		int status = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" insert into bike_info_tb (bike_id,bike_model,b_lic_no,b_eng_no,category,pic_name,picture,p_day,status) values (?,?,?,?,?,?,?,?,?)" );
			
                        
                        ps.setString(1, c.getBike_id());
                        ps.setString(2, c.getBike_model());
                        ps.setString(3, c.getB_lic_no());
                        ps.setString(4, c.getB_eng_no());
                        ps.setString(5, c.getCategory());
                        ps.setString(6, c.getPic_name());
                        ps.setString(7, c.getPicture());
                        ps.setString(8, c.getP_day());
                        ps.setString(9, c.getStatus());

			status = ps.executeUpdate();

			con.close();
		      }    catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

                public static int updateBikeInfo(String sql) {
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

        
        
	public static int deleteBikeInfo(int id) {
		int res = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" Delete from bike_info_tb where id= ? " );
			ps.setInt(1, id);
                        
			res = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public static BikeInfo getBikeInfoById(int id) {
		
            BikeInfo c = new BikeInfo();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from bike_info_tb where id=? ");
			ps.setInt(1, id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				c.setId(rs.getInt(1));
				c.setBike_id(rs.getString(2));
                                c.setBike_model(rs.getString(3));
                                c.setB_lic_no(rs.getString(4));
                                c.setB_eng_no(rs.getString(5));
                                 c.setCategory(rs.getString(6));
                                c.setPic_name(rs.getString(7));
                                c.setPicture(rs.getString(8));
                                c.setP_day(rs.getString(9));
                                c.setStatus(rs.getString(10));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return c;
	}

            public static BikeInfo getBikeInfoByBikeId(String bike_id) {
		
            BikeInfo c = new BikeInfo();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from bike_info_tb where bike_id=? ");
			ps.setString(1, bike_id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				c.setId(rs.getInt(1));
				c.setBike_id(rs.getString(2));
                                c.setBike_model(rs.getString(3));
                                c.setB_lic_no(rs.getString(4));
                                c.setB_eng_no(rs.getString(5));
                                 c.setCategory(rs.getString(6));
                                c.setPic_name(rs.getString(7));
                                c.setPicture(rs.getString(8));
                                c.setP_day(rs.getString(9));
                                c.setStatus(rs.getString(10));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return c;
	}
            
	public static List<BikeInfo> getAllMembersByModel(String model) {
		List<BikeInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from bike_info_tb WHERE bike_model LIKE '%"+model+"%' ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BikeInfo c = new BikeInfo();
                                
				c.setId(rs.getInt(1));
				c.setBike_id(rs.getString(2));
                                c.setBike_model(rs.getString(3));
                                c.setB_lic_no(rs.getString(4));
                                c.setB_eng_no(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setPic_name(rs.getString(7));
                                c.setPicture(rs.getString(8));
                                c.setP_day(rs.getString(9));
                                c.setStatus(rs.getString(10));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	} 
            
            
            
            
        
        
        
	public static List<BikeInfo> getAllMembers() {
		List<BikeInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from bike_info_tb ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BikeInfo c = new BikeInfo();
                                
				c.setId(rs.getInt(1));
				c.setBike_id(rs.getString(2));
                                c.setBike_model(rs.getString(3));
                                c.setB_lic_no(rs.getString(4));
                                c.setB_eng_no(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setPic_name(rs.getString(7));
                                c.setPicture(rs.getString(8));
                                c.setP_day(rs.getString(9));
                                c.setStatus(rs.getString(10));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<BikeInfo> getAllAvailableMembers() {
		List<BikeInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from bike_info_tb where status='available' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BikeInfo c = new BikeInfo();
                                
				c.setId(rs.getInt(1));
				c.setBike_id(rs.getString(2));
                                c.setBike_model(rs.getString(3));
                                c.setB_lic_no(rs.getString(4));
                                c.setB_eng_no(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setPic_name(rs.getString(7));
                                c.setPicture(rs.getString(8));
                                c.setP_day(rs.getString(9));
                                c.setStatus(rs.getString(10));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        
        public static List<BikeInfo> getAllGaragedMembers() {
		List<BikeInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from bike_info_tb WHERE status='garaged' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BikeInfo c = new BikeInfo();
                                
				c.setId(rs.getInt(1));
				c.setBike_id(rs.getString(2));
                                c.setBike_model(rs.getString(3));
                                c.setB_lic_no(rs.getString(4));
                                c.setB_eng_no(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setPic_name(rs.getString(7));
                                c.setPicture(rs.getString(8));
                                c.setP_day(rs.getString(9));
                                c.setStatus(rs.getString(10));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<BikeInfo> getMemberByBikeId(String bid) {
		List<BikeInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from bike_info_tb WHERE bike_id='"+bid+"' ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BikeInfo c = new BikeInfo();
                                
				c.setId(rs.getInt(1));
				c.setBike_id(rs.getString(2));
                                c.setBike_model(rs.getString(3));
                                c.setB_lic_no(rs.getString(4));
                                c.setB_eng_no(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setPic_name(rs.getString(7));
                                c.setPicture(rs.getString(8));
                                c.setP_day(rs.getString(9));
                                c.setStatus(rs.getString(10));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        
        
        public static int countBike(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT COUNT(*) AS count FROM bike_info_tb ");
                     while(rs.next()){
                         num = rs.getInt("count");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
}