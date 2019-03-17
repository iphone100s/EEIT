package controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import model.bean.HouseInformationBean;
import model.bean.OrderHouseBean;
import model.dao.hibernate.HouseInformationDAOhibernate;
import model.dao.hibernate.OrderHouseDAOhibernate;

@Controller

public class OrderListHouseInforSelectController {
	
	@Autowired
	private OrderHouseDAOhibernate orderHouseDAOhibernate;
	@Autowired
	private HouseInformationDAOhibernate houseInformationDAOhibernate;

	@InitBinder
	public void registerPropertyEditor(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));

	}
	

	@RequestMapping(path={"/orderlistdetail.controller"})
	public String method(Model model,String orderHouseNumber, String houseID) {
		System.out.println("----------------Enter OrderListHouseInforSelectController--------------");

		
								
		OrderHouseBean  OrderLisResult = orderHouseDAOhibernate.selectByOrderHouseNumber(orderHouseNumber);
	
		
		HouseInformationBean HouseInforResult =houseInformationDAOhibernate.select(OrderLisResult.getHouseID());

		
		if (OrderLisResult!= null && HouseInforResult!= null ) {
		model.addAttribute("OrderLisResult", OrderLisResult);
		model.addAttribute("HouseInforResult",HouseInforResult);
	
	
		
		}
	
		return "orderlistdetail.servlet";
	}
}

