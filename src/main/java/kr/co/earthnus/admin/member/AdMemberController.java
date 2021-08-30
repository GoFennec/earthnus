package kr.co.earthnus.admin.member;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
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
public class AdMemberController {

	@Autowired
	private AdMemberService adMemberService;
	
	@RequestMapping("/adMember/list")
	public String memberList(HttpServletRequest request, Model model) {
		
		List<MemberBean> memberList = adMemberService.memberList();
		int memberTotal = adMemberService.memberTotal();
		model.addAttribute("memberList",memberList);
		model.addAttribute("memberTotal",memberTotal);
		return "member/adMemberList";
	}
	
	@RequestMapping(value="/adMember/detail")
	public String getMemberDetail(@RequestParam("mem_id") String mem_id, Model model) {
		
		List<MemberBean> memberListDetail = adMemberService.memberListDetail(mem_id);
		String payCount = Integer.toString(adMemberService.payCount(mem_id));
		String payTotal = Integer.toString(adMemberService.payTotal(mem_id));
		String cheerCount = Integer.toString(adMemberService.cheerCount(mem_id));
		model.addAttribute("memberListDetail", memberListDetail);
		model.addAttribute("payCount", payCount);
		model.addAttribute("payTotal", payTotal);
		model.addAttribute("cheerCount", cheerCount);
		return "member/adMemberDetail";
	}
	
	@RequestMapping(value="/adMember/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deletePW(@RequestParam("deletePW") String deletePW, @RequestParam("deleteMember") String deleteMember, HttpServletRequest request) throws NoSuchAlgorithmException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		int delete = adMemberService.deletePW(deletePW);
		
		if(delete > 0) {
			adMemberService.deleteMember(deleteMember);
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
	}
}
