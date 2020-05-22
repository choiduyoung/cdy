package com.increpas.www.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.increpas.www.controller.ClsController;

public class LogoutProc implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/clsProj/main/main.cls";
		req.setAttribute("reDirect", true);
		HttpSession session = req.getSession();
		session.removeAttribute("SID");
		return view;
	}

}
