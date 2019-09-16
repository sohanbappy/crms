/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.dbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import models.BikeRent;
import models.TrainingRent;

/**
 *
 * @author Bappy
 */
public class TrainingRentDao {
    
    public static int saveTrainingRent(TrainingRent c) {
		int status = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" insert into training_rent_tb (rent_id,uid,tr_id,tx_id,total,advance,due,comments,status) values (?,?,?,?,?,?,?,?,?)" );
			
                       
                        ps.setString(1, c.getRent_id());
                        ps.setString(2, c.getUid());
                        ps.setString(3, c.getTr_id());
                        ps.setString(4, c.getTx_id());
                        ps.setString(5, c.getTotal());
                        ps.setString(6, c.getAdvance());
                        ps.setString(7, c.getDue());
                        
                        ps.setString(8,"");
                        ps.setString(9,"pending");

			status = ps.executeUpdate();
                        
                        
			con.close();
		      }    catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

                public static int updateTrainingRentTxID(String sql) {
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
                
                 public static int updateTrainingRentDetails(String sql) {
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

        
        
	public static int deleteTrainingRent(int id) {
		int res = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" Delete from training_rent_tb where id= ? " );
			ps.setInt(1, id);
                        
			res = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public static TrainingRent getTrainingRentById(int id) {
		
            TrainingRent c = new TrainingRent();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from training_rent_tb where id=? ");
			ps.setInt(1, id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setTr_id(rs.getString(4));
                                c.setTx_id(rs.getString(5));
                                c.setRequest_time(rs.getString(6));
                                c.setTotal(rs.getString(7));
                                c.setAdvance(rs.getString(8));
                                c.setDue(rs.getString(9));
                                c.setComments(rs.getString(10));
                                
                                c.setStatus(rs.getString(11));
                                c.setConfirmed_by(rs.getString(12));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return c;
	}
        public static TrainingRent getTrainingRentByRentId(String id) {
		
            TrainingRent c = new TrainingRent();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from training_rent_tb where rent_id=? ");
			ps.setString(1, id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setTr_id(rs.getString(4));
                                c.setTx_id(rs.getString(5));
                                c.setRequest_time(rs.getString(6));
                                c.setTotal(rs.getString(7));
                                c.setAdvance(rs.getString(8));
                                c.setDue(rs.getString(9));
                                c.setComments(rs.getString(10));
                                
                                c.setStatus(rs.getString(11));
                                c.setConfirmed_by(rs.getString(12));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return c;
	}
        
        public static List<TrainingRent> getAllTrainingRentByUser(String uid) {
		List<TrainingRent> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from training_rent_tb where uid=? ORDER BY id DESC ");
                        ps.setString(1, uid);
                        
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrainingRent c = new TrainingRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setTr_id(rs.getString(4));
                                c.setTx_id(rs.getString(5));
                                c.setRequest_time(rs.getString(6));
                                c.setTotal(rs.getString(7));
                                c.setAdvance(rs.getString(8));
                                c.setDue(rs.getString(9));
                                c.setComments(rs.getString(10));
                                
                                c.setStatus(rs.getString(11));
                                c.setConfirmed_by(rs.getString(12));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static List<TrainingRent> getAllMembers() {
		List<TrainingRent> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from training_rent_tb ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrainingRent c = new TrainingRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setTr_id(rs.getString(4));
                                c.setTx_id(rs.getString(5));
                                c.setRequest_time(rs.getString(6));
                                c.setTotal(rs.getString(7));
                                c.setAdvance(rs.getString(8));
                                c.setDue(rs.getString(9));
                                c.setComments(rs.getString(10));
                                
                                c.setStatus(rs.getString(11));
                                c.setConfirmed_by(rs.getString(12));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<TrainingRent> getAllMembersByAdmin(String admin) {
		List<TrainingRent> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from training_rent_tb WHERE confirmed_by='"+admin+"' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrainingRent c = new TrainingRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setTr_id(rs.getString(4));
                                c.setTx_id(rs.getString(5));
                                c.setRequest_time(rs.getString(6));
                                c.setTotal(rs.getString(7));
                                c.setAdvance(rs.getString(8));
                                c.setDue(rs.getString(9));
                                c.setComments(rs.getString(10));
                                
                                c.setStatus(rs.getString(11));
                                c.setConfirmed_by(rs.getString(12));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<TrainingRent> getMemberByRentId(String rent_id) {
		List<TrainingRent> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from training_rent_tb WHERE rent_id='"+rent_id+"' ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrainingRent c = new TrainingRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setTr_id(rs.getString(4));
                                c.setTx_id(rs.getString(5));
                                c.setRequest_time(rs.getString(6));
                                c.setTotal(rs.getString(7));
                                c.setAdvance(rs.getString(8));
                                c.setDue(rs.getString(9));
                                c.setComments(rs.getString(10));
                                
                                c.setStatus(rs.getString(11));
                                c.setConfirmed_by(rs.getString(12));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        
        
        public static List<TrainingRent> getAllPendingMembers() {
		List<TrainingRent> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from training_rent_tb WHERE status='pending' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrainingRent c = new TrainingRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setTr_id(rs.getString(4));
                                c.setTx_id(rs.getString(5));
                                c.setRequest_time(rs.getString(6));
                                c.setTotal(rs.getString(7));
                                c.setAdvance(rs.getString(8));
                                c.setDue(rs.getString(9));
                                c.setComments(rs.getString(10));
                                
                                c.setStatus(rs.getString(11));
                                c.setConfirmed_by(rs.getString(12));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        
        
        
        public static List<TrainingRent> getAllMembersByTrainingId(String tr_id) {
		List<TrainingRent> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from training_rent_tb where tr_id=? ORDER BY id DESC ");
                        ps.setString(1, tr_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrainingRent c = new TrainingRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setTr_id(rs.getString(4));
                                c.setTx_id(rs.getString(5));
                                c.setRequest_time(rs.getString(6));
                                c.setTotal(rs.getString(7));
                                c.setAdvance(rs.getString(8));
                                c.setDue(rs.getString(9));
                                c.setComments(rs.getString(10));
                                
                                c.setStatus(rs.getString(11));
                                c.setConfirmed_by(rs.getString(12));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<TrainingRent> getTrDateMembers(String date1,String date2 ) {
		List<TrainingRent> list = new ArrayList<>();

		try {
                    
                        Date from,to;
                        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd") ;
                        from=format.parse(date1);
                        to=format.parse(date2);
                        
			Connection con = dbConfig.getConnection();
                        PreparedStatement ps = con.prepareStatement("select * from training_rent_tb ORDER BY id DESC  ");
                       
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrainingRent c = new TrainingRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setTr_id(rs.getString(4));
                                c.setTx_id(rs.getString(5));
                                c.setRequest_time(rs.getString(6));
                                c.setTotal(rs.getString(7));
                                c.setAdvance(rs.getString(8));
                                c.setDue(rs.getString(9));
                                c.setComments(rs.getString(10));
                                
                                c.setStatus(rs.getString(11));
                                c.setConfirmed_by(rs.getString(12));
                                
                                Date tempReq=format.parse(rs.getString(6));
                                
                              if(tempReq.compareTo(from)>=0 && tempReq.compareTo(to)<=0){
                                list.add(c);
                                }
                                
                                
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}      
        
        
        
         public static int TrainingTotal(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT SUM(total) AS allTotal FROM training_rent_tb ");
                     while(rs.next()){
                         num = rs.getInt("allTotal");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
         public static int TrainingAdvance(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT SUM(advance) AS allTotal FROM training_rent_tb ");
                     while(rs.next()){
                         num = rs.getInt("allTotal");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
         public static int TrainingDue(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT SUM(due) AS allTotal FROM training_rent_tb ");
                     while(rs.next()){
                         num = rs.getInt("allTotal");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }  
                
        
        
        
        
         public static int countSeats(String tr_id){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) AS count FROM training_rent_tb where tr_id=? ");
                     ps.setString(1, tr_id);
                     ResultSet rs = ps.executeQuery();
                     while(rs.next()){
                         num = rs.getInt("count");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
          public static int countRentPending(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT COUNT(*) AS count FROM training_rent_tb WHERE status='pending'   ");
                     while(rs.next()){
                         num = rs.getInt("count");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
         
}
