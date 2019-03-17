package controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.bean.MemberBean;
import model.dao.MemberDAO;
import model.service.UpdateMemberService;

@Controller
@SessionAttributes(names= {"photo","name"})
public class UpdateMemberController {
	

	@Autowired
	private UpdateMemberService updateMemberService;
	
	@Autowired
	private MemberDAO memberDAO; 
			
	@InitBinder
	public void registerPropertyEditor(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}

	@RequestMapping(
			path={"/updateRegisterController"}
			)
	public String select(HttpSession session , Model model) {

		
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		
		String memberID = (String) session.getAttribute("user");	
		
		MemberBean membervalue = memberDAO.select(memberID);
		
		model.addAttribute("memberforview",membervalue);
		
		return "readyupdatemember.success";

	}

	
	
	@RequestMapping(
			path= {"/updateRegister1.controller"}
			)
	public String update(Model model,MemberBean bean,HttpServletRequest ID) {
		
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		
		
//		方法二 由前端傳回來的name select出原始的bean(temp)
//		MemberBean temp=memberDAO.selectByUsername(bean.getName());
//		將原始bean(temp)的memberID放入欲更新的bean中
		
//		String temp=(String)ID.getSession().getAttribute("user");
//		bean.setMemberID(temp);
//		上面這兩行是說明把memberID帶入Service

		MemberBean result = updateMemberService.update(bean);
			if(result!=null) {
				model.addAttribute("name",bean.getName());
				model.addAttribute("photo",bean.getProfilePicture());
				return "update.success";
			}
		return null;
	}
}
