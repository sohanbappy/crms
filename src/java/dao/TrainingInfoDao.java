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
import models.TrainingInfo;



public class TrainingInfoDao {
    
      
    

	public static int saveTrainingInfo(TrainingInfo c) {
		int status = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" insert into training_info_tb (tr_id,tr_name,duration,seats,start_date,cost,trainer,type,status) values (?,?,?,?,?,?,?,?,?)" );
			
                        
                        ps.setString(1, c.getTr_id());
                        ps.setString(2, c.getTr_name());
                        ps.setString(3, c.getDuration());
                        ps.setString(4, c.getSeats());
                        ps.setString(5, c.getStart_date());
                        ps.setString(6, c.getCost());
                        ps.setString(7, c.getTrainer());
                        ps.setString(8, c.getType());
                        ps.setString(9, c.getStatus());

			status = ps.executeUpdate();

			con.close();
		      }    catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

                public static int updateTrainingInfo(String sql) {
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

        
        
	public static int deleteTrainingInfo(int id) {
		int res = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" Delete from training_info_tb where id= ? " );
			ps.setInt(1, id);
                        
			res = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public static TrainingInfo getTrainingInfoById(int id) {
		
            TrainingInfo c = new TrainingInfo();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from training_info_tb where id=? ");
			ps.setInt(1, id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				c.setId(rs.getInt(1));
				c.setTr_id(rs.getString(2));
                                c.setTr_name(rs.getString(3));
                                c.setDuration(rs.getString(4));
                                c.setSeats(rs.getString(5));
                                c.setStart_date(rs.getString(6));
                                c.setCost(rs.getString(7));
                                c.setTrainer(rs.getString(8));
                                c.setType(rs.getString(9));
                                c.setStatus(rs.getString(10));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return c;
	}
        public static TrainingInfo getTrainingInfoByTrId(String id) {
		
            TrainingInfo c = new TrainingInfo();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from training_info_tb where tr_id=? ");
			ps.setString(1, id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				
				c.setId(rs.getInt(1));
				c.setTr_id(rs.getString(2));
                                c.setTr_name(rs.getString(3));
                                c.setDuration(rs.getString(4));
                                c.setSeats(rs.getString(5));
                                c.setStart_date(rs.getString(6));
                                c.setCost(rs.getString(7));
                                c.setTrainer(rs.getString(8));
                                c.setType(rs.getString(9));
                                c.setStatus(rs.getString(10));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return c;
	}

	public static List<TrainingInfo> getAllMembers() {
		List<TrainingInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from training_info_tb ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrainingInfo c = new TrainingInfo();
                                
				c.setId(rs.getInt(1));
				c.setTr_id(rs.getString(2));
                                c.setTr_name(rs.getString(3));
                                c.setDuration(rs.getString(4));
                                c.setSeats(rs.getString(5));
                                c.setStart_date(rs.getString(6));
                                c.setCost(rs.getString(7));
                                c.setTrainer(rs.getString(8));
                                c.setType(rs.getString(9));
                                c.setStatus(rs.getString(10));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        public static List<TrainingInfo> getAllAvailableMembers() {
		List<TrainingInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from training_info_tb WHERE status='available' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrainingInfo c = new TrainingInfo();
                                
				c.setId(rs.getInt(1));
				c.setTr_id(rs.getString(2));
                                c.setTr_name(rs.getString(3));
                                c.setDuration(rs.getString(4));
                                c.setSeats(rs.getString(5));
                                c.setStart_date(rs.getString(6));
                                c.setCost(rs.getString(7));
                                c.setTrainer(rs.getString(8));
                                c.setType(rs.getString(9));
                                c.setStatus(rs.getString(10));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        public static List<TrainingInfo> getMemberByTrId(String tid) {
		List<TrainingInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from training_info_tb WHERE tr_id='"+tid+"'  ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrainingInfo c = new TrainingInfo();
                                
				c.setId(rs.getInt(1));
				c.setTr_id(rs.getString(2));
                                c.setTr_name(rs.getString(3));
                                c.setDuration(rs.getString(4));
                                c.setSeats(rs.getString(5));
                                c.setStart_date(rs.getString(6));
                                c.setCost(rs.getString(7));
                                c.setTrainer(rs.getString(8));
                                c.setType(rs.getString(9));
                                c.setStatus(rs.getString(10));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        
        
        public static List<TrainingInfo> getAllMembersByType(String type) {
		List<TrainingInfo> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from training_info_tb WHERE type='"+type+"' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				TrainingInfo c = new TrainingInfo();
                                
				c.setId(rs.getInt(1));
				c.setTr_id(rs.getString(2));
                                c.setTr_name(rs.getString(3));
                                c.setDuration(rs.getString(4));
                                c.setSeats(rs.getString(5));
                                c.setStart_date(rs.getString(6));
                                c.setCost(rs.getString(7));
                                c.setTrainer(rs.getString(8));
                                c.setType(rs.getString(9));
                                c.setStatus(rs.getString(10));
                                
                                list.add(c);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        
        
        
        
//        public static int countTraining(){
//                 int num=0;
//                 try{
//                     Connection con = dbConfig.getConnection();
//                     Statement st = con.createStatement();
//                     ResultSet rs = st.executeQuery("SELECT COUNT(*) AS count FROM training_info_tb ");
//                     while(rs.next()){
//                         num = rs.getInt("count");
//                     }
//                 } catch (SQLException e){
//                     e.printStackTrace();
//                 }   
//                 return num;
//             }
}