package com.increpas.www.controller.board;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.ClsController;
import com.increpas.www.dao.*;
import com.increpas.www.vo.*;
import com.increpas.www.util.*;

public class BoardList implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/board/boardList.jsp";
		int nowPage = 1;
		String strPage = req.getParameter("nowPage");
		try {
			nowPage = Integer.parseInt(strPage);
		} catch(Exception e) {}
		// 총페이지수
		BoardDAO bDAO = new BoardDAO();
		int totalCount = bDAO.getTotal();
		// 페이지 정보 객체 만들기
		
		PageUtil page = new PageUtil(nowPage, totalCount, 5, 5);
		
		//게시글 가져오고
		ArrayList<BoardVO> list = bDAO.getAllList(page);
		
		// 데이터 뷰에 심고
		req.setAttribute("LIST", list);
		req.setAttribute("PAGE", page);
		
		return view;
	}

}
