package kr.co.earthnus.user.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	//회원가입
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String memberJoin2(MemberBean memberBean, @RequestParam("mem_email")String mem_email, @RequestParam("mailCheck")String mailCheck,HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
		System.out.println("컨트롤러 POST");
		
		System.out.println(mailCheck);
		System.out.println(mem_email);
		
		int mail = memberService.mailCheck(mailCheck, mem_email);
		System.out.println(mail);
		if(mail == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('올바르지 않은 이메일 인증번호입니다. \n 다시 한번 이메일을 확인하여주세요.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			out.close();
			return "/member/join";
		}else {
			memberService.insertMember(memberBean);
			return "redirect:/";
		}
	}
	
	//아이디 중복체크
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
	
	//메일 보내기
	@RequestMapping(value="/member/mail", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mail(@RequestParam("mem_email")String mail, @RequestParam("mem_name")String name, HttpServletRequest request) {
		System.out.println("ajax");
		System.out.println(mail + " mail");
		System.out.println(name + " name");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int i = memberService.mailSendWithPassword(mail, name);
		
		if(i == 0) {
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
	}
	
//	@RequestMapping(value="/member/mailCheck", method=RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> mailCheck(@RequestParam("mailCheck")String mailCheck, @RequestParam("email")String email, HttpServletRequest request) {
//		System.out.println("ajax");
//		System.out.println(mailCheck);
//		System.out.println(email);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		mail = memberService.mailCheck(mailCheck, email);
//		
//		if(mail == 1) {
//			map.put("error", true);
//		}else {
//			map.put("error", false);
//		}
//		return map;
//	}
}
