package kr.co.earthnus.user.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public String memberJoin() {
		System.out.println("컨트롤러 GET");
		return "/member/join";
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String memberJoin2(MemberBean memberBean) {
		System.out.println("컨트롤러 POST");
		System.out.println(memberBean.getMem_addr());
		System.out.println(memberBean.getMem_birth());
		memberService.insertMember(memberBean);
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/idcheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam("mem_id")String mem_id, HttpServletRequest request) {
		System.out.println("idcheck");
		System.out.println(mem_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int n = memberService.idCheck(mem_id);
		
		if(n > 0) {
			map.put("error", false);
		}else {
			map.put("error", true);
		}
		return map;
	}
	
	@RequestMapping(value="/member/mail", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mail(@RequestParam("mem_email")String mail, HttpServletRequest request) {
		System.out.println("ajax");
		System.out.println(mail);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		memberService.mailSendWithPassword(mail);
		
		if(mail != null) {
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
	}
}
