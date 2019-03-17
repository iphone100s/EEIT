package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.MemberBean;
import model.dao.MemberDAO;

@Service
public class RegisterService {

	@Autowired
	private MemberDAO memberDAO;	
	public MemberBean insert(MemberBean bean) {
		MemberBean result = null;
		if(bean!=null) {
			result = memberDAO.insert(bean);
		}
		return result;
	}

}
