package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS2?useUnicode=true&characterEncoding=UTF-8";
			String dbID = "root";
			String dbPassword = "111111";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				}else {
					return 0; // 비밀번호 틀림
				}
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?,?,?,false)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setString(6, user.getUserPhone());
			pstmt.setString(7, user.getUserEmailHash());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;		
	}
	
	public int modifyUser(String userID, String userGender, String userEmail, String userPhone) {
		String SQL = "UPDATE USER SET userGender=?,userEmail=?,userPhone=? where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userGender);
			pstmt.setString(2, userEmail);
			pstmt.setString(3, userPhone);
			pstmt.setString(4, userID);
			pstmt.executeUpdate();
			return 1;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;		
	}
	
	public int deleteUser(String userID) {
		String SQL = "delete from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return 1;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;		
	}
	
	public User searchUserID(String userName, String userEmail) {
		User user = null;
		String SQL = "SELECT userID FROM USER WHERE userName = ? AND userEmail = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setUserID(rs.getString("userID"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return user;		
	}
	
	public User getUser(String userID) {
		User user = null;
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setUserID(rs.getString("userID"));
				user.setUserName(rs.getString("userName"));
				user.setUserGender(rs.getString("userGender"));
				user.setUserEmail(rs.getString("userEmail"));
				user.setUserPhone(rs.getString("userPhone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public String getUserEmail(String userID) {
		String SQL = "SELECT userEmail FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			} 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;		
	}
	
	public boolean getUserEmailChecked(String userID) {
		String SQL = "SELECT userEmailChecked FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getBoolean(1);
			} 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;		
	}
	
	public boolean setUserEmailChecked(String userID) {
		String SQL = "UPDATE USER SET userEmailChecked = true WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return true; 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;		
	}
}
