package kr.co.earthnus.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.earthnus.user.member.MemberBean;

@Controller
public class MailController {
	
	@Autowired
	MailService mailService;
	
	//메일 보내기
	@RequestMapping(value="/member/mail", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mail(@RequestParam("mem_email")String mail, @RequestParam("mem_name")String name, HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int i = mailService.mailSendWithPassword(mail, name);
		
		if(i == 0) {
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
	}
	
	@RequestMapping(value="/member/mailCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mailCheck(@RequestParam("mailCheck")String mailCheck, @RequestParam("name")String name, HttpServletRequest request) {
		System.out.println("ajax");
		System.out.println(mailCheck + " MailCheck");
		System.out.println(name + " name");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean correct = mailService.mailCheck(mailCheck, name);
		
		if(correct) {
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
	}
	
	//아이디 비번 찾기
	@RequestMapping(value="/auth/find", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> find(@RequestParam("findName")String findName, @RequestParam("findEmail")String findEmail, HttpServletRequest request) {
		System.out.println("findID");
		System.out.println(findName + " findID");
		System.out.println(findEmail + " findEmail");
		
		boolean correct = mailService.find(findName, findEmail);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(correct) {
			int i = mailService.mailSendWithPassword(findEmail, findName);
			if(i == 0) {
				map.put("error", true);
			}else {
				map.put("error", false);
			}
		}else {
			map.put("error", false);
		}
		return map;
	}
	
	//아이디 찾기에서 인증번호 확인
	@RequestMapping(value="/auth/findID", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findID(@RequestParam("emailPwCheck")String emailPwCheck, @RequestParam("findName")String findName, HttpServletRequest request, Model model) {
		System.out.println(findName + " findID");
		System.out.println(emailPwCheck + " findID");
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean correct = mailService.mailCheck(emailPwCheck, findName);
		
		if(correct) {
			ArrayList<MemberBean> findID = mailService.findID(findName);
			model.addAttribute("findID",findID);
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
	}
}
