package com.increpas.www.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.increpas.www.controller.ClsController;

public class JoinForm implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view ="/member/join.jsp";
		//로그인이 되어 있는지 확인하고 처리한다.
		HttpSession session = req.getSession();
		String sid = (String)session.getAttribute("SID");
		if(sid != null) {
			req.setAttribute("reDirect", true);
			view = "/clsProj/main/main.cls";
		}
		return view;
	}

}
