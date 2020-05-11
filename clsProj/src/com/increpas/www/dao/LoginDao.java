package com.increpas.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.increpas.www.DB.LoginDB;
import com.increpas.www.sql.LoginSQL;

public class LoginDao {
	LoginDB db = null;
	LoginSQL msql = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; 
	
	public LoginDao() {																									
		db = new LoginDB();
		msql = new LoginSQL();
	}
	public int getCnt(String id, String pw) {
		int cnt = 0;
		
		con = db.getCon();
		String sql = msql.getSQL(msql.SEL_LOGIN);
		pstmt = db.getPSTMT(con, sql);
		try {
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (Exception e) {
			
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		return cnt;
		
	}
}

	
																																																																																														