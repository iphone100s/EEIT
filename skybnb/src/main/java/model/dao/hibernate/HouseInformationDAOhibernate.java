package model.dao.hibernate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import key.Tools;
import model.bean.HouseInformationBean;
import model.dao.HouseInformationDAO;

@Repository
public class HouseInformationDAOhibernate implements HouseInformationDAO{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public HouseInformationBean insert(HouseInformationBean bean) {
		
		if(bean != null) {
			Tools tool = new Tools();
			String housenumber = tool.randID("HN");
			bean.setHouseID(housenumber);
			bean.setStarCountAverage(0.0);
			bean.setTotalComment(0);
			this.sessionFactory.getCurrentSession().save(bean);
			return bean;
		}
		return null;
	}

	@Override
	public HouseInformationBean select(String houseID) {
		
		return this.sessionFactory.getCurrentSession().get(HouseInformationBean.class, houseID);
	}
	
	@Override
	public List<HouseInformationBean> selectall(HouseInformationBean bean) {

		ArrayList<String> mapKey = new ArrayList<String>();
		Map<String, Object> params = new HashMap<String,Object>();
        
		String hql = "from HouseInformationBean where 1=1";
		
		if (bean.getCountry() != null && !"".equals(bean.getCountry()) ) {
			hql=hql+" and country like :country";
			params.put("country", bean.getCountry());
			mapKey.add("country");
		}

		if(bean.getHouseSpace() != null && !"".equals(bean.getHouseSpace())) {
			hql=hql+" and housespace like :housespace";
			params.put("housespace", bean.getHouseSpace());
			mapKey.add("housespace");
			
		}
		
		if (bean.getCity() != null && !"".equals(bean.getCity())) {
			String city = bean.getCity().trim();
			hql=hql+" and city like :city ";		
			params.put("city", "%" +city+"%");
			mapKey.add("city");
		}
		//
		if (bean.getPrice() != null && !"".equals(bean.getPrice())) {
			hql=hql+" and price <= :price";
			params.put("price", bean.getPrice());
			mapKey.add("price");
		}
		if (bean.getStartRentTime() != null && !"".equals(bean.getStartRentTime())) {
			hql=hql+" and StartRentTime < :StartRentTime";		
			params.put("StartRentTime",new java.sql.Date(bean.getStartRentTime().getTime()));
			mapKey.add("StartRentTime");
		}
		if (bean.getEndRentTime() != null && !"".equals(bean.getEndRentTime())) {
			hql=hql+" and EndRentTime > :EndRentTime";		
			params.put("EndRentTime",new java.sql.Date(bean.getEndRentTime().getTime()));
			mapKey.add("EndRentTime");
		}
		
		if (bean.getStarCountAverage() != null && !"".equals(bean.getStarCountAverage())) {
			
			
			hql=hql+" and starCountAverage =: starCountAverage";		
			params.put("starCountAverage",bean.getStarCountAverage());
			mapKey.add("starCountAverage");
		}
	

		Query hqy = this.sessionFactory.getCurrentSession().createQuery(hql);
		
	    for (String str : mapKey)
        {
            hqy.setParameter( str, params.get(str));

        }
	
		List<HouseInformationBean> listbean = hqy.list();
		return listbean;

	}

	@Override
	public List<HouseInformationBean> selectcountry(HouseInformationBean bean) {
		
		ArrayList<String> mapKey = new ArrayList<String>();
		Map<String, Object> params = new HashMap<String,Object>();
        
		String hql = "from HouseInformationBean where 1=1";
		
		if (bean.getCountry() != null && !"".equals(bean.getCountry()) ) {
			hql=hql+" and country like :country";
			params.put("country", bean.getCountry());
			mapKey.add("country");
		}
		
		Query hqy = this.sessionFactory.getCurrentSession().createQuery(hql);
		
		
		
	    for (String str : mapKey)
        {
            hqy.setParameter( str, params.get(str));

        }
		List<HouseInformationBean> listbean = hqy.list();
		
		return listbean;
	}

	@Override
	public HouseInformationBean update(HouseInformationBean bean, String houseID) {
		bean.setStarCountAverage(0.0);
		bean.setTotalComment(0);
		HouseInformationBean result =this.sessionFactory.getCurrentSession().get(HouseInformationBean.class, houseID);
		if(result!=null) {
			result.setHouseName(bean.getHouseName());
			result.setHouseType(bean.getHouseType());
			result.setHouseSpace(bean.getHouseSpace());
			result.setMaxPeopleAvailable(bean.getMaxPeopleAvailable());
			result.setCountry(bean.getCountry());
			result.setAddress(bean.getAddress());
			result.setMapLongitude(bean.getMapLongitude());
			result.setMapLatitude(bean.getMapLatitude());
			result.setHousePicture1(bean.getHousePicture1());
			result.setHousePicture2(bean.getHousePicture2());
			result.setHousePicture3(bean.getHousePicture3());
			result.setHousePicture4(bean.getHousePicture4());
			result.setFacility(bean.getFacility());
			result.setHouseIntroduction(bean.getHouseIntroduction());
			result.setHouseRules(bean.getHouseRules());
			result.setPrice(bean.getPrice());
			result.setStartRentTime(bean.getStartRentTime());
			result.setEndRentTime(bean.getEndRentTime());
			result.setFreeCancel(bean.getFreeCancel());
			result.setStarCountAverage(bean.getStarCountAverage());
			result.setTotalComment(bean.getTotalComment());
			return result;
		}
		return null;
	}

	@Override
	public List<HouseInformationBean> selectmember(HouseInformationBean bean) {
		String hql="from HouseInformationBean where memberID=:id ";
		Query<HouseInformationBean> hqy = this.sessionFactory.getCurrentSession().createQuery(hql, HouseInformationBean.class);
		hqy.setParameter("id", bean.getMemberID());
		return hqy.list();
//		return this.getSession().createQuery("from UploadHouseBean where memberID=:id ", UploadHouseBean.class).list();
	}

	@Override
	public List<HouseInformationBean> houseinforselect() {
		
		return this.sessionFactory.getCurrentSession().createQuery("from HouseInformationBean",HouseInformationBean.class).list();
	}

	@Override
	public HouseInformationBean updateST(String houseID, Double starCountAverage, Integer totalComment) {
		HouseInformationBean list =this.sessionFactory.getCurrentSession().get(HouseInformationBean.class, houseID);
		if(list!=null) {
			
			list.setStarCountAverage(starCountAverage);
			list.setTotalComment(totalComment);
			return list;
		}
		return null;
	}

	@Override
	public HouseInformationBean updateorderdate(HouseInformationBean bean, String houseID) {
		HouseInformationBean result =this.sessionFactory.getCurrentSession().get(HouseInformationBean.class, houseID);
		if(result != null) {
			result.setOrderedDates(bean.getOrderedDates());
			return result;
		}
		return null;
	}
}
