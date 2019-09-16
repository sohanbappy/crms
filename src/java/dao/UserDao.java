package dao;


import connection.dbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import models.User;



public class UserDao {
    
      
    

	public static int saveUser(User e) {
		int status = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" insert into user_tb (name,phone,mail,address,nat,nid_no,passport_no,pic_name,picture,uid,pass,status) values (?,?,?,?,?,?,?,?,?,?,?,?)" );
			
                        
                        ps.setString(1, e.getName());
                        ps.setString(2, e.getPhone());
                        ps.setString(3, e.getMail());
                        ps.setString(4, e.getAddress());
                        ps.setString(5, e.getNat());
                        ps.setString(6, e.getNid_no());
                        ps.setString(7, e.getPassport_no());
                        ps.setString(8, e.getPic_name());
                        ps.setString(9, e.getPicture());
                        ps.setString(10, e.getUid());
                        ps.setString(11, e.getPass());
                        ps.setString(12, e.getStatus());

			status = ps.executeUpdate();

			con.close();
		      }    catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

                public static int updateUser(String sql) {
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

        
        
	public static int deleteUser(int id) {
		int res = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" Delete from user_tb where id= ? " );
			ps.setInt(1, id);
                        
			res = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public static User getUserById(int id) {
		
            User e = new User();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from user_tb where id=? ");
			ps.setInt(1, id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				e.setId(rs.getInt(1));
				e.setName(rs.getString(2));
                                e.setPhone(rs.getString(3));
                                e.setMail(rs.getString(4));
                                e.setAddress(rs.getString(5));
                                e.setNat(rs.getString(6));
                                e.setNid_no(rs.getString(7));
                                e.setPassport_no(rs.getString(8));
                                e.setPic_name(rs.getString(9));
                                e.setPicture(rs.getString(10));
                                e.setUid(rs.getString(11));
                                e.setPass(rs.getString(12));
                                e.setStatus(rs.getString(13));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

        public static User getUserByUid(String uid) {
		
            User e = new User();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from user_tb where uid=? ");
			ps.setString(1, uid);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				e.setId(rs.getInt(1));
				e.setName(rs.getString(2));
                                e.setPhone(rs.getString(3));
                                e.setMail(rs.getString(4));
                                e.setAddress(rs.getString(5));
                                e.setNat(rs.getString(6));
                                e.setNid_no(rs.getString(7));
                                e.setPassport_no(rs.getString(8));
                                e.setPic_name(rs.getString(9));
                                e.setPicture(rs.getString(10));
                                e.setUid(rs.getString(11));
                                e.setPass(rs.getString(12));
                                e.setStatus(rs.getString(13));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

        
        
	public static List<User> getAllMembers() {
		List<User> list = new ArrayList<User>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from user_tb ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User e = new User();
                                
				e.setId(rs.getInt(1));
				e.setName(rs.getString(2));
                                e.setPhone(rs.getString(3));
                                e.setMail(rs.getString(4));
                                e.setAddress(rs.getString(5));
                                e.setNat(rs.getString(6));
                                e.setNid_no(rs.getString(7));
                                e.setPassport_no(rs.getString(8));
                                e.setPic_name(rs.getString(9));
                                e.setPicture(rs.getString(10));
                                e.setUid(rs.getString(11));
                                e.setPass(rs.getString(12));
                                e.setStatus(rs.getString(13));
                                
                                list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
                
                
	}
        
                
	public static List<User> getAllPendingMembers() {
		List<User> list = new ArrayList<User>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from user_tb WHERE status='Pending' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User e = new User();
                                
				e.setId(rs.getInt(1));
				e.setName(rs.getString(2));
                                e.setPhone(rs.getString(3));
                                e.setMail(rs.getString(4));
                                e.setAddress(rs.getString(5));
                                e.setNat(rs.getString(6));
                                e.setNid_no(rs.getString(7));
                                e.setPassport_no(rs.getString(8));
                                e.setPic_name(rs.getString(9));
                                e.setPicture(rs.getString(10));
                                e.setUid(rs.getString(11));
                                e.setPass(rs.getString(12));
                                e.setStatus(rs.getString(13));
                                
                                list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
                
                
	}
        
        
        public static List<User> getMemberByUid(String uid) {
		List<User> list = new ArrayList<User>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from user_tb WHERE uid='"+uid+"' ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User e = new User();
                                
				e.setId(rs.getInt(1));
				e.setName(rs.getString(2));
                                e.setPhone(rs.getString(3));
                                e.setMail(rs.getString(4));
                                e.setAddress(rs.getString(5));
                                e.setNat(rs.getString(6));
                                e.setNid_no(rs.getString(7));
                                e.setPassport_no(rs.getString(8));
                                e.setPic_name(rs.getString(9));
                                e.setPicture(rs.getString(10));
                                e.setUid(rs.getString(11));
                                e.setPass(rs.getString(12));
                                e.setStatus(rs.getString(13));
                                
                                list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
                
                
	}
        
        
        
        
        
        
        
                public static int countUser(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT COUNT(*) AS count FROM user_tb ");
                     while(rs.next()){
                         num = rs.getInt("count");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
                
                public static int countPendingUser(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT COUNT(*) AS count FROM user_tb WHERE status='pending' ");
                     while(rs.next()){
                         num = rs.getInt("count");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
}