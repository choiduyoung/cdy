package com.increpas.www.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.increpas.www.DB.WebDBCP;
import com.increpas.www.sql.AddSQL;
import com.increpas.www.vo.MemberVO;

public class AddDAO {
	WebDBCP db;
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	AddSQL aSQL;
	public AddDAO() {
		db = new WebDBCP();
		aSQL = new AddSQL();
	}
	
	public ArrayList<MemberVO> getList(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		// con
		con = db.getCon();
		
		String sql = aSQL.getSQL(aSQL.SEL_NAME_MNO);
		
		stmt = db.getSTMT(con);
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				MemberVO mVO = new MemberVO();
				mVO.setMno(rs.getInt("mno"));
				mVO.setName(rs.getString("name"));
				list.add(mVO);
			}
		} catch(Exception e) {
			
		}finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		return list;
	}
	
	public MemberVO getInfo(int mno) {
		MemberVO mVO = new MemberVO();
		con = db.getCon();
		String sql = aSQL.getSQL(aSQL.SEL_INFO);
		pstmt = db.getPSTMT(con, sql);
		try {
			pstmt.setInt(1, mno);
			rs = pstmt.executeQuery();
			rs.next();
			mVO.setId(rs.getString("id"));
			mVO.setName(rs.getString("name"));
			mVO.setMail(rs.getString("mail"));
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		return mVO;
	}
}
