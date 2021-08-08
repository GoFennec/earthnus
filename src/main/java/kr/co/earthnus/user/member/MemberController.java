package kr.co.earthnus.user.member;

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
	
	@RequestMapping(value="/member/myInfo")
	public String myInfo(HttpSession session, Model model, AuthBean aBean) {
		aBean = (AuthBean) session.getAttribute("auth");
		String mem_id = aBean.getAuth_id();
		//String mem_id = aBean.getAuth_id();
		System.out.println("controller" + mem_id);
		MemberBean memberBean = memberService.myInfo(mem_id);
		System.out.println("controller " + memberBean.getMem_date());
		model.addAttribute("MemberBean",memberBean); 
		return "member/myInfo";
			 
	}
	/*카카오 로그인
		@RequestMapping(value="/member/join", method=RequestMethod.POST)
		public String kakaoMemberJoin(MemberBean memberBean, String nickname) {
			System.out.println("컨트롤러 카카오 POST");
			System.out.println(memberBean.getMem_addr());
			System.out.println(memberBean.getMem_birth());
			memberService.insertMember(memberBean);
			return "redirect:/";
		}*/
	@RequestMapping(value="/updateMyInfo")
	public String updateMyInfo(MemberBean memberBean,Model model) {
		memberService.updateMyInfo(memberBean);
		System.out.println("이메일수정확인" + memberBean.getMem_email());
		model.addAttribute("MemberBean", memberBean);
		System.out.println("update controller");
		return "redirect:/member/myInfo";
	}
	@RequestMapping(value = "/deleteMember")
	public String deleteMember(MemberBean memberBean, HttpSession session){
		memberService.deleteMember(memberBean);
		session.invalidate();
		return "redirect:/index";			
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

