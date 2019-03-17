package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import key.Tools;
import model.bean.MemberBean;
import model.service.RegisterService;

@Controller
public class RegisterController {

	@Autowired
	private RegisterService registerService;
	
	@RequestMapping(
			path= {"/Register.controller"}
		,method=RequestMethod.POST	)
	public String method(Model model, MemberBean bean) {

		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		
		
		if (errors != null && !errors.isEmpty()) { 
			return "insert.error";
		}
		
		Tools tools = new Tools();
		bean.setMemberID(tools.randID("MN"));
		bean.setBonus(0);
		bean.setAuthority("0");
		bean.setMemberStatus("1");
		
		MemberBean result = registerService.insert(bean);
		
		if(result==null) {
			errors.put("xxx1", "Insert error");	
			return "insert.error";			
		}
		else {
			
			model.addAttribute("insert", result);				
		}
		return "insert.success";
	}
	
}
