package kr.co.earthnus.admin.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.earthnus.user.member.MemberBean;
import kr.co.earthnus.util.MailBean;

@Controller
public class AdMemberController {

	@Autowired
	private AdMemberService adMemberService;
	
	@RequestMapping("/adMember/list")
	public String memberList(HttpServletRequest request, Model model) {
		
		List<MemberBean> memberList = adMemberService.memberList();
		model.addAttribute("memberList",memberList);
		return "member/adMemberList";
	}
}
