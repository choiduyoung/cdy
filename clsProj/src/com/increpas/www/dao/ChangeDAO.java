package com.increpas.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.increpas.www.DB.WebDBCP;
import com.increpas.www.sql.ChangeSQL;
import com.increpas.www.vo.ChangeVO;
public class ChangeDAO {

		WebDBCP db;
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs;
		
		ChangeSQL bSQL;
	public ChangeDAO() {
			db = new WebDBCP();
			bSQL = new ChangeSQL();
			
	}
	
	public ChangeVO getMemberInfo(String mno) {
		ChangeVO vo = new ChangeVO();
		
		String sql = bSQL.getSQL(bSQL.SEL_LIST);
		
		try {
			con = db.getCon();
			
			pstmt = db.getPSTMT(con, sql);
			
			pstmt.setString(1,mno);
			
			// 4. 질의명령 stmt에 실어서 보내고 결과 받고
			rs = pstmt.executeQuery();
			
			// 5. 하나씩 꺼내서 VO에 담고
			while(rs.next()) {
				//vo 만들고
				//mname, mid, mtel, memail
				
				vo.setMno(rs.getString("mno"));
				vo.setMpw(rs.getString("mpw"));
				vo.setMname(rs.getString("mname"));
				vo.setMid(rs.getString("mid"));
				vo.setMtel(rs.getString("mtel"));
				vo.setMemail(rs.getString("memail"));
				vo.setIsshow(rs.getString("isshow"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		return vo;
	}

	public int setChgInfo(ChangeVO memberInfo) {
		
		String sql = bSQL.getSQL(bSQL.SEL_CHANG);
		
		int cnt = 0;
		
		try {
			con = db.getCon();
			
			pstmt = db.getPSTMT(con, sql);
			
			pstmt.setString(1,memberInfo.getMpw());
			pstmt.setString(2,memberInfo.getMname());
			pstmt.setString(3,memberInfo.getMtel());
			pstmt.setString(4,memberInfo.getMemail());
			pstmt.setString(5,memberInfo.getIsshow());
			pstmt.setString(6,memberInfo.getMno());
			
			
			cnt = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		return cnt;
	}
}
	
