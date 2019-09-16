package dao;


import connection.dbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import models.Branch;
import models.User;



public class BranchDao {
    
      
    

	public static int saveBranch(Branch e) {
		int status = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" insert into branch_tb (br_id,name,location,admin_name,uname,pass,status) values (?,?,?,?,?,?,?)" );
			
                        
                        ps.setString(1, e.getBr_id());
                        ps.setString(2, e.getName());
                        ps.setString(3, e.getLocation());
                        ps.setString(4, e.getAdmin_name());
                        ps.setString(5, e.getUname());
                        ps.setString(6, e.getPass());
                        ps.setString(7, e.getStatus());
                        
			status = ps.executeUpdate();

			con.close();
		      }    catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

                public static int updateBranch(String sql) {
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

        
        
	public static int deleteBranch(int id) {
		int res = 0;
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement(" Delete from branch_tb where id= ? " );
			ps.setInt(1, id);
                        
			res = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public static Branch getBranchById(int id) {
		
            Branch e = new Branch();
		try {
			Connection con = dbConfig.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from branch_tb where id= ? ");
			ps.setInt(1, id);
                        
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				e.setId(rs.getInt(1));
                                e.setBr_id(rs.getString(2));
				e.setName(rs.getString(3));
                                e.setLocation(rs.getString(4));
                                e.setAdmin_name(rs.getString(5));
                                e.setUname(rs.getString(6));
                                e.setPass(rs.getString(7));
                                e.setStatus(rs.getString(8));
				
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return e;
	}

	public static List<Branch> getMemberByBranchId(String bid) {
		List<Branch> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from branch_tb WHERE br_id='"+bid+"' ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Branch e = new Branch();
                                
				e.setId(rs.getInt(1));
                                e.setBr_id(rs.getString(2));
				e.setName(rs.getString(3));
                                e.setLocation(rs.getString(4));
                                e.setAdmin_name(rs.getString(5));
                                e.setUname(rs.getString(6));
                                e.setPass(rs.getString(7));
                                e.setStatus(rs.getString(8));
                                
                                list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
        	public static List<Branch> getAllMembers() {
		List<Branch> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from branch_tb ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Branch e = new Branch();
                                
				e.setId(rs.getInt(1));
                                e.setBr_id(rs.getString(2));
				e.setName(rs.getString(3));
                                e.setLocation(rs.getString(4));
                                e.setAdmin_name(rs.getString(5));
                                e.setUname(rs.getString(6));
                                e.setPass(rs.getString(7));
                                e.setStatus(rs.getString(8));
                                
                                list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
                
                public static List<Branch> getAllAvailableMembers() {
		List<Branch> list = new ArrayList<>();

		try {
			Connection con = dbConfig.getConnection();
                        
			PreparedStatement ps = con.prepareStatement("select * from branch_tb WHERE status='available' ORDER BY id DESC ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Branch e = new Branch();
                                
				e.setId(rs.getInt(1));
                                e.setBr_id(rs.getString(2));
				e.setName(rs.getString(3));
                                e.setLocation(rs.getString(4));
                                e.setAdmin_name(rs.getString(5));
                                e.setUname(rs.getString(6));
                                e.setPass(rs.getString(7));
                                e.setStatus(rs.getString(8));
                                
                                list.add(e);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}