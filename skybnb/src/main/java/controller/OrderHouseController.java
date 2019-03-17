package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.bean.HouseInformationBean;
import model.bean.OrderHouseBean;
import model.service.HouseInformationService;
import model.service.OrderHouseService;

@Controller
public class OrderHouseController {
	@Autowired
	private OrderHouseService orderHouseService;
	@Autowired
	private HouseInformationService houseInformationService;

	@RequestMapping(path = { "/OrderHouseController" })
	public String OrderHouseMethod(Model model, OrderHouseBean bean, HouseInformationBean housebean) {

		HashMap<String, String> errors = new HashMap<>();
		model.addAttribute("errorMsgs", errors);
		
		OrderHouseBean result = orderHouseService.insert(bean);
		HouseInformationBean update = houseInformationService.updateorderdate(housebean, bean.getHouseID());
		if (result == null || update == null) {
			errors.put("action", "Insert fail");
		} else {
			model.addAttribute("number", result.getOrderHouseNumber());
			model.addAttribute("nextpagebean", bean);
			return "order.success";
		}

		return "order.error";
	}
	
	@RequestMapping(path = { "/OrderHouseNextPageController" })
	public String OrderHouseNextPageMethod(Model model, OrderHouseBean bean) {
	
		model.addAttribute("nextpagebean", bean);
		
		return "nextpage";
	}
	
	@RequestMapping(		
			path= {"SelectCommentController"}	
			)
	 public String searchmethod(Model model,String houseinfo,OrderHouseBean bean){	
		
		if("套用".equals(houseinfo)) {
			List<OrderHouseBean> result = orderHouseService.selectcomment(bean);
			model.addAttribute("select",result);
			model.addAttribute("condition",bean);
			return "selectcomment.success";
		}
		return "selectcomment.error";
	 }
}
