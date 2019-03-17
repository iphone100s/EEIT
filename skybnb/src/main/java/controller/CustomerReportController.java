package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import key.Tools;
import model.bean.CustomerReportBean;
import model.service.CustomerReportService;

@Controller
@ComponentScan
public class CustomerReportController {
//	@Autowired
//	private ApplicationContext context;
	@Autowired
	private CustomerReportService customerReportService;

	@RequestMapping(path = { "/report.controller" })
	public String method(String reportTitle , String reportDiscription,String memberReport ,String houseMember ,  Model model) {
	
		Map<String, String> errorMap = new HashMap<>();
		model.addAttribute("errorMsgs", errorMap);
		if (reportTitle == null || reportTitle.length() == 0) {
			// errorMap.put("titleError"," title filed blank !!" );
			errorMap.put("titleError", "Title FileDataSource blank !!");
		}
		if (reportDiscription == null || reportDiscription.length() == 0) {
			errorMap.put("messageError", " Message FileDataSource blank !!");
		}
		if (errorMap != null && !errorMap.isEmpty()) {
			return "report.error";
		} else {
			CustomerReportBean bean = new CustomerReportBean();
			Tools tools = new Tools();
			String id = tools.randID("RN");
			bean.setReportNumber(id);
			bean.setHouseMember(houseMember);
			bean.setMemberReport(memberReport);
			bean.setReportTitle(reportTitle);
			bean.setReportDiscription(reportDiscription);
			bean.setReportStatus(false);
			customerReportService.insert(bean);
			
			return "report.success";

		}

	}
}
