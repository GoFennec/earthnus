package kr.co.earthnus.user.member;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.earthnus.user.auth.AuthBean;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public String memberJoin() {
		return "/member/join";
	}
	
	//회원가입
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String memberJoin2(MemberBean memberBean) throws NoSuchAlgorithmException {
		System.out.println(memberBean.getMem_email() + " 컨트롤러에서 메일");
		memberService.insertMember(memberBean);
		return "redirect:/";
	}

	@RequestMapping(value="/member/myPage")
	public String myPoint(HttpSession session, Model model, AuthBean aBean) {
		aBean = (AuthBean) session.getAttribute("auth");
		String mem_id = aBean.getAuth_id();
		System.out.println("mypointcontroller" + mem_id);
		String myPoint = memberService.myPoint(mem_id);
		System.out.println("mypoint" + myPoint);
		String myDonation = memberService.myDonation(mem_id);
		System.out.println("myDonationcontroller" + mem_id);
		System.out.println("MYDONATION" + myDonation);
		System.out.println("mydonation" + myDonation);
		model.addAttribute("myDonation",myDonation);
		model.addAttribute("myPoint",myPoint);
		return "member/myPage";
	}
	
	
	@RequestMapping(value="/member/myInfo")
	public String myInfo(HttpSession session, Model model, AuthBean aBean) {
		aBean = (AuthBean) session.getAttribute("auth");
		String mem_id = aBean.getAuth_id();
		System.out.println("controller" + mem_id);
		MemberBean memberBean = memberService.myInfo(mem_id);
		model.addAttribute("MemberBean",memberBean); 
		return "member/myInfo";
			 
	}

	
	
	@RequestMapping(value="/updateMyInfo")
	public String updateMyInfo(MemberBean memberBean,Model model) {
		memberService.updateMyInfo(memberBean);
		model.addAttribute("MemberBean", memberBean);
		System.out.println("update controller");
		return "redirect:/member/myInfo";
	}

	@RequestMapping(value="/pwCheck", method=RequestMethod.POST)
	public String pwCheck(HttpSession session, AuthBean aBean, @RequestParam("mem_pw")String pw) {
		String mem_id = aBean.getAuth_id();
		System.out.println(mem_id);
		String mem_pw = memberService.pwCheck(mem_id);
		System.out.println(mem_pw);
		if(mem_pw.equals(pw)) {
		return "/deleteMember";
		}else {
		return "member/myDelete";
		}
	}
	
	@RequestMapping(value="/member/myDelete")
	public String myDelete(HttpSession session, Model model, 
			AuthBean aBean) {
		System.out.println("myDelete");
		return "member/myDelete";
	}
	
	@RequestMapping(value = "/deleteMember")
	public String myDelete(HttpSession session, Model model, 
			AuthBean aBean, String mem_id){
		aBean = (AuthBean) session.getAttribute("auth");
		mem_id = aBean.getAuth_id();
		System.out.println("delete controller" + mem_id);
		memberService.deleteMember(mem_id);
		session.invalidate();
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
	
	//메일 보내기
	@RequestMapping(value="/member/mail", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mail(@RequestParam("mem_email")String mail, @RequestParam("mem_id")String id, HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int i = memberService.mailSendWithPassword(mail, id);
		
		if(i == 0) {
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
	}
	
	@RequestMapping(value="/member/mailCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mailCheck(@RequestParam("mailCheck")String mailCheck, @RequestParam("id")String id, HttpServletRequest request) {
		System.out.println("ajax");
		System.out.println(mailCheck + " MailCheck");
		System.out.println(id + " ID");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean correct = memberService.mailCheck(mailCheck, id);
		
		if(correct) {
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
	}
}
