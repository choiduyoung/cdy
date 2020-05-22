package com.increpas.www.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class WebDBCP {
	public DataSource ds ; 
	public WebDBCP() {
		try {
			InitialContext context = new InitialContext();
			ds = (DataSource)context.lookup("java:/comp/env/jdbc/TestDB");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getCon() {
		Connection con = null; 
		try { 
			con = ds.getConnection();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public Statement getSTMT(Connection con) {
		Statement stmt = null; 
		try {
			stmt  = con.createStatement();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return stmt;
	}
	public PreparedStatement getPSTMT(Connection con, String sql) {
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return pstmt ; 
	}
	public void close(Object o ) {
		try {
			if(o instanceof Connection) {
				((Connection)o).close();
			} else if(o instanceof Statement) {
				((Statement)o).close();
			} else if(o instanceof PreparedStatement) {
				((PreparedStatement)o).close();
			} else if(o instanceof ResultSet) {
				((ResultSet)o).close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
