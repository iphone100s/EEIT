package model.dao;

import java.util.List;

import model.bean.HouseInformationBean;
import model.bean.WishListBean;

public interface WishListDAO {
	
	public abstract WishListBean insert(WishListBean bean);
	public abstract WishListBean select(String memberID, String houseID);
//	public abstract List<WishListBean> select(String memberID);
	public abstract List<HouseInformationBean> selectForList(String memberID);
	public abstract boolean delete(String memberID, String houseID);
}
