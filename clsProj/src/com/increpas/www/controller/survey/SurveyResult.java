package com.increpas.www.controller.survey;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.ClsController;
import com.increpas.www.dao.SurveyDAO;
import com.increpas.www.vo.SurveyVO;

public class SurveyResult implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/survey/surveyResult.jsp";
			//할일 
			//1. 파라미터 받고
			String strsino = req.getParameter("sino");
			System.out.println(strsino);
			int sino = 0;
			try {
				sino = Integer.parseInt(strsino);
			} catch(Exception e) {}
			
			SurveyDAO sDAO = new SurveyDAO();
			
			ArrayList<SurveyVO> list = sDAO.getResult(sino);
			System.out.println(sino);
			req.setAttribute("LIST", list);
			req.setAttribute("TITLE", list.get(0).getTitle());
		return view;
	}

}
