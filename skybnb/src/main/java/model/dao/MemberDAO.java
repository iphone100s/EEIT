package model.dao;

import model.bean.MemberBean;

public interface MemberDAO {
	public abstract MemberBean select(String memberID);
	
	public abstract MemberBean selectByUsername(String account);
	
	public abstract MemberBean insert(MemberBean bean);
	
	public abstract MemberBean update(MemberBean bean);
}
