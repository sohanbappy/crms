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
import models.CarRent;



public class CarRentDao {
    
      
    

	public static int saveCarRent(CarRent c) {
		int status = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" insert into car_rent_tb (rent_id,car_id,car_lic_no,uid,category,rent_type,pick_point,drop_point,hr_date,hr_from,hr_to,day_from,day_to,tx_id,total,advance,due,comments,status) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" );
			
                       
                        ps.setString(1, c.getRent_id());
                        ps.setString(2, c.getCar_id());
                        ps.setString(3, c.getCar_lic_no());
                        ps.setString(4, c.getUid());
                        ps.setString(5, c.getCategory());
                        ps.setString(6, c.getRent_type());
                        ps.setString(7, c.getPick_point()); 
                        ps.setString(8, c.getDrop_point());
                        ps.setString(9, c.getHr_date());
                        ps.setString(10, c.getHr_from());
                        ps.setString(11, c.getHr_to());
                        ps.setString(12, c.getDay_from()); 
                        ps.setString(13, c.getDay_to());
                        ps.setString(14, c.getTx_id());
                        ps.setString(15, c.getTotal());
                        ps.setString(16, c.getAdvance());
                        ps.setString(17, c.getDue());
                        
                        ps.setString(18,"");
                        ps.setString(19,"pending");

			status = ps.executeUpdate();

