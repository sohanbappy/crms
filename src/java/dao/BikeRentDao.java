package dao;


import connection.dbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import models.BikeRent;



public class BikeRentDao {
    
      
    

	public static int saveBikeRent(BikeRent c) {
		int status = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" insert into bike_rent_tb (rent_id,uid,u_lic_no,g_nid,bike_id,b_lic_no,category,from_date,to_date,pick_point,drop_point,tx_id,total,advance,due,comments,status) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" );
			
                       
                        ps.setString(1, c.getRent_id());
                        ps.setString(2, c.getUid());
                        ps.setString(3, c.getU_lic_no());
                        ps.setString(4, c.getG_nid());
                        ps.setString(5, c.getBike_id());
                        ps.setString(6, c.getB_lic_no());
                        ps.setString(7, c.getCategory());
                        ps.setString(8, c.getFrom_date()); 
                        ps.setString(9, c.getTo_date());
                        ps.setString(10, c.getPick_point()); 
                        ps.setString(11, c.getDrop_point());
                        ps.setString(12, c.getTx_id());
                        ps.setString(13, c.getTotal());
                        ps.setString(14, c.getAdvance());
                        ps.setString(15, c.getDue());
                        
                        ps.setString(16,"");
                        ps.setString(17,"pending");

			status = ps.executeUpdate();
                        
                        
			con.close();
		      }    catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

                public static int updateBikeRentTxID(String sql) {
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
                
                 public static int updateBikeRentDetails(String sql) {
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

        
        
	public static int deleteBikeRent(int id) {
		int res = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" Delete from bike_rent_tb where id= ? " );
			ps.setInt(1, id);
                        
			res = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public static BikeRent getBikeRentById(int id) {
		
            BikeRent c = new BikeRent();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from bike_rent_tb where id=? ");
			ps.setInt(1, id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setU_lic_no(rs.getString(4));
                                c.setG_nid(rs.getString(5));
				c.setBike_id(rs.getString(6));
                                c.setB_lic_no(rs.getString(7));
                                c.setCategory(rs.getString(8));
                                c.setFrom_date(rs.getString(9));
                                c.setTo_date(rs.getString(10));
                                c.setPick_point(rs.getString(11));
                                c.setDrop_point(rs.getString(12));
                                c.setTx_id(rs.getString(13));
                                c.setTotal(rs.getString(14));
                                c.setAdvance(rs.getString(15));
                                c.setDue(rs.getString(16));
                                c.setRequest_time(rs.getString(17));
                                c.setComments(rs.getString(18));
                                
                                c.setStatus(rs.getString(19));
                                c.setConfirmed_by(rs.getString(20));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return c;
	}
        
        
        public static BikeRent getBikeRentByRentId(String id) {
		
            BikeRent c = new BikeRent();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from bike_rent_tb where rent_id=? ");
			ps.setString(1, id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setU_lic_no(rs.getString(4));
                                c.setG_nid(rs.getString(5));
				c.setBike_id(rs.getString(6));
                                c.setB_lic_no(rs.getString(7));
                                c.setCategory(rs.getString(8));
                                c.setFrom_date(rs.getString(9));
                                c.setTo_date(rs.getString(10));
                                c.setPick_point(rs.getString(11));
                                c.setDrop_point(rs.getString(12));
                                c.setTx_id(rs.getString(13));
                                c.setTotal(rs.getString(14));
                                c.setAdvance(rs.getString(15));
                                c.setDue(rs.getString(16));
                                c.setRequest_time(rs.getString(17));
                                c.setComments(rs.getString(18));
                                
                                c.setStatus(rs.getString(19));
                                c.setConfirmed_by(rs.getString(20));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return c;
	}
        
        //select bike_id,count(bike_id) as btimes from bike_rent_tb GROUP BY bike_id ORDER BY btimes DESC LIMIT 1 
        public static BikeRent getMaxRentedBike() {
		
            BikeRent c = new BikeRent();
		try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("select bike_id,count(bike_id) as btimes from bike_rent_tb GROUP BY bike_id ORDER BY btimes DESC LIMIT 1 ");
                     while(rs.next()){
                         c.setBike_id(rs.getString("bike_id"));
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   

		return c;
	}
        
        
        
        public static List<BikeRent> getAllRentByUser(String uid) {
		List<BikeRent> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from bike_rent_tb where uid=? ORDER BY id DESC ");
                        ps.setString(1, uid);
                        
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BikeRent c = new BikeRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setU_lic_no(rs.getString(4));
                                c.setG_nid(rs.getString(5));
				c.setBike_id(rs.getString(6));
                                c.setB_lic_no(rs.getString(7));
                                c.setCategory(rs.getString(8));
                                c.setFrom_date(rs.getString(9));
                                c.setTo_date(rs.getString(10));
                                c.setPick_point(rs.getString(11));
                                c.setDrop_point(rs.getString(12));
                                c.setTx_id(rs.getString(13));
                                c.setTotal(rs.getString(14));
                                c.setAdvance(rs.getString(15));
                                c.setDue(rs.getString(16));
                                c.setRequest_time(rs.getString(17));
                                c.setComments(rs.getString(18));
                                
                                c.setStatus(rs.getString(19));
                                c.setConfirmed_by(rs.getString(20));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static List<BikeRent> getAllMembers() {
		List<BikeRent> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from bike_rent_tb ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BikeRent c = new BikeRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setU_lic_no(rs.getString(4));
                                c.setG_nid(rs.getString(5));
				c.setBike_id(rs.getString(6));
                                c.setB_lic_no(rs.getString(7));
                                c.setCategory(rs.getString(8));
                                c.setFrom_date(rs.getString(9));
                                c.setTo_date(rs.getString(10));
                                c.setPick_point(rs.getString(11));
                                c.setDrop_point(rs.getString(12));
                                c.setTx_id(rs.getString(13));
                                c.setTotal(rs.getString(14));
                                c.setAdvance(rs.getString(15));
                                c.setDue(rs.getString(16));
                                c.setRequest_time(rs.getString(17));
                                c.setComments(rs.getString(18));
                                
                                c.setStatus(rs.getString(19));
                                c.setConfirmed_by(rs.getString(20));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<BikeRent> getAllMembersByAdmin(String admin) {
		List<BikeRent> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from bike_rent_tb WHERE confirmed_by='"+admin+"' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BikeRent c = new BikeRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setU_lic_no(rs.getString(4));
                                c.setG_nid(rs.getString(5));
				c.setBike_id(rs.getString(6));
                                c.setB_lic_no(rs.getString(7));
                                c.setCategory(rs.getString(8));
                                c.setFrom_date(rs.getString(9));
                                c.setTo_date(rs.getString(10));
                                c.setPick_point(rs.getString(11));
                                c.setDrop_point(rs.getString(12));
                                c.setTx_id(rs.getString(13));
                                c.setTotal(rs.getString(14));
                                c.setAdvance(rs.getString(15));
                                c.setDue(rs.getString(16));
                                c.setRequest_time(rs.getString(17));
                                c.setComments(rs.getString(18));
                                
                                c.setStatus(rs.getString(19));
                                c.setConfirmed_by(rs.getString(20));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<BikeRent> getMemberByRentId(String rent_id) {
		List<BikeRent> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from bike_rent_tb WHERE rent_id='"+rent_id+"' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BikeRent c = new BikeRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setU_lic_no(rs.getString(4));
                                c.setG_nid(rs.getString(5));
				c.setBike_id(rs.getString(6));
                                c.setB_lic_no(rs.getString(7));
                                c.setCategory(rs.getString(8));
                                c.setFrom_date(rs.getString(9));
                                c.setTo_date(rs.getString(10));
                                c.setPick_point(rs.getString(11));
                                c.setDrop_point(rs.getString(12));
                                c.setTx_id(rs.getString(13));
                                c.setTotal(rs.getString(14));
                                c.setAdvance(rs.getString(15));
                                c.setDue(rs.getString(16));
                                c.setRequest_time(rs.getString(17));
                                c.setComments(rs.getString(18));
                                
                                c.setStatus(rs.getString(19));
                                c.setConfirmed_by(rs.getString(20));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        	public static List<BikeRent> getAllPendingMembers() {
		List<BikeRent> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from bike_rent_tb where status=? ORDER BY id DESC ");
                        ps.setString(1, "pending");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BikeRent c = new BikeRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setU_lic_no(rs.getString(4));
                                c.setG_nid(rs.getString(5));
				c.setBike_id(rs.getString(6));
                                c.setB_lic_no(rs.getString(7));
                                c.setCategory(rs.getString(8));
                                c.setFrom_date(rs.getString(9));
                                c.setTo_date(rs.getString(10));
                                c.setPick_point(rs.getString(11));
                                c.setDrop_point(rs.getString(12));
                                c.setTx_id(rs.getString(13));
                                c.setTotal(rs.getString(14));
                                c.setAdvance(rs.getString(15));
                                c.setDue(rs.getString(16));
                                c.setRequest_time(rs.getString(17));
                                c.setComments(rs.getString(18));
                                
                                c.setStatus(rs.getString(19));
                                c.setConfirmed_by(rs.getString(20));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
                
        
                
          public static List<BikeRent> getBikeDateMembers(String date1,String date2 ) {
		List<BikeRent> list = new ArrayList<>();

		try {
                    
                        Date from,to;
                        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd") ;
                        from=format.parse(date1);
                        to=format.parse(date2);
                        
			Connection con = dbConfig.getConnection();
                        PreparedStatement ps = con.prepareStatement("select * from bike_rent_tb ORDER BY id DESC  ");
                       
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BikeRent c = new BikeRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setU_lic_no(rs.getString(4));
                                c.setG_nid(rs.getString(5));
				c.setBike_id(rs.getString(6));
                                c.setB_lic_no(rs.getString(7));
                                c.setCategory(rs.getString(8));
                                c.setFrom_date(rs.getString(9));
                                c.setTo_date(rs.getString(10));
                                c.setPick_point(rs.getString(11));
                                c.setDrop_point(rs.getString(12));
                                c.setTx_id(rs.getString(13));
                                c.setTotal(rs.getString(14));
                                c.setAdvance(rs.getString(15));
                                c.setDue(rs.getString(16));
                                c.setRequest_time(rs.getString(17));
                                c.setComments(rs.getString(18));
                                c.setStatus(rs.getString(19));
                                c.setConfirmed_by(rs.getString(20));
                                
                                Date tempReq=format.parse(rs.getString(17));
                                
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
                
        
        
        
        
        
        public static List<BikeRent> getAllMembersByBikeId(String bike_id) {
		List<BikeRent> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from bike_rent_tb where bike_id=? ORDER BY id DESC ");
                        ps.setString(1, bike_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BikeRent c = new BikeRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
                                c.setUid(rs.getString(3));
                                c.setU_lic_no(rs.getString(4));
                                c.setG_nid(rs.getString(5));
				c.setBike_id(rs.getString(6));
                                c.setB_lic_no(rs.getString(7));
                                c.setCategory(rs.getString(8));
                                c.setFrom_date(rs.getString(9));
                                c.setTo_date(rs.getString(10));
                                c.setPick_point(rs.getString(11));
                                c.setDrop_point(rs.getString(12));
                                c.setTx_id(rs.getString(13));
                                c.setTotal(rs.getString(14));
                                c.setAdvance(rs.getString(15));
                                c.setDue(rs.getString(16));
                                c.setRequest_time(rs.getString(17));
                                c.setComments(rs.getString(18));
                                
                                c.setStatus(rs.getString(19));
                                c.setConfirmed_by(rs.getString(20));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
         public static int BikeTotal(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT SUM(total) AS allTotal FROM bike_rent_tb ");
                     while(rs.next()){
                         num = rs.getInt("allTotal");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
         public static int BikeAdvance(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT SUM(advance) AS allTotal FROM bike_rent_tb ");
                     while(rs.next()){
                         num = rs.getInt("allTotal");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
         public static int BikeDue(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT SUM(due) AS allTotal FROM bike_rent_tb ");
                     while(rs.next()){
                         num = rs.getInt("allTotal");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
        
                public static int countRentAll(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT COUNT(*) AS count FROM bike_rent_tb ");
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
                     ResultSet rs = st.executeQuery("SELECT COUNT(*) AS count FROM bike_rent_tb WHERE status='pending'   ");
                     while(rs.next()){
                         num = rs.getInt("count");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
        
}