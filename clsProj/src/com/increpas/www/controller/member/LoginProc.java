package com.increpas.www.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.ClsController;
import com.increpas.www.dao.LoginDao;

public class LoginProc implements ClsController {

	LoginDao dao = null;
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
			String view = null;
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			
			int cnt = 0;
			dao = new LoginDao();
			cnt = dao.getCnt(id, pw);
			if (cnt == 1) {
				view = "/member/Login.jsp";
			}else {
				view ="/member/Login.jsp";
			}
		return null;
	}

}
