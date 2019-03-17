package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import model.bean.WishListBean;
import model.dao.WishListDAO;
import model.service.WishListService;

@RestController
public class WishListAjaxController {

	@Autowired
	private WishListService wishListService;

	@Autowired
	private WishListDAO wishListDAO;
	
	@RequestMapping(path = { "checkifExist" })
	public String loadForBeginning(String memberID, String houseID) {
		if (memberID != null) {
			Boolean isExist = wishListService.check(memberID, houseID);
			if (isExist == false) {
				return "notExist";
			}else if(isExist==true) {
				return "isExist";
			}
		}
		return null;
	}

	@RequestMapping(path = { "addwishList" })
	public String addInWish(String memberID, String houseID) {
		if (memberID != null) {
			Boolean isExist = wishListService.check(memberID, houseID);
			if (isExist == false) {
				WishListBean bean = new WishListBean();
				bean.setMemberID(memberID);
				bean.setHouseID(houseID);
				wishListService.add(bean);
				return "true";
			}else if(isExist==true) {
				wishListDAO.delete(memberID,houseID);
				return "false";
			}
		}
		return null;
	}

}
