package model.dao;

import java.util.List;

import model.bean.HouseInformationBean;

public interface HouseInformationDAO {
	
	public abstract HouseInformationBean insert(HouseInformationBean bean);

	public abstract HouseInformationBean select(String houseID);
	
	public abstract List<HouseInformationBean> houseinforselect();
	
	public abstract List<HouseInformationBean> selectall(HouseInformationBean bean);
	
	public abstract List<HouseInformationBean> selectcountry(HouseInformationBean bean);
	
	public abstract List<HouseInformationBean> selectmember(HouseInformationBean bean);
	
	public abstract HouseInformationBean update(HouseInformationBean bean, String houseID);
	
	public abstract HouseInformationBean updateST(String houseID,Double starCountAverage, Integer totalComment);
	
	public abstract HouseInformationBean updateorderdate(HouseInformationBean bean, String houseID);
}
