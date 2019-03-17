package model.dao.hibernate;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import key.Tools;
import model.bean.OrderHouseBean;
import model.dao.OrderHouseDAO;

@Repository
public class OrderHouseDAOhibernate implements OrderHouseDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public OrderHouseBean insert(OrderHouseBean bean) {
		if (bean != null) {

			Date date1 = bean.getCheckInDate();
			Date date2 = bean.getCheckOutDate();
			Integer day = new Long(((date2.getTime() - date1.getTime()) / 1000 / 60 / 60 / 24)).intValue();
			Integer amount = day * bean.getCheckoutAmount();

			Tools tool = new Tools();
			bean.setOrderHouseNumber(tool.randID("ON"));
			bean.setOrderDate(new java.util.Date());
			bean.setCancelReservation(false);
			bean.setBonus(0);
			bean.setStarCount(0);
			bean.setComment("no Comment");
			bean.setCommentStatus(false);
			bean.setCheckoutAmount(amount);
			this.sessionFactory.getCurrentSession().save(bean);
			return bean;
		}
		return null;
	}

	@Override
	public List<OrderHouseBean> selectcomment(OrderHouseBean bean) {
		ArrayList<String> mapKey = new ArrayList<String>();
		Map<String, Object> params = new HashMap<String, Object>();

		String hql = "from OrderHouseBean where 1=1";

		if (bean.getHouseID() != null && !"".equals(bean.getHouseID())) {
			hql = hql + " and country like :country";
			params.put("houseID", bean.getHouseID());
			mapKey.add("houseID");
		}

		Query hqy = this.sessionFactory.getCurrentSession().createQuery(hql);

		for (String str : mapKey) {
			hqy.setParameter(str, params.get(str));

		}
		List<OrderHouseBean> listbean = hqy.list();

		return listbean;
	}

	@Override
	public OrderHouseBean selectByOrderHouseNumber(String orderHouseNumber) {

		return this.sessionFactory.getCurrentSession().get(OrderHouseBean.class, orderHouseNumber);
	}

	@Override
	public List<OrderHouseBean> select() {

		return this.sessionFactory.getCurrentSession().createQuery("from OrderHouseBean", OrderHouseBean.class).list();
	}

	@Override
	public List<OrderHouseBean> selectBymemberID(String memberID) {
		String selectBymemberID = "from OrderHouseBean  WHERE memberID = :memberID ";
		return this.sessionFactory.getCurrentSession().createQuery(selectBymemberID, OrderHouseBean.class).setParameter("memberID", memberID)
				.list();
	}

	@Override
	public OrderHouseBean update(String orderHouseNumber, Integer starCount, String comment, Boolean commentStatus) {
		
		OrderHouseBean list = this.sessionFactory.getCurrentSession().get(OrderHouseBean.class, orderHouseNumber);
		if (list != null) {

			list.setStarCount(starCount);
			list.setComment(comment);
			list.setCommentStatus(commentStatus);
		}
		return list;
	}
	
	@Override
	public List<Object[]>  selectBymemberID02(String memberID) {
		List<Object[]> list = this.sessionFactory.getCurrentSession().createQuery(
				"select oh.orderHouseNumber,hi.houseName,hi.houseType,oh.orderDate,oh.checkInDate,oh.checkOutDate,oh.numberOfPeople,oh.bonus,oh.checkoutAmount " +
					    "from OrderHouseBean as oh inner join HouseInformationBean as hi "
					  + "with oh.houseID = hi.houseID where oh.memberID = : memberID ")
			.setParameter( "memberID",memberID).list();
		return list;		
	}
}
