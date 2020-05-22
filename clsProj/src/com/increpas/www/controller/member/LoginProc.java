package com.increpas.www.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.increpas.www.controller.ClsController;
import com.increpas.www.dao.MemberDao;

public class LoginProc implements ClsController {
	MemberDao mDao =  null;
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = null;
		req.setAttribute("reDirect",true);
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		int cnt = 0; 
		mDao = new MemberDao();
	
		cnt = mDao.getCount(id, pw);
		if(cnt==1) {
			view = "/clsProj/main/main.cls";
			HttpSession session = req.getSession();
			session.setAttribute("SID", id);
		} else {
			view = "/clsProj/member/login.cls";
		}
	
		return view;
	}
}
