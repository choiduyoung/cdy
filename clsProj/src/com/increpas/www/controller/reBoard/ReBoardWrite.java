package com.increpas.www.controller.reBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.ClsController;

public class ReBoardWrite implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String viwe = "/reBoard/reBoardWrite.jsp";
		
		return viwe;
	}

}
