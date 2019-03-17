package model.dao.hibernate;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.HouseInformationBean;
import model.bean.WishListBean;
import model.dao.WishListDAO;

@Repository
public class WishListDAOhibernate implements WishListDAO{
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public WishListBean insert(WishListBean bean) {
		
		if(bean != null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}
	
	@Override
	public WishListBean select(String memberID, String houseID) {
		String hql="from WishListBean where memberID='"+ memberID +"'"+"and houseID='"+houseID+"'";
		WishListBean result = this.getSession().createQuery(hql, WishListBean.class).uniqueResult();
		return result;
	}

//	@Override
//	public List<WishListBean> select(String memberID) {
//		String hql="from WishListBean where memberID=:id ";
//		Query<WishListBean> hqy = this.getSession().createQuery(hql, WishListBean.class);
//		hqy.setParameter("id", memberID);
//		return hqy.list();
//	}
	
	@Override
	public List<HouseInformationBean> selectForList(String memberID) {
		String sql="Select * From  HouseInformation as hi inner join wishlist as  wi on hi.houseID = wi.houseID where wi.memberID=:id";
		Query<HouseInformationBean> hqy = this.getSession().createNativeQuery(sql, HouseInformationBean.class);
		hqy.setParameter("id", memberID);
		return hqy.list();
	}

	@Override
	public boolean delete(String memberID, String houseID) {
		WishListBean bean = this.select(memberID, houseID);
		if(bean!=null) {
			this.getSession().delete(bean);
			return true;
		}
		return false;
	}



}
