package com.increpas.www.sql;

public class GBoardSQL {
	public final int SEL_LIST = 1001;
	
	public final int SEL_ID_CNT = 1002;
	
	public final int ADD_DATA = 2001;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_LIST:
			buff.append("SELECT ");
			buff.append("gno, gmno, id, gdate, gbody, savename avatar ") ;
			buff.append("FROM ");
			buff.append(" gboard, member m, avatar a ");
			buff.append("WHERE ");
			buff.append(" gmno = mno ");
			buff.append("	AND m.ano = a.ano ");
			
			break;

		case SEL_ID_CNT:
			buff.append("SELECT ");
			buff.append("	count(*) cnt ") ;
			buff.append("FROM ");
			buff.append(" gboard ");
			buff.append("WHERE ");
			buff.append(" gmno =  ");
			buff.append("	(SELECT mno FROM member WHERE id =? ) ");
			
			break;
		}
		return buff.toString();
		
	}
}
