package com.increpas.www.controller.add;

import java.io.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.*;
import com.increpas.www.dao.*;
import com.increpas.www.vo.*;

@WebServlet("/add/getInfo.ck")
public class GetInfo extends HttpServlet{
	
	public void service(HttpServletRequest req, HttpServletResponse resp) {
		
		String sno = req.getParameter("mno");
		int mno = Integer.parseInt(sno);
		
		AddDAO aDAO = new AddDAO();
		MemberVO mVO = aDAO.getInfo(mno);
		resp.setCharacterEncoding("UTF-8");
		
		try {
			PrintWriter pw = resp.getWriter();
			pw.print("{");
			pw.print("	\"id\": \"" + mVO.getId() + "\",");
			pw.print("	\"name\":\"" + mVO.getName() + "\",");
			pw.print("	\"mail\":\"" + mVO.getMail());
			pw.print("}");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
