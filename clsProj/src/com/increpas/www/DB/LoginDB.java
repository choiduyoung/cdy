package com.increpas.www.DB;

import java.sql.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;
public class LoginDB {
	
	public DataSource ds;
	
	public LoginDB() {
		try {
			InitialContext context = new InitialContext();
			
			ds = (DataSource) context.lookup("java:/comp/env/jdbc/TestDB");
		} catch (Exception e) {
			System.out.println("####### 실패 ###########");
		}
	}
	
	public Connection getCon() {
		Connection con =null;
		
		try {
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public PreparedStatement getPSTMT(Connection con, String sql) {
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	public void close(Object o) {
		try {
			if(o instanceof Connection) {
				((Connection) o).close();
			} else if(o instanceof Connection) {
				((Statement) o).close();
			} else if(o instanceof Connection) {
				((PreparedStatement) o).close();
			} else if(o instanceof Connection) {
				((ResultSet) o).close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
