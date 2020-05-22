package com.increpas.www.sql;

import com.sun.media.jfxmedia.events.NewFrameEvent;

public class ReBoardSQL {
	public final int SEL_ALL_LIST= 1001;
	public final int SEL_LIST= 1002;
	public final int SEL_ALL_CNT= 1003;
	
	public final int ADD_REPL= 2001;

	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_ALL_LIST :
			buff.append( "SELECT " );
			buff.append( "	rno, reno, remno mno, id, savename avatar, rebody body, reupno upno, redate, step ");
			buff.append ("FROM ");
			buff.append( "	(SELECT ");
			buff.append("		ROWNUM RNO, R.* ");
			buff.append("	 FROM ");
			buff.append("		(SELECT ");
			buff.append("			RENO, REMNO, REBODY, REUPNO, REDATE, (LEVEL -1) step,  ");
			buff.append("			 id, savename ");
			buff.append(" 		 FROM ");
			buff.append("			REBOARD re,avatar a, member m");
			buff.append("		 WHERE ");
			buff.append("			re.isShow = 'Y' ");
			buff.append("			AND m.ano = a.ano ");
			buff.append("			AND remno = m.mno ");
			buff.append("		 START WITH ");
			buff.append("			REUPNO IS NULL ");
			buff.append("		 CONNECT BY ");
			buff.append("			PRIOR RENO = REUPNO  ");
			buff.append("		 ORDER SIBLINGS BY ");
			buff.append("		  	redate DESC ");
			buff.append("		  ) R ");
			buff.append("		) " );
			break;
		case SEL_LIST :
			buff.append( "SELECT " );
			buff.append( "	rno, reno, remno mno, id, savename avatar, rebody body, reupno upno, redate, step ");
			buff.append ("FROM ");
			buff.append( "	(SELECT ");
			buff.append("		ROWNUM RNO, R.* ");
			buff.append("	 FROM ");
			buff.append("		(SELECT ");
			buff.append("			RENO, REMNO, REBODY, REUPNO, REDATE, (LEVEL -1) step,  ");
			buff.append("			 id, savename ");
			buff.append(" 		 FROM ");
			buff.append("			REBOARD re,avatar a, member m");
			buff.append("		 WHERE ");
			buff.append("			re.isShow = 'Y' ");
			buff.append("			AND m.ano = a.ano ");
			buff.append("			AND remno = m.mno ");
			buff.append("		 START WITH ");
			buff.append("			REUPNO IS NULL ");
			buff.append("		 CONNECT BY ");
			buff.append("			PRIOR RENO = REUPNO  ");
			buff.append("		 ORDER SIBLINGS BY ");
			buff.append("		  	redate DESC ");
			buff.append("		  ) R ");
			buff.append("		) " );
			buff.append("WHERE ");
			buff.append("	rno BETWEEN ? AND ? ");

			break;
		case SEL_ALL_CNT :
			buff.append( "SELECT " );
			buff.append( "	count(*) cnt ");
			buff.append ("FROM ");
			buff.append ("	reboard ");
			buff.append ("WHERE ");
			buff.append ("	isshow = 'Y' ");
			break;
		case ADD_REPL :
			buff.append( "INSERT INTO " );
			buff.append ("	reboard(reno, remno, rebody, reupno  ");
			buff.append ("VALUES( ");
			buff.append (" (SELECT NVL(MAX(reno) +1, 1000) FROM redoard	");
			buff.append (" (SELECT mno FROM member WHERE id = ?), ?, ?	");
			buff.append (" ) ");
			break;
		}
		return buff.toString();
	}
}
