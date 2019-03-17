package model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.bean.HouseInformationBean;
import model.bean.OrderHouseBean;
import model.dao.HouseInformationDAO;
import model.dao.OrderHouseDAO;

@Service
public class OrderHouseService {
	@Autowired
	private OrderHouseDAO orderHouseDAO;
	@Autowired
	private HouseInformationDAO houseInformationDAO;
	
	public OrderHouseBean insert(OrderHouseBean bean) {
		OrderHouseBean result = null;
		if (bean != null) {
			result = orderHouseDAO.insert(bean);
		}
		return result;
	}
	
	public List<OrderHouseBean> selectcomment(OrderHouseBean bean) {
		List<OrderHouseBean> result = null;
		
		if(bean!=null) {
			List<OrderHouseBean> temp = orderHouseDAO.selectcomment(bean);
			result = new ArrayList<OrderHouseBean>();
			result.addAll(temp);

		}else {
			result = orderHouseDAO.selectcomment(bean);
		}
		return result;
	}
	
	public OrderHouseBean orderListBeanUpdate(OrderHouseBean bean) {
		OrderHouseBean result = null;
			
		if(bean!=null ) {
	
			result = orderHouseDAO.update( bean.getOrderHouseNumber(),bean.getStarCount(),bean.getComment(),bean.getCommentStatus());
			
			
			
			return result;
			
		
		}
		
		return null;
	}
	public HouseInformationBean houseInformationBeanUpdate(OrderHouseBean bean) {
		
		OrderHouseBean orderHouseNumberselectResult = null;
		HouseInformationBean houseIDselectResult = null;
		if(bean!=null) {
			houseIDselectResult = houseInformationDAO.select(bean.getHouseID());
			orderHouseNumberselectResult = orderHouseDAO.selectByOrderHouseNumber(bean.getOrderHouseNumber());
			Double starCountAverage = houseIDselectResult.getStarCountAverage();
			Integer starCount = orderHouseNumberselectResult.getStarCount();
			Double newStarCountAverage = 0.0;
			if(starCountAverage==0) {
				newStarCountAverage = Double.valueOf(starCount);	
			}else {
				newStarCountAverage = ( starCountAverage + starCount )/2;
			}
			Integer totalComment = houseIDselectResult.getTotalComment();
			Boolean comment = orderHouseNumberselectResult.getCommentStatus();
			Integer addcomment = 0;
			if(comment==true) {
				
				addcomment = addcomment+1;
				Integer newTotalComment = addcomment + totalComment;
				
				return houseInformationDAO.updateST(bean.getHouseID(),newStarCountAverage,newTotalComment);
			}		
		}
		
		return null;		
	}
	
	public List<Object[]>  join(String memberID) {
		List<Object[]> joinSelect = orderHouseDAO.selectBymemberID02(memberID);

		return joinSelect;
	}
}
