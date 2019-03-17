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
import model.service.OrderHouseService;


@Controller
public class ScoreController {
	
	@Autowired
	private OrderHouseDAOhibernate orderHouseDAOhibernate;
	@Autowired
	private HouseInformationDAOhibernate houseInformationDAOhibernate;
	
	@Autowired
	private OrderHouseService orderHouseService;
	
	
	@InitBinder
	public void registerPropertyEditor(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
		
	}
	
	@RequestMapping(path={"/backtoorderlistdetail.controller"})
	public String method(Model model,String orderHouseNumber,String houseID,HouseInformationBean bean2,OrderHouseBean bean, String dsubmit){
		

		OrderHouseBean  OrderLisResult = orderHouseDAOhibernate.selectByOrderHouseNumber(orderHouseNumber);
		
		
		HouseInformationBean HouseInforResult =houseInformationDAOhibernate.select(OrderLisResult.getHouseID());
		
		if("ForwardScroe".equals(dsubmit)) {
			bean.setCommentStatus(true);
			
			OrderHouseBean updateResult = orderHouseService.orderListBeanUpdate(bean);
			
			
			HouseInformationBean updateResult2 = orderHouseService.houseInformationBeanUpdate(bean);
		

			model.addAttribute("OrderLisResult",updateResult);
			model.addAttribute("HouseInforResult",updateResult2);
			model.addAttribute("OrderLisResult", OrderLisResult);
			model.addAttribute("HouseInforResult",HouseInforResult);

		}
		return "orderlistdetail.servlet";
	}
}