			con.close();
		      }    catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

                public static int updateCarRentTxID(String sql) {
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
                
                 public static int updateCarRentDetails(String sql) {
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

        
        
	public static int deleteCarRent(int id) {
		int res = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" Delete from car_rent_tb where id= ? " );
			ps.setInt(1, id);
                        
			res = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public static CarRent getCarRentById(int id) {
		
            CarRent c = new CarRent();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from car_rent_tb where id=? ");
			ps.setInt(1, id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
				c.setCar_id(rs.getString(3));
                                c.setCar_lic_no(rs.getString(4));
                                c.setUid(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setRent_type(rs.getString(7));
                                c.setPick_point(rs.getString(8));
                                c.setDrop_point(rs.getString(9));
                                c.setHr_date(rs.getString(10));
                                c.setHr_from(rs.getString(11));
                                c.setHr_to(rs.getString(12));
                                c.setDay_from(rs.getString(13));
                                c.setDay_to(rs.getString(14));
                                c.setTx_id(rs.getString(15));
                                c.setTotal(rs.getString(16));
                                c.setAdvance(rs.getString(17));
                                c.setDue(rs.getString(18));
                                c.setRequest_time(rs.getString(19));
                                c.setComments(rs.getString(20));
                                
                                c.setStatus(rs.getString(21));
                                c.setConfirmed_by(rs.getString(22));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return c;
	}
        
        public static CarRent getCarRentByRentId(String id) {
		
            CarRent c = new CarRent();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from car_rent_tb where rent_id=? ORDER BY id DESC ");
			ps.setString(1, id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
				c.setCar_id(rs.getString(3));
                                c.setCar_lic_no(rs.getString(4));
                                c.setUid(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setRent_type(rs.getString(7));
                                c.setPick_point(rs.getString(8));
                                c.setDrop_point(rs.getString(9));
                                c.setHr_date(rs.getString(10));
                                c.setHr_from(rs.getString(11));
                                c.setHr_to(rs.getString(12));
                                c.setDay_from(rs.getString(13));
                                c.setDay_to(rs.getString(14));
                                c.setTx_id(rs.getString(15));
                                c.setTotal(rs.getString(16));
                                c.setAdvance(rs.getString(17));
                                c.setDue(rs.getString(18));
                                c.setRequest_time(rs.getString(19));
                                c.setComments(rs.getString(20));
                                
                                c.setStatus(rs.getString(21));
                                c.setConfirmed_by(rs.getString(22));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return c;
	}
        
        public static CarRent getMaxRentedCar() {
		
            CarRent c = new CarRent();
		try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("select car_id,count(car_id) as btimes from car_rent_tb GROUP BY car_id ORDER BY btimes DESC LIMIT 1 ");
                     while(rs.next()){
                         c.setCar_id(rs.getString("car_id"));
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   

		return c;
	}
        
        
        public static List<CarRent> getAllRentByUser(String uid) {
		List<CarRent> list = new ArrayList<CarRent>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from car_rent_tb where uid=? ORDER BY id DESC  ");
                        ps.setString(1, uid);
                        
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CarRent c = new CarRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
				c.setCar_id(rs.getString(3));
                                c.setCar_lic_no(rs.getString(4));
                                c.setUid(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setRent_type(rs.getString(7));
                                c.setPick_point(rs.getString(8));
                                c.setDrop_point(rs.getString(9));
                                c.setHr_date(rs.getString(10));
                                c.setHr_from(rs.getString(11));
                                c.setHr_to(rs.getString(12));
                                c.setDay_from(rs.getString(13));
                                c.setDay_to(rs.getString(14));
                                c.setTx_id(rs.getString(15));
                                c.setTotal(rs.getString(16));
                                c.setAdvance(rs.getString(17));
                                c.setDue(rs.getString(18));
                                c.setRequest_time(rs.getString(19));
                                c.setComments(rs.getString(20));
                                
                                c.setStatus(rs.getString(21));
                                c.setConfirmed_by(rs.getString(22));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public static List<CarRent> getAllMembers() {
		List<CarRent> list = new ArrayList<CarRent>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from car_rent_tb ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CarRent c = new CarRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
				c.setCar_id(rs.getString(3));
                                c.setCar_lic_no(rs.getString(4));
                                c.setUid(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setRent_type(rs.getString(7));
                                c.setPick_point(rs.getString(8));
                                c.setDrop_point(rs.getString(9));
                                c.setHr_date(rs.getString(10));
                                c.setHr_from(rs.getString(11));
                                c.setHr_to(rs.getString(12));
                                c.setDay_from(rs.getString(13));
                                c.setDay_to(rs.getString(14));
                                c.setTx_id(rs.getString(15));
                                c.setTotal(rs.getString(16));
                                c.setAdvance(rs.getString(17));
                                c.setDue(rs.getString(18));
                                c.setRequest_time(rs.getString(19));
                                c.setComments(rs.getString(20));
                                
                                c.setStatus(rs.getString(21));
                                c.setConfirmed_by(rs.getString(22));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<CarRent> getAllMembersByAdmin(String admin) {
		List<CarRent> list = new ArrayList<CarRent>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from car_rent_tb WHERE confirmed_by='"+admin+"' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CarRent c = new CarRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
				c.setCar_id(rs.getString(3));
                                c.setCar_lic_no(rs.getString(4));
                                c.setUid(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setRent_type(rs.getString(7));
                                c.setPick_point(rs.getString(8));
                                c.setDrop_point(rs.getString(9));
                                c.setHr_date(rs.getString(10));
                                c.setHr_from(rs.getString(11));
                                c.setHr_to(rs.getString(12));
                                c.setDay_from(rs.getString(13));
                                c.setDay_to(rs.getString(14));
                                c.setTx_id(rs.getString(15));
                                c.setTotal(rs.getString(16));
                                c.setAdvance(rs.getString(17));
                                c.setDue(rs.getString(18));
                                c.setRequest_time(rs.getString(19));
                                c.setComments(rs.getString(20));
                                
                                c.setStatus(rs.getString(21));
                                c.setConfirmed_by(rs.getString(22));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<CarRent> getMemberByRentId(String rent_id) {
		List<CarRent> list = new ArrayList<CarRent>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from car_rent_tb WHERE rent_id='"+rent_id+"' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CarRent c = new CarRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
				c.setCar_id(rs.getString(3));
                                c.setCar_lic_no(rs.getString(4));
                                c.setUid(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setRent_type(rs.getString(7));
                                c.setPick_point(rs.getString(8));
                                c.setDrop_point(rs.getString(9));
                                c.setHr_date(rs.getString(10));
                                c.setHr_from(rs.getString(11));
                                c.setHr_to(rs.getString(12));
                                c.setDay_from(rs.getString(13));
                                c.setDay_to(rs.getString(14));
                                c.setTx_id(rs.getString(15));
                                c.setTotal(rs.getString(16));
                                c.setAdvance(rs.getString(17));
                                c.setDue(rs.getString(18));
                                c.setRequest_time(rs.getString(19));
                                c.setComments(rs.getString(20));
                                
                                c.setStatus(rs.getString(21));
                                c.setConfirmed_by(rs.getString(22));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<CarRent> getAllPendingMembers() {
		List<CarRent> list = new ArrayList<CarRent>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from car_rent_tb WHERE status='pending' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CarRent c = new CarRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
				c.setCar_id(rs.getString(3));
                                c.setCar_lic_no(rs.getString(4));
                                c.setUid(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setRent_type(rs.getString(7));
                                c.setPick_point(rs.getString(8));
                                c.setDrop_point(rs.getString(9));
                                c.setHr_date(rs.getString(10));
                                c.setHr_from(rs.getString(11));
                                c.setHr_to(rs.getString(12));
                                c.setDay_from(rs.getString(13));
                                c.setDay_to(rs.getString(14));
                                c.setTx_id(rs.getString(15));
                                c.setTotal(rs.getString(16));
                                c.setAdvance(rs.getString(17));
                                c.setDue(rs.getString(18));
                                c.setRequest_time(rs.getString(19));
                                c.setComments(rs.getString(20));
                                
                                c.setStatus(rs.getString(21));
                                c.setConfirmed_by(rs.getString(22));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        	public static List<CarRent> getAllMembersByCarId(String car_id) {
		List<CarRent> list = new ArrayList<CarRent>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from car_rent_tb where car_id=? ORDER BY id DESC ");
                        ps.setString(1, car_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CarRent c = new CarRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
				c.setCar_id(rs.getString(3));
                                c.setCar_lic_no(rs.getString(4));
                                c.setUid(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setRent_type(rs.getString(7));
                                c.setPick_point(rs.getString(8));
                                c.setDrop_point(rs.getString(9));
                                c.setHr_date(rs.getString(10));
                                c.setHr_from(rs.getString(11));
                                c.setHr_to(rs.getString(12));
                                c.setDay_from(rs.getString(13));
                                c.setDay_to(rs.getString(14));
                                c.setTx_id(rs.getString(15));
                                c.setTotal(rs.getString(16));
                                c.setAdvance(rs.getString(17));
                                c.setDue(rs.getString(18));
                                c.setRequest_time(rs.getString(19));
                                c.setComments(rs.getString(20));
                                
                                c.setStatus(rs.getString(21));
                                c.setConfirmed_by(rs.getString(22));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
             public static List<CarRent> getCarDateMembers(String date1,String date2 ) {
		List<CarRent> list = new ArrayList<>();

		try {
                    
                        Date from,to;
                        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd") ;
                        from=format.parse(date1);
                        to=format.parse(date2);
                        
			Connection con = dbConfig.getConnection();
                        PreparedStatement ps = con.prepareStatement("select * from car_rent_tb ORDER BY id DESC  ");
                       
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CarRent c = new CarRent();
                                
				c.setId(rs.getInt(1));
                                c.setRent_id(rs.getString(2));
				c.setCar_id(rs.getString(3));
                                c.setCar_lic_no(rs.getString(4));
                                c.setUid(rs.getString(5));
                                c.setCategory(rs.getString(6));
                                c.setRent_type(rs.getString(7));
                                c.setPick_point(rs.getString(8));
                                c.setDrop_point(rs.getString(9));
                                c.setHr_date(rs.getString(10));
                                c.setHr_from(rs.getString(11));
                                c.setHr_to(rs.getString(12));
                                c.setDay_from(rs.getString(13));
                                c.setDay_to(rs.getString(14));
                                c.setTx_id(rs.getString(15));
                                c.setTotal(rs.getString(16));
                                c.setAdvance(rs.getString(17));
                                c.setDue(rs.getString(18));
                                c.setRequest_time(rs.getString(19));
                                c.setComments(rs.getString(20));
                                
                                c.setStatus(rs.getString(21));
                                c.setConfirmed_by(rs.getString(22));
                                
                                Date tempReq=format.parse(rs.getString(19));
                                
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
                
                
                
                
                
               public static int CarTotal(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT SUM(total) AS allTotal FROM car_rent_tb ");
                     while(rs.next()){
                         num = rs.getInt("allTotal");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
         public static int CarAdvance(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT SUM(advance) AS allTotal FROM car_rent_tb ");
                     while(rs.next()){
                         num = rs.getInt("allTotal");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
         public static int CarDue(){
                 int num=0;
                 try{
                     Connection con = dbConfig.getConnection();
                     Statement st = con.createStatement();
                     ResultSet rs = st.executeQuery("SELECT SUM(due) AS allTotal FROM car_rent_tb ");
                     while(rs.next()){
                         num = rs.getInt("allTotal");
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
                     ResultSet rs = st.executeQuery("SELECT COUNT(*) AS count FROM car_rent_tb WHERE status='pending'   ");
                     while(rs.next()){
                         num = rs.getInt("count");
                     }
                 } catch (SQLException e){
                     e.printStackTrace();
                 }   
                 return num;
             }
}