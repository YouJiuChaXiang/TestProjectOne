package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dao.DBUtil;
import model.Address;
import model.User;

public class UserService {

	public static User getUseById(int userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;

		try {
			con = DBUtil.getCon();

			String sql = "select * from t_user where user_id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			User user = new User();
			user.setUserName(rs.getString("user_name"));
			user.setUserId(rs.getInt("user_id"));
			user.setUserAge(rs.getInt("user_age"));
			user.setUserEmail(rs.getString("user_email"));
			user.setUserSex(rs.getInt("user_sex"));
			return user;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.close(rs, pstmt, con);
		}

	}

	// 更新用户信息
	public static int updateUserInfo(Map<String, String[]> map) {
		PreparedStatement pstmt = null;
		Connection con = null;

		try {
			con = DBUtil.getCon();

			String sql = "update t_user set user_name=?,user_age=?,user_sex=?,user_email=? where user_id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, map.get("userName")[0]);

			if (map.get("userAge")[0] != "") {
				pstmt.setInt(2, Integer.parseInt(map.get("userAge")[0]));
			} else {
				pstmt.setString(2, null);
			}

			pstmt.setInt(3, Integer.parseInt(map.get("userSex")[0]));
			pstmt.setString(4, map.get("userEmail")[0]);
			pstmt.setInt(5, Integer.parseInt(map.get("userId")[0]));

			int i = pstmt.executeUpdate();
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			DBUtil.close(null, pstmt, con);
		}
	}
	//获取收货地址列表
		public static List<Address> getAddressByUser(int userId) {
			PreparedStatement pstmt=null;
	 		  ResultSet rs=null;
	 		  Connection con=null;		
	 		  
	 		try{		
	 			con=DBUtil.getCon();
	 		
	 			String sql="select* from t_address where user_id=?";
	 			
	 			pstmt=con.prepareStatement(sql);
	 			pstmt.setInt(1, userId);
	 			rs=pstmt.executeQuery();
	 	        List<Address> addrlist =new ArrayList<Address>();  
	 	        while(rs.next()) {
	 	        	Address addr=new Address();
	 	        	addr.setAddrArea(rs.getString("addr_area"));
	 	        	addr.setAddrCity(rs.getString("addr_city"));
	 	        	addr.setAddrContent(rs.getString("addr_content"));
	 	        	addr.setAddrId(rs.getInt("addr_id"));
	                addr.setAddrIsdefault(rs.getInt("addr_isdefault"));
	                addr.setAddrProvince(rs.getString("addr_province"));
	                addr.setAddrReceiver(rs.getString("addr_receiver"));
	                addr.setAddrTel(rs.getString("addr_tel"));
	                addr.setUserId(rs.getInt("user_id"));
	                addrlist.add(addr);
	 	        }
	 			return addrlist;
	 			
	 			}catch(Exception e){
	 	         e.printStackTrace();
	 	         return null;
	 			}finally{
	 				DBUtil.close(rs,pstmt,con);
	 			}
		}
		// 删除收货地址
		public static int delAddress(int addrId) {
		     PreparedStatement pstmt=null;
		      Connection con=null;    
		      
		    try{    
		      con=DBUtil.getCon();
		    
		      String sql="delete from t_address where addr_id=?";
		      pstmt=con.prepareStatement(sql);
		      pstmt.setInt(1,addrId);
		      int i=pstmt.executeUpdate();
		      return i;
		      }catch(Exception e){
		           e.printStackTrace();
		           return -1;
		      }finally{
		        DBUtil.close(null,pstmt,con);
		      }    
		    
		  }

}
