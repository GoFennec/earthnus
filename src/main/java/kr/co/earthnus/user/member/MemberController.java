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

	//마이페이지 구현중
	@RequestMapping(value="/member/myPage")
	public String myPage(HttpSession session, Model model, AuthBean aBean) {
		aBean = (AuthBean) session.getAttribute("auth");
		String mem_id = aBean.getAuth_id();
		System.out.println("mypagecontroller" + mem_id);
		MemberBean memberBean = memberService.myInfo(mem_id);
		//후원금액
		model.addAttribute("MemberBean",memberBean); 
		return "member/myPage";
	}
	
	@RequestMapping(value="/member/pwcheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> pwCheck(@RequestParam("mem_pw")String mem_pw, HttpSession session, AuthBean aBean
			) {
		aBean = (AuthBean) session.getAttribute("auth");
		String mem_id = aBean.getAuth_id();
		System.out.println("pwcheck");
		System.out.println(mem_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int n = memberService.pwCheck(mem_id);
		
		if(n == 1) {
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
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
		model.addAttribute("MemberBean", memberBean);
		System.out.println("update controller");
		return "redirect:/member/myInfo";
	}
	
	
	//delete 오류잡는중
	@RequestMapping(value="/member/myDelete")
	public String myDelete() {
		return "member/myDelete";
	}
	
	@RequestMapping(value = "/deleteMember")
	public String myDelete(HttpSession session, Model model, 
			AuthBean aBean, MemberBean memberBean){
		aBean = (AuthBean) session.getAttribute("auth");
		String mem_id = aBean.getAuth_id();
		System.out.println("delete controller" + mem_id);
		memberService.deleteMember(memberBean);
		session.invalidate();
		return "redirect:/";			
	}
	
	@RequestMapping(value="/member/idcheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam("mem_id") String mem_id, HttpServletRequest request) {
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
	
}
