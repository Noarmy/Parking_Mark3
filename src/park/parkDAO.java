package park;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import util.DatabaseUtil;

public class parkDAO {
	
	
	
	//입차
	public int join(String car_num) {
		String SQL = "INSERT INTO park (car_num) VALUES (?)";
		Connection conn = null;
		PreparedStatement pstmt = null;

	
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, car_num);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} 
		
		return -1;
	}
	
	//입차중복확인
		public int check(String car_num) {
			String SQL = "SELECT car_num FROM park WHERE out_time IS null and car_num = ?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
		
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, car_num);
			    rs = pstmt.executeQuery();
				
			    if(rs.next()) {
			    	return 1;
			    }
				return -1;
				
			} catch(Exception e) {
				e.printStackTrace();
			} 
			
			return -1;
		}
	
	//출차시간바꾸기
	public int out(String car_num) {
		String SQL = "UPDATE park SET out_time = current_time WHERE car_num = ?";
		
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, car_num);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 데이터베이스 시간을 변수에 담기
	ResultSet rs = null;
	
	public int park(String car_num) {
		String SQL = "select in_time, out_time from park where car_num =?";
		 
		
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, car_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				String in = rs.getString(1);
				String out = rs.getString(2);
				
                String rds = in;
                String rds2 = out; // 요청시간 받아오기
                
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                
                
                Date reqDate = dateFormat.parse(rds);
                Date reqDate2 = dateFormat.parse(rds2);
                
                long reqDateTime = reqDate.getTime();
                long reqDateTime2 = reqDate2.getTime();
                
                long time1 = reqDate2.getTime()-reqDate.getTime();
                
                int t = (int) (time1/(1000*60)); //분
                
                
                int d = 100; //분당 백원
                
                 int rat = t * d;
                 return rat;
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	


	
	

}
