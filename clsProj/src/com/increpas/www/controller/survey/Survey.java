package com.increpas.www.controller.survey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.increpas.www.controller.ClsController;
import com.increpas.www.dao.SurveyDAO;
import com.increpas.www.vo.SurveyVO;

public class Survey implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/survey/survey.jsp";
		// 필요한 데이터가 없으므로 질의 명령을 바로 보내고 겨로가를 받자
		
		SurveyDAO sDAO = new SurveyDAO();
		//데이터 베이스 작업하고 결과 받고
		// 필요한 데이터 만들고
		ArrayList<SurveyVO> list = sDAO.getPaper(); 
		int sino = list.get(0).getSino();
		String title = list.get(0).getTitle();
		
		//데이터 넘겨주고
		req.setAttribute("SINO", sino);
		req.setAttribute("TITLE", title);
		req.setAttribute("LIST", list);
		return view;
	}

}
