package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.AioCheckOutOneTime;
import key.Tools;
import model.bean.HouseInformationBean;
import model.bean.OrderHouseBean;
import model.dao.HouseInformationDAO;

@RestController
public class OPayController {
	@Autowired
	private HouseInformationDAO houseInformationDAO;
	
	private AllInOne all;
	
	public void initial(){
		all = new AllInOne("");
	}
	
	@RequestMapping(
			method = RequestMethod.POST,
			path = { "OPayController" }
			)
	public String paymethod(OrderHouseBean bean) {
		
		HouseInformationBean housebean = houseInformationDAO.select(bean.getHouseID());
		
		initial();

		AioCheckOutOneTime aio = new AioCheckOutOneTime();
		aio.setStoreID(bean.getHouseID());
		Tools tool = new Tools();
		aio.setMerchantTradeNo(tool.randID("ON"));
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date time = new java.util.Date();
		String reportDate = df.format(time);
		aio.setMerchantTradeDate(reportDate);
		aio.setTotalAmount(new String(""+bean.getCheckoutAmount()));
		aio.setTradeDesc("測試第一筆交易");
		aio.setItemName(housebean.getHouseName());
		aio.setReturnURL("http://localhost:8080/skybnb/successLinePay.jsp");
		aio.setNeedExtraPaidInfo("N");
		aio.setHoldTradeAMT("0");
		aio.setUseRedeem("N");
		aio.setRedeem("N");
		aio.setOrderResultURL("http://localhost:8080/skybnb/successLinePay.jsp");
	

		String html = all.aioCheckOut(aio, null);

		return html;
	}

}
