package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.HouseInformationBean;
import model.bean.WishListBean;
import model.dao.WishListDAO;

@Service
public class WishListService {
	@Autowired
	private WishListDAO WishListDAO;

	public WishListBean add(WishListBean bean) {
		WishListBean result = null;
		if (bean != null) {
			result = WishListDAO.insert(bean);
		}
		return result;
	}

	public Boolean check(String memberID, String houseID) {
		if (memberID != null && houseID != null) {
			WishListBean result = WishListDAO.select(memberID, houseID);
			if (result != null) {
				return true;
			}
		}
		return false;

	}

//	public List<WishListBean> selectForView(String memberID) {
//		List<WishListBean> result = null;
//		if (memberID != null) {
//			result = WishListDAO.select(memberID);
//		}
//		return result;
//	}
	
	public List<HouseInformationBean> selectForView(String memberID) {
		List<HouseInformationBean> result = null;
		if (memberID != null) {
			result = WishListDAO.selectForList(memberID);
		}
		return result;
	}
}
