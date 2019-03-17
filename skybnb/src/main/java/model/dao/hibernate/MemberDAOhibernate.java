package model.dao.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.MemberBean;
import model.dao.MemberDAO;


@Repository
public class MemberDAOhibernate implements  MemberDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public MemberBean select(String memberID) {
//		this.memberBean=this.getSession().get(MemberBean.class, memberID);
		return this.getSession().get(MemberBean.class, memberID);
		
	}

	@Override
	public MemberBean selectByUsername(String account) {
		return this.getSession().createQuery("from MemberBean where account='"+ account +"'", MemberBean.class).uniqueResult();
	}

	
	@Override
	public MemberBean insert(MemberBean bean) {
		if(bean!=null) {
			String id = bean.getMemberID();
			MemberBean temp = this.getSession().get(MemberBean.class, id);
			if(temp==null) {
				this.getSession().save(bean);
				return bean;		
			}
		}

		return bean;
	}
	@Override
	public MemberBean update(MemberBean bean) {

	
		MemberBean temp =this.getSession().get(MemberBean.class, bean.getMemberID());

		if(temp!=null) {
//			temp.setMemberID(bean.getMemberID());

			temp.setAccount(bean.getAccount());
			temp.setNationality(bean.getNationality());
			temp.setLanguage(bean.getLanguage());
			temp.setName(bean.getName());
			temp.setPhone(bean.getPhone());
			temp.setAddress(bean.getAddress());
			temp.setBirthday(bean.getBirthday());
			temp.setProfilePicture(bean.getProfilePicture());
			temp.setPassword(bean.getPassword());
			

			
			return temp;
		}
		
		return null;
	}


}
