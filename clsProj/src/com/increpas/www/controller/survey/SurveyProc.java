package com.increpas.www.controller.survey;

import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.ClsController;
import com.increpas.www.dao.SurveyDAO;

public class SurveyProc implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/clsProj/survey/surveyResult.cls";
		req.setAttribute("reDirect", true );
		
		String strsion = req.getParameter("sino");
		String id = (String) req.getSession().getAttribute("SID");
		if(id == null || id.length() == 0 ) {
			view = "/clsProj/survey/survey.cls";
			return view;
		}
		int sino = 0;
		try {
			sino =Integer.parseInt(strsion);
		} catch(Exception e) {
			view = "/clsProj/survey/survey.cls";
			return view;
		}
		//설문문항번호를 키값을 하고 선택보기를 데이터로 가지는 맴을 만든다.
		//일단 키들만 뽑아온다.
		String[] arrsno = req.getParameterValues("sno");
		System.out.println(Arrays.toString(arrsno));
		HashMap<Integer, String> map = new HashMap<Integer, String>();
		for(String tno : arrsno) {
			int no = Integer.parseInt(tno);
			map.put(no, req.getParameter(tno));
		}
		
		
		//System.out.println("*************** strsino :" + strsion);
		
		//System.out.println("*********** sno[0] :" + arrsno[0]);
		
		//String strval1 = req.getParameter(arrsno[0]);
		//System.out.println("###### 첫문항 선택값 : " + strval1);
		
		//데이터가 준비됬으니 데이터베이스 작업을 한다.
		SurveyDAO sDAO = new SurveyDAO();
		int cnt = sDAO.updateCount(map);
		if(cnt != arrsno.length) {
			view = "/clsProj/survey/survey.cls";
			return view;
		}
		view = view + "?sino=" + sino;
		cnt = sDAO.addRecord(sino, id);
		
		return view;
	}

}
