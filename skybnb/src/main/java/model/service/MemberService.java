package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.MemberBean;
import model.dao.MemberDAO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberBean login(String username, String password) {
		MemberBean bean = memberDAO.selectByUsername(username);
		if(bean!=null) {
			if(password!=null && password.length()!=0) {			
				String pass1 = password;		
				String pass2 = bean.getPassword();
				if(pass1.equals(pass2)) {
					return bean;
				}
			}
		}
		return null;
	}
	
}


