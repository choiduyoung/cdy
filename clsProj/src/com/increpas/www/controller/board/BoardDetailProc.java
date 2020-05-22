package com.increpas.www.controller.board;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.*;
import com.increpas.www.dao.*;
import com.increpas.www.vo.*;

public class BoardDetailProc implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/board/boardRelay.jsp";
		if((String) req.getSession().getAttribute("SID") == null) {
			req.setAttribute("reDirect", true);
			view = "/clsProj/member/login.cls";
		}
		//할일
		
		//1. 파라미터 받고
		String sno = req.getParameter("bno");
		System.out.println("********** sno : " + sno);
		String strPage = req.getParameter("nowPage");
		//2. 데이터 가공하고
		int bno = 0;
		try {
			bno = Integer.parseInt(sno);
		}catch(Exception e) {}
		//3. 디비에서 데이터 가져오고
		BoardDAO bDAO = new BoardDAO();
		BoardVO bVO = bDAO.getContent(bno); 
		
		//4. 데이터 받고
		
		//4.1 데이터 화면에 심고
		req.setAttribute("nowPage", strPage);
		req.setAttribute("DATA", bVO);
		
		//5. 뷰를 부르고
		return view;
	}

}
