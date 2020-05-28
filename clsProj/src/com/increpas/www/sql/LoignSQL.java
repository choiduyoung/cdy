package com.increpas.www.sql;

public class LoignSQL {
	public final int SEL_LOGIN = 1001;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_LOGIN :
			//로그인 처리 해주는 SQL
			buff.append("SELECT ");
			buff.append("count(*) cnt ");
			buff.append("FROM ");
			buff.append("member ");
			buff.append("WHERE ");
			buff.append(" mid =? ");
			buff.append("AND mpw ? ");	
		break;
		}
		return buff.toString();
	}
}
