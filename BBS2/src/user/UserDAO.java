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
					return 1;
				}else {
					return 0;
				}
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(String userID, String userPassword, String userName, String userGender, String userEmail, String userPhone) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userName);
			pstmt.setString(4, userGender);
			pstmt.setString(5, userEmail);
			pstmt.setString(6, userPhone);
			pstmt.executeUpdate();
			return 1;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;		
	}
	
	public int modifyUser(String userID, String userPassword, String userName, String userGender, String userEmail, String userPhone) {
		String SQL = "UPDATE USER SET userPassword=?,userName=?,userGender=?,userEmail=?,userPhone=? where userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userPassword);
			pstmt.setString(2, userName);
			pstmt.setString(3, userGender);
			pstmt.setString(4, userEmail);
			pstmt.setString(5, userPhone);
			pstmt.setString(6, userID);
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
}
