package e_sale;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class E_saleDAO {

	
	public int login(String e_car_num, String name) { //아이디와비밀번호를 받아서 로그인을 시도해줌 정수형으로 반환
		String SQL = "SELECT name FROM e_sale WHERE e_car_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, e_car_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(name)) {
					return 1; //로그인성공
				}
				else {
					return 0; //차번호와 이름이 맞지않음
				}
			}
			
			return -1; // 전기차등록안됨
			
		} catch(Exception e) {
			e.printStackTrace();
	} finally {
		try {if(conn != null) conn.close();} 
		catch(Exception e) {e.printStackTrace();}
		try {if( pstmt != null) pstmt.close();} 
		catch(Exception e) {e.printStackTrace();}
		try {if( rs != null) rs.close();} 
		catch(Exception e) {e.printStackTrace();}
	}
		return -2; //데이터베이스오류
	
	}
	
	public int join(E_saleDTO e_sale) { // 사용자의 정보를 입력받아서 회원가입을 수행 반환도 정수
		String SQL = "INSERT INTO e_sale VALUES (?,?,?, false,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, e_sale.getE_car_num());
			pstmt.setString(2, e_sale.getName());
			pstmt.setString(3, e_sale.getE_mail());
			pstmt.setString(4, e_sale.getE_mailHash());
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			
	} finally {
		try {if(conn != null) conn.close();} 
		catch(Exception e) {e.printStackTrace();}
		try {if( pstmt != null) pstmt.close();} 
		catch(Exception e) {e.printStackTrace();}
		try {if( rs != null) rs.close();} 
		catch(Exception e) {e.printStackTrace();}
	}
		return -1; //회원가입실패
	
	}
	
	public String getE_mail(String e_car_num) { // 사용자의 아이디값을 받아서 그 사용자의 이메일주소를 반환 결과는 문자형
		
		String SQL = "SELECT e_mail FROM e_sale WHERE e_car_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, e_car_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			
	} finally {
		try {if(conn != null) conn.close();} 
		catch(Exception e) {e.printStackTrace();}
		try {if( pstmt != null) pstmt.close();} 
		catch(Exception e) {e.printStackTrace();}
		try {if( rs != null) rs.close();} 
		catch(Exception e) {e.printStackTrace();}
	}
		return null; //데이터베이스 오류
	
	}
	
	public boolean getE_mailcheck(String e_car_num) { //사용자가 현재 이메일 인증이 되었는지 결과는 참혹은거짓
		String SQL = "SELECT e_mailcheck FROM e_sale WHERE e_car_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, e_car_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getBoolean(1);
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			
	} finally {
		try {if(conn != null) conn.close();} 
		catch(Exception e) {e.printStackTrace();}
		try {if( pstmt != null) pstmt.close();} 
		catch(Exception e) {e.printStackTrace();}
		try {if( rs != null) rs.close();} 
		catch(Exception e) {e.printStackTrace();}
	}
		return false; //데이터베이스 오류
	
	}
	


	public boolean setE_mailcheck(String e_car_num) { //특정한 사용자의 이메일 인증을 수행해줌
		String SQL = "UPDATE e_sale SET e_mailcheck = true WHERE e_car_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, e_car_num);
			pstmt.executeUpdate();
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			
	} finally {
		try {if(conn != null) conn.close();} 
		catch(Exception e) {e.printStackTrace();}
		try {if( pstmt != null) pstmt.close();} 
		catch(Exception e) {e.printStackTrace();}
		try {if( rs != null) rs.close();} 
		catch(Exception e) {e.printStackTrace();}
	}
		return false; //데이터베이스 오류
	
	}
	
}
