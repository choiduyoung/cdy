package com.increpas.www.controller.gBoard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.ClsController;
import com.increpas.www.dao.GBoardDAO;
import com.increpas.www.vo.GBoardVO;
public class GBoardList implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/gBoard/gBoardList.jsp";
		 //할일
		//데이터베이스 작업하고 결과 받고
		GBoardDAO gDAO = new GBoardDAO();
		ArrayList<GBoardVO> list = gDAO.getGList();
		
		
		req.setAttribute("LIST", list);
	
		return view;
	}

}
