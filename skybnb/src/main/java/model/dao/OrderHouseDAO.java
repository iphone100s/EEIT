package model.dao;

import java.util.List;

import model.bean.OrderHouseBean;

public interface OrderHouseDAO {
	
	public abstract OrderHouseBean insert(OrderHouseBean bean);
	
	public abstract List<OrderHouseBean> selectcomment(OrderHouseBean bean);
	
	public abstract OrderHouseBean selectByOrderHouseNumber(String orderHouseNumber);
	
	public abstract List<OrderHouseBean> select();
	
	public abstract List<OrderHouseBean> selectBymemberID(String memberID);

	public abstract OrderHouseBean update(String orderHouseNumber,Integer starCount, String comment,Boolean commentStatus);
	
	public abstract List<Object[]> selectBymemberID02(String memberID);
}
