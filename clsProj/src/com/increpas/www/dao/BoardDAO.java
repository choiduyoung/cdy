package com.increpas.www.dao;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.increpas.www.DB.*;
import com.increpas.www.vo.*;
import com.oreilly.servlet.*;
import com.increpas.www.sql.*;
import com.increpas.www.util.PageUtil;
public class BoardDAO {

		WebDBCP db;
		Connection con;
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		
		BoardSQL bSQL;
	public BoardDAO() {
			db = new WebDBCP();
			bSQL = new BoardSQL();
			
		}
	// 총 게시물 수 조회 전담 처리 함수
	public int getTotal() {
		int cnt = 0;
		con = db.getCon();
		String sql = bSQL.getSQL(bSQL.SEL_TOTAL_CNT);
		stmt = db.getSTMT(con);
		try {
			rs = stmt.executeQuery(sql);
			rs.next();
			cnt = rs.getInt("cnt");
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		return cnt;
	}
	//게시판 등록글 가져오기 전담 처리 함수
	public ArrayList<BoardVO> getAllList(PageUtil page){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		//con
		con = db.getCon();
		String sql = bSQL.getSQL(bSQL.SEL_ALL_LIST);
		pstmt = db.getPSTMT(con, sql);
		try {
			pstmt.setInt(1, page.getStartCont());
			pstmt.setInt(2, page.getEndCont());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO bVO = new BoardVO();
				bVO.setRno(rs.getInt("rno"));
				bVO.setBno(rs.getInt("bno"));
				bVO.setTitle(rs.getString("title"));
				bVO.setName(rs.getString("name"));
				bVO.setbDate(rs.getDate("bdate"));
				bVO.setbTime(rs.getTime("bdate"));
				bVO.setSdate();
				bVO.setClick(rs.getInt("click"));
				
				list.add(bVO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		
		return list;
	}
	
	// 게시판 테이블 글 등록 데이터베이스 작업 전담 처리 함수
	public int addBoard(HashMap<String, String> map) {
		int cnt = 0;
		// 할일 
		
		//1. 커넥션 받아오고
		con = db.getCon();
		//2. 질의명령 가져오고
		String sql = bSQL.getSQL(bSQL.ADD_BRD);
		//3. pstmt 가져오고
		pstmt = db.getPSTMT(con, sql);
		try{
			//4. 질의명령 완성하고
			pstmt.setString(1, map.get("id"));
			pstmt.setString(2, map.get("title"));
			pstmt.setString(3, map.get("body"));
			//5. 질의명령 보내고 결과받고
			cnt = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(pstmt);
			db.close(con);
		}
		//6. 결과 내보내고
		return cnt;
	
	}
	// 게시판 파일 정보 등록 전담 처리 함수
	public boolean addImgInfo(FileVO fVO) {
		 boolean bool = false;
		 // 업로드된 파일 갯수
		 int cnt = 0;
		 //데이터베이스에 추가된 행 수
		 int result = 0;
		 //할일
		 // 1. 커넥션 얻어오고
		 con = db.getCon();
		 // 2. 질의명령 가져오고
		 String sql = bSQL.getSQL(bSQL.ADD_BRDIMG);
		 // 3. pstmt 가져오고
		 // 4. 데이터 만들고
		 MultipartRequest multi = fVO.getMulti();
		 
		 Enumeration en = multi.getFileNames();
		 while(en.hasMoreElements()) {
			 pstmt = db.getPSTMT(con, sql);
			 //업로드된 파일의 키(name)값을 알아내고
			 String key = (String) en.nextElement();
			 //해당 키값을 가지고 있는 파일 이름을 알아낸다.
			 String oriname = multi.getOriginalFileName(key);
			 if(oriname == null || oriname.length() == 0) {
				 //이 경우는 파일을 선택하지 않은 경우 이므로 다음 회차로 진행
				 continue;
			 }
			 ++cnt;
			 //실제 저장된 이름을 알아낸다.
			 String savename = multi.getFilesystemName(key);
			 //파일 사이즈 알아내고
			 File file = multi.getFile(key);
			 long len = file.length();
			 
			 try {
				 // 5. 질의명령 완성하고
				 	pstmt.setString(1, fVO.getId());
				 	pstmt.setString(2, oriname);
				 	pstmt.setString(3, savename);
				 	pstmt.setLong(4, len);
				 // 6. 질의명령 보내고 결과받고				 
				 result += pstmt.executeUpdate();
			 } catch(Exception e) {
				 e.printStackTrace();
			 } finally {
				 db.close(pstmt);
			 }
		 }
		 db.close(con);
		 // 7. 결봐 비고해서 반환해주고
		 if(cnt == result) {
			 bool = true;
		 }
		 return bool;
	}
	// 글번호 검색한 해당 글 가져오기 전담 처리 함수
	public BoardVO getContent(int bno) {
		BoardVO bVO = new BoardVO();
		con = db.getCon();
		String sql = bSQL.getSQL(bSQL.EDIT_CLICK_BRD);
		pstmt = db.getPSTMT(con, sql);
		int cnt = 0;
		try {
			pstmt.setInt(1, bno);
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(pstmt);
		}
		if(cnt == 0) {
			System.out.println("### 클릭수 증가 실패 ###");
		}
		sql = bSQL.getSQL(bSQL.SEL_CONT);
		pstmt = db.getPSTMT(con, sql);
		try {
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			System.out.println("************** dao bino : " + 999);
			ArrayList<FileVO> list = new ArrayList<FileVO>();
			for(int i = 0; rs.next(); i++) {
					FileVO fVO = new FileVO();
					if(rs.getInt("bino") != 0 ) {
						fVO.setBino(rs.getInt("bino"));
						System.out.println("************** dao bino : " + fVO.getBino());
						fVO.setOriname(rs.getString("oriname"));
						fVO.setSavename(rs.getString("savename"));
					}
					list.add(fVO);
					
					if(i != 0)  continue;
		
					bVO.setBno(rs.getInt("bno"));
					bVO.setTitle(rs.getString("title"));
					bVO.setBody(rs.getString("body").replaceAll("\r\n", "<br>"));
					bVO.setName(rs.getString("name"));
					bVO.setbDate(rs.getDate("bdate"));
					bVO.setbTime(rs.getTime("bdate"));
					bVO.setSdate();
					bVO.setClick(rs.getInt("click"));
				}
			
			bVO.setFile(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		return bVO;
		
		}
}
	
