package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.bean.HouseInformationBean;
import model.service.HouseInformationService;

@Controller
public class HouseInformationController {
	@Autowired
	private HouseInformationService houseInformationService;
	
	@RequestMapping(
			path={"houseinformation.controller"}
			)
	public String method(Model model, String action, HouseInformationBean bean
			) throws IOException {
		
		if ("linkToUpdate".equals(action)) {
			HouseInformationBean result = houseInformationService.select(bean);
			model.addAttribute("selectForOne", result);
			return "change";
		} else if ("preview".equals(action)) {
			HouseInformationBean result = houseInformationService.select(bean);
			model.addAttribute("selectForOne", result);
			return "preview";
		} else if ("upload".equals(action)) {
			HouseInformationBean result = houseInformationService.insert(bean);
			if (result == null) {
				// errors.put("action", "Insert fail");
			} else {
				model.addAttribute("insert", result);
			}
			return "upload.success";
		} else if ("update".equals(action)) {
			HouseInformationBean result = houseInformationService.update(bean, bean.getHouseID());
			if (result == null) {
				// errors.put("action", "Update fail");
			} else {
				model.addAttribute("update", result);
			}
			return "change.success";
		} else {
			return "manage";
		}
	}
	
	@RequestMapping(		
			path= {"search.wellChoosen"}	
			)
	public String wellChoosen(Model model,HouseInformationBean bean) {	

		List<HouseInformationBean> result = houseInformationService.selectall(bean);	
		model.addAttribute("select",result);
		return "searchresult.wellChoosen";
	}
	
	@RequestMapping(		
			path= {"SearchController"}	
			)
	 public String searchmethod(Model model,String houseinfo,HouseInformationBean bean){	

		HashMap<String, String> errors = new HashMap<>();
		model.addAttribute("errorMsgs", errors);	
		
		if("套用".equals(houseinfo)) {
			List<HouseInformationBean> result = houseInformationService.selectall(bean);
			model.addAttribute("select",result);
			model.addAttribute("condition",bean);
			return "searchresult.controller";//要導向的頁面,在spring-views.xml中註冊	
		}
		if("搜尋".equals(houseinfo)){

			List<HouseInformationBean> result = houseInformationService.selectcountry(bean);
			if(result.isEmpty()) {

				errors.put("searcherror", "<div class=\"row\"><h4 class=\"ml-5\">我們找不到符合搜尋條件的內容。請試著搜尋其他關鍵字。</h4></div>");
				return "searchresult.controller";
			}else {
				model.addAttribute("select",result);
				model.addAttribute("condition",bean);
				return "searchresult.controller";
			}
		}
		return "searchresult.controller";
	 }

}
