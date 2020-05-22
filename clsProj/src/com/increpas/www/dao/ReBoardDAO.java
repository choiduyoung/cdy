package com.increpas.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.increpas.www.DB.WebDBCP;
import com.increpas.www.sql.ReBoardSQL;
import com.increpas.www.vo.ReBoardVO;
public class ReBoardDAO {
	WebDBCP db;
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	ReBoardSQL rSQL;
	
	public ReBoardDAO() {
		//할일
		
		// 1. 데이터베이스 준비
		db = new WebDBCP();
		// 2. 질의명령 사용할 준비 
		rSQL = new ReBoardSQL();
	}
		// 댓글 리스트 조회 전담 처리 함수
	public ArrayList<ReBoardVO> getALLlist(){
		ArrayList<ReBoardVO> list = new ArrayList<ReBoardVO>();
		//할일
		//1. 커넥션 얻어오고
		con = db.getCon();
		//2. 질의명령 가져오고
		String sql = rSQL.getSQL(rSQL.SEL_LIST);
		//3. 스테이트먼트 가저오고
		stmt = db.getSTMT(con);
		try {
			//4. 질의명령 보내고
			
			rs = stmt.executeQuery(sql);
			//5. 결과에서 데이터 꺼내서 vo에 담고
			// 몇개를 꺼내야될지 모르므로 반복해서 꺼낸다.
			while(rs.next()) {
				ReBoardVO rVO = new ReBoardVO();
				rVO.setReno(rs.getInt("reno"));
				rVO.setMno(rs.getInt("mno"));
				rVO.setId(rs.getString("id"));
				rVO.setAvatar(rs.getString("avatar"));
				rVO.setBody(rs.getString("body"));
				rVO.setBody();// 줄바꿈 기호처리
				rVO.setReDate(rs.getDate("redate"));
				rVO.setReTime(rs.getTime("redate"));
				rVO.setsDate();// 원하는 형식의 데이트 변환
				rVO.setStep(rs.getInt("step"));
				//6. vo 리스트에 담고
				list.add(rVO);
			}
			
			//7. 리스트 내보내고
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		return list;
	
	}
	public ArrayList<ReBoardVO> getALLlist(int startCont, int endCont){
		ArrayList<ReBoardVO> list = new ArrayList<ReBoardVO>();
		//할일
		//1. 커넥션 얻어오고
		con = db.getCon();
		//2. 질의명령 가져오고
		String sql = rSQL.getSQL(rSQL.SEL_LIST);
		//3. 스테이트먼트 가저오고
		pstmt = db.getPSTMT(con, sql);
		try {
			//4. 질의명령 보내고
			pstmt.setInt(1, startCont);
			pstmt.setInt(2, endCont);
			rs = pstmt.executeQuery();
			//5. 결과에서 데이터 꺼내서 vo에 담고
			// 몇개를 꺼내야될지 모르므로 반복해서 꺼낸다.
			while(rs.next()) {
				ReBoardVO rVO = new ReBoardVO();
				rVO.setReno(rs.getInt("reno"));
				rVO.setMno(rs.getInt("mno"));
				rVO.setId(rs.getString("id"));
				rVO.setAvatar(rs.getString("avatar"));
				rVO.setBody(rs.getString("body"));
				rVO.setBody();// 줄바꿈 기호처리
				rVO.setReDate(rs.getDate("redate"));
				rVO.setReTime(rs.getTime("redate"));
				rVO.setsDate();// 원하는 형식의 데이트 변환
				rVO.setStep(rs.getInt("step"));
				//6. vo 리스트에 담고
				list.add(rVO);
			}
			
			//7. 리스트 내보내고
		}catch(Exception e) {
			System.out.println("### 디비불러오기 에러###");
		}finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		return list;
		
	}
	public int getTotalCount() {
		int cnt = 0;
		//할일 
		//1. 커넥션 얻어오고
		con = db.getCon();
		//2. 질의명령 가져오고
		String sql = rSQL.getSQL(rSQL.SEL_ALL_CNT);
		//3. 스테이트먼트 얻어오고
		stmt = db.getSTMT(con);
		try {
			
			//4. 질의명령 실어서 보내고 결과 받고
			rs = stmt.executeQuery(sql);
			//5. 데이터 꺼내고
			rs.next();
			cnt = rs.getInt("cnt");
		} catch(Exception e) {
			
		}finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		
		//6. 데이터 내보내고
		return cnt;
	}
	//댓글 입력 데이터베이스 작업 전담 처리 함수
	public int insertReply(String sid, String body, int upno) {
		//반환값 변수 만들고
		int cnt = 0;
		// 할일
		//1. 커넥션 가져오고
		con = db.getCon();
		//2. 질의명령 가져오고
		String sql = rSQL.getSQL(rSQL.ADD_REPL);
		//3. pstmt 가져오고
		pstmt = db.getPSTMT(con, sql);
		try{
			//4. 질의명령 완성하고
				pstmt.setString(1, sid);
				pstmt.setString(2, body);
				pstmt.setInt(3, upno);
			//5. 질의명령 보내고 결과 받고
			cnt = pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(pstmt);
			db.close(con);
		}
		
		
		//6. 데이터 내보내고
		return cnt;
	}
}
