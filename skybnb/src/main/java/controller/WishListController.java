package controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.bean.HouseInformationBean;
import model.service.WishListService;

@Controller
public class WishListController {
	@Autowired
	private WishListService wishListService;
	
	@RequestMapping(
			path={"wishlistcontroller"}
			)
	public String method(Model model, String memberID 
			) throws IOException {
		
			List<HouseInformationBean> result = wishListService.selectForView(memberID);
			model.addAttribute("selectForList", result);
			return "wishlist";
	}
	
}
