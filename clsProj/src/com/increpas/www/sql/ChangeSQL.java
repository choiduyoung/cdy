package com.increpas.www.sql;

public class ChangeSQL {
	public final int SEL_LIST = 1001;
	public final int SEL_CHANG = 1002;
	public final int SEL_TALTOC = 1003;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		//회원정보 뿌려주는 SQL
		case SEL_LIST:
			buff.append("SELECT ");
			buff.append("mno, mname, mid, mtel, memail, mpw, isshow ");
			buff.append("FROM member ");
			buff.append("where mno = ? ");
		    break;
		//정보변경 변경 또는 회원 탈퇴 해주는 SQL
		case SEL_CHANG:
			buff.append("UPDATE member ");
			buff.append("SET ");
			buff.append("  mpw = ? ");
			buff.append(", mname = ? ");
			buff.append(", mtel = ? ");
			buff.append(", memail = ? ");
			buff.append(", isshow = ? ");
			buff.append("WHERE mno = ? ");
			break;
		
		}
		return buff.toString();
	}
}
