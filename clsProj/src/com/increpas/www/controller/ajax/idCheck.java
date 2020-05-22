package com.increpas.www.controller.ajax;

import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.dao.MemberDao;


@WebServlet("/member/id.ck")
public class idCheck extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) {
		//할일 
		//1. 데이터 받고
		String sid = req.getParameter("id");
		System.out.println(sid);
		//2. 데이터베이스 작업해서 결과 받고
		MemberDao mDao=new MemberDao();
		int cnt = mDao.getIdCnt(sid);
		System.out.println("$$$$$$$$$" + cnt);
		//3. 결과를 제이슨 문서로 만들어서 응답 해주고
		PrintWriter pw = null;
		try {
			pw = resp.getWriter();
			pw.println("{");
			pw.println("	\"cnt\":"+cnt);
			pw.println("}");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
