package kr.co.earthnus.user.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.earthnus.user.auth.AuthBean;
import kr.co.earthnus.user.donation.DonationBean;

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
	
}

