package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BbsDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS2?useUnicode=true&characterEncoding=UTF-8&";
			String dbID = "root";
			String dbPassword = "111111";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int modify(String bbsTitle, int bbsID, String bbsContent) {
		String SQL = "UPDATE BBS SET bbsTitle=?,bbsContent=? where bbsID = ?";
		try {
			System.out.println(bbsTitle);
			System.out.println(bbsID);
			System.out.println(bbsContent);
			PreparedStatement  pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);			
			pstmt.executeUpdate();
			return 1;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Bbs> getLists() {
		ArrayList<Bbs> bbsList = new ArrayList<Bbs>();
		String SQL = "SELECT * FROM BBS";		
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			Bbs bbs = null;
			while(rs.next()) {
				bbs = new Bbs();
				bbs.setBbsID(rs.getInt("bbsID"));
				bbs.setBbsTitle(rs.getString("bbsTitle"));
				bbs.setUserID(rs.getString("userID"));
				bbs.setBbsDate(rs.getString("bbsDate"));
				bbs.setBbsContent(rs.getString("bbsContent"));
				bbs.setBbsAvailable(rs.getInt("bbsAvailable"));
				bbsList.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bbsList;
	}
	
	public Bbs getChoiceLists(String bbsID) {
		Bbs bbs = null;
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bbs = new Bbs();
				bbs.setBbsID(rs.getInt("bbsID"));
				bbs.setBbsTitle(rs.getString("bbsTitle"));
				bbs.setUserID(rs.getString("userID"));
				bbs.setBbsDate(rs.getString("bbsDate"));
				bbs.setBbsContent(rs.getString("bbsContent"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}
	
	public int deleteBbs(int bbsID) {
		String SQL = "DELETE FROM BBS WHERE bbsID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			pstmt.executeUpdate();
			return 1;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;		
	}

}