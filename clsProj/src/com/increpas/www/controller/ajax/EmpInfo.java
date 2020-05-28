package com.increpas.www.controller.ajax;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.ClsController;
import com.increpas.www.dao.*;
import com.increpas.www.vo.*;

public class EmpInfo implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("reDirect",null);
		String data = "";
		String sno = req.getParameter("eno");
		int eno = 0;
		try {
			eno = Integer.parseInt(sno);			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("111111" + sno);
		}
		//데이터베이스에 데이터보내고 결과 받고
		EmpDAO eDAO = new EmpDAO();	
		EmpVO eVO = eDAO.getInfo(eno);
		System.out.println("********* evo.eno : " + eVO.getDno());
		StringBuffer buff = new StringBuffer();
		eVO.toString();
		buff.append("{");
		buff.append("	\"eno\": " + eVO.getEno() +",");  
		buff.append("	\"name\":\"" + eVO.getName() +"\",");  
		buff.append("	\"mgr\":\"" + eVO.getMgr()+ "\",");  
		buff.append("	\"hdate\": \""+eVO.getHdate()+"\",");  
		buff.append("	\"sal\":" + eVO.getSal() + ",");   
		buff.append("	\"grade\":" + eVO.getGrade() +",");  
		buff.append("	\"comm\":\"" +eVO.getComm()+ "\",");  
		buff.append("	\"dno\":" +eVO.getDno() + ",");   
		buff.append("	\"dname\":\"" + eVO.getDname()+ "\","); 
		buff.append("	\"loc\":\"" + eVO.getLoc() +"\"");
		buff.append("}");
	
		return buff.toString();
	}

}
