package controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import model.service.OrderHouseService;

@Controller

public class OrderListController {
	@Autowired
	private OrderHouseService orderHouseService;

	@InitBinder
	public void registerPropertyEditor(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
		
	}

	@RequestMapping(path = { "/orderlistselect.controller" })

	public String method(Model model,String memberID) {

		
		List<Object[]> HQLJoinResult = orderHouseService.join(memberID);
		
			
		if (HQLJoinResult == null) {			

		} else {
			model.addAttribute("select", HQLJoinResult);
			
		}
		return "orderlistselect.servlet";
	

	}

}
