package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.HouseInformationBean;
import model.service.HouseInformationService;

@Controller
@SessionAttributes(names = { "housemanagement" })
public class HouseManagementController {
	@Autowired
	private HouseInformationService houseInformationService;
	
	@RequestMapping(path = { "housemanagement.controller" })
	public String method(Model model, String housemanagement, HouseInformationBean bean, BindingResult bindingResult) {

		if ("房屋清單".equals(housemanagement)) {
			List<HouseInformationBean> result = houseInformationService.selectmember(bean);
			model.addAttribute("select", result);
			return "manage";
		} else if ("上架房屋".equals(housemanagement)) {
			return "upload";
		}else  {
			return "upload.success";
		}
	}
}
