package com.increpas.www.controller.add;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.ClsController;
import com.increpas.www.dao.*;
import com.increpas.www.vo.*;

public class MemberList implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/add/memberList.jsp";
		
		AddDAO aDAO = new AddDAO();
		ArrayList<MemberVO> list = aDAO.getList();
		
		req.setAttribute("LIST", list);
		return view;
	}

}
