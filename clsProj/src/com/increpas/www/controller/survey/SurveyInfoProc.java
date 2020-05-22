package com.increpas.www.controller.survey;

import java.io.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.dao.*;

@WebServlet("/survey/surveyInfoProc.ck")
public class SurveyInfoProc extends HttpServlet {

	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) {
		int cnt = 0;
		int sino = 0;
		System.out.println("@@@@@@@");
		//전달받은 데이터 꺼내고
		String title = req.getParameter("title");
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		
		//데이터 베이스 작업하고
		SurveyDAO sDAO = new SurveyDAO();
			sino = sDAO.addSurveyInfo(title, start, end);
			if(sino != 0) {
				cnt = 1;
			}
		try {
			PrintWriter pw = resp.getWriter();
			pw.print("{");
			pw.print("	\"cnt\":" + cnt + "," );
			pw.print("	\"sino\":" + sino);
			pw.print("}");
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
}
