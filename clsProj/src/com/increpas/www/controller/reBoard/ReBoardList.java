package com.increpas.www.controller.reBoard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.ClsController;
import com.increpas.www.dao.ReBoardDAO;
import com.increpas.www.util.PageUtil;
import com.increpas.www.vo.ReBoardVO;

public class ReBoardList implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/reBoard/reBoardList.jsp";
		//받아야할 데이터는 있으므로 꺼내고 
		//데이베이스 작업을 한다.
		int nowPage = 1;
		String strPage = req.getParameter("nowPage");
		try {
			nowPage = Integer.parseInt(strPage);
		
		} catch(Exception e) {}
		
		ReBoardDAO  rDAO = new ReBoardDAO();
		int totalCount = rDAO.getTotalCount();
		PageUtil page = new PageUtil(nowPage, totalCount,3,3);
		ArrayList<ReBoardVO> list = rDAO.getALLlist(page.getStartCont(), page.getEndCont());
		
		//뷰에 데이터 심고
		req.setAttribute("LIST", list);
		req.setAttribute("PAGE", page);
		return view;
	}

}
