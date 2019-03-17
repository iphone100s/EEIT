package model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.HouseInformationBean;
import model.dao.HouseInformationDAO;



@Service
public class HouseInformationService {
	@Autowired
	private HouseInformationDAO houseInformationDAO;
	
	public HouseInformationBean insert(HouseInformationBean bean) {
		HouseInformationBean result = null;
		if(bean != null) {
			result = houseInformationDAO.insert(bean);
		}
		return result;
	}
	
	public HouseInformationBean select(HouseInformationBean bean) {
		HouseInformationBean result = null;
		if (bean != null && bean.getHouseID().length() !=0) {
			result = houseInformationDAO.select(bean.getHouseID());
		}
		return result;
	}
	
	public List<HouseInformationBean> selectall(HouseInformationBean bean){
		
		List<HouseInformationBean> result = null;
		if(bean!=null) {
			List<HouseInformationBean> temp = houseInformationDAO.selectall(bean);
			result = new ArrayList<HouseInformationBean>();
			result.addAll(temp);

		}else {
			result = houseInformationDAO.selectall(bean);
		}
		return result;
	}
	
	public List<HouseInformationBean> selectcountry(HouseInformationBean bean){
		
		List<HouseInformationBean> result = null;
		if(bean!=null) {
			List<HouseInformationBean> temp = houseInformationDAO.selectcountry(bean);
			result = new ArrayList<HouseInformationBean>();
			result.addAll(temp);

		}else {
			result = houseInformationDAO.selectcountry(bean);
		}
		return result;
	}
	
	public HouseInformationBean update(HouseInformationBean bean, String houseID) {
		HouseInformationBean result = null;
		if(bean!=null) {
			result = houseInformationDAO.update(bean, houseID);
		}
		return result;
	}
	
	public List<HouseInformationBean> selectmember(HouseInformationBean bean) {
		List<HouseInformationBean> result = null;
		
		if(bean!=null && bean.getMemberID().length() !=0) {
			result = houseInformationDAO.selectmember(bean);
		} else {
			result = null;
		}
		return result;
	}
	
	public HouseInformationBean updateorderdate(HouseInformationBean bean, String houseID){
		HouseInformationBean result = null;
		if(bean!=null) {
			result = houseInformationDAO.updateorderdate(bean, houseID);
		}
		return result;
	}
}
