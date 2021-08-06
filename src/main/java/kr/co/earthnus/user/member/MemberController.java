package kr.co.earthnus.user.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
