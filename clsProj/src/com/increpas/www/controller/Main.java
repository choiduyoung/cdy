package com.increpas.www.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Main extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/main/main.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(view);
		try {
			rd.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
