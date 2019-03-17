package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import model.bean.MemberBean;
import model.service.MemberService;

@Controller
@SessionAttributes(names={"user","name","photo"})
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//登入
	@RequestMapping(
			path= {"/login.controller"}
			)
	public String login(String username, String password, Model model) {
			
			MemberBean bean = memberService.login(username, password);
			
			Map<String, String> errors = new HashMap<>();
			model.addAttribute("errorMsgs", errors);
			
			if(bean==null) {
			    errors.put("loginerror","登入帳號或密碼有錯誤。");
			    return "login.error";   
			} else {
			    if(bean.getMemberStatus().equals("2")) {
			     errors.put("loginerror","無法登入，請洽管理員。");
			     return "login.error"; 
			    }
			    if(bean.getMemberStatus().equals("1")) {
			          model.addAttribute("user", bean.getMemberID());
			          model.addAttribute("name", bean.getName());
			          model.addAttribute("photo", bean.getProfilePicture());
			          return "login.member";
			        } else {
			         model.addAttribute("user", bean.getMemberID());
			         model.addAttribute("name", bean.getName());
			         model.addAttribute("photo", bean.getProfilePicture());
			         return "login.administrator";
			        }
			   }
	}
	
	//登出
	@RequestMapping(
			path = { "/logout.controller" }
			)
	 public String logout(SessionStatus sessionStatus) {
	  sessionStatus.setComplete();
	  return "logout.success";
	 }

}

