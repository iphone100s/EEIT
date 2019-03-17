package model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.MemberBean;
import model.dao.MemberDAO;

@Service
public class UpdateMemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberBean update(MemberBean bean) {

		MemberBean result = null;
		if(bean!=null) {
           result = memberDAO.update(bean);
		}
		   return result;
	}
}
