package kr.co.earthnus.user.member;


import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
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
import kr.co.earthnus.user.cheBoard.CheBoardBean;
import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.util.SHA256;

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

	//카카오 회원가입
			@RequestMapping(value="/member/join_kakao", method=RequestMethod.GET)
			public String memberJoin_kakao() {
				return "/member/join_kakao";
			}
			
			@RequestMapping(value="/member/join_kakao", method=RequestMethod.POST)
			public String memberJoin_kakao(MemberBean memberBean) throws NoSuchAlgorithmException {
				/*SHA256 sha = new SHA256();
				String smem_pw = sha.encrypt(memberBean.getMem_pw());
				memberBean.setMem_pw(smem_pw);*/
				memberService.insertMember_kakao(memberBean);
				return "redirect:/";
			}
			
			
	
	
			//마이페이지
			@RequestMapping(value="/member/myPage")
			public String myPoint(HttpSession session, Model model, AuthBean aBean) {
				aBean = (AuthBean) session.getAttribute("auth");
				if(aBean == null) {
					return "/auth/login";
				}
				String mem_id = aBean.getAuth_id();
				String myPoint = memberService.myPoint(mem_id);
				String myDonation = memberService.myDonation(mem_id);
				String myDonation_f = memberService.myDonation_f(mem_id);
				System.out.println(mem_id);
				System.out.println("controller mydonation" + myDonation_f);
				String myDonation_o = memberService.myDonation_o(mem_id);
				String myDonation_i = memberService.myDonation_i(mem_id);
				String myDonation_p = memberService.myDonation_p(mem_id);
				model.addAttribute("myDonation",myDonation);
				model.addAttribute("myPoint",myPoint);
				model.addAttribute("myDonation_f",myDonation_f);
				model.addAttribute("myDonation_o",myDonation_o);
				model.addAttribute("myDonation_i",myDonation_i);
				model.addAttribute("myDonation_p",myDonation_p);
				return "member/myPage";
			}
			
	//내정보 비번체크,조회,수정
			@RequestMapping(value="/member/myInfoPwCh", method=RequestMethod.GET)
			public String myInfoPwCh1() {
				return "member/myInfoPwCh";
			}
			
			@RequestMapping(value="/member/myInfoPwCh", method=RequestMethod.POST)
			public String myInfoPwCh2(HttpSession session, AuthBean aBean, @RequestParam("mem_pw")String pw, Model model) throws NoSuchAlgorithmException {
				aBean = (AuthBean) session.getAttribute("auth");
				String mem_id = aBean.getAuth_id();
				System.out.println("myInfoPwCh" + mem_id);
				String mem_pw = memberService.pwCheck(mem_id);
				System.out.println(mem_pw);
				String mem_shapw = memberService.pwCheck(mem_id);
				SHA256 sha = new SHA256();
				String smem_pw = sha.encrypt(pw);
				if(mem_shapw.equals(smem_pw)) {
				return "redirect:/member/myInfo";
				}else {
				return "member/myInfoPwCh"; 
				}
			}
			
			@RequestMapping(value="/member/myInfo")
			public String myInfo(HttpSession session, Model model, AuthBean aBean) {
				aBean = (AuthBean) session.getAttribute("auth");
				if(aBean == null) {
					return "/auth/login";
				}
				String mem_id = aBean.getAuth_id();
				System.out.println("myInfo controller" + mem_id);
				MemberBean memberBean = memberService.myInfo(mem_id);
				System.out.println(memberBean.getMem_addr());
				model.addAttribute("MemberBean",memberBean); 
				return "member/myInfo";
					 
			}
			@RequestMapping(value="/updateMyInfo")
			public String updateMyInfo(MemberBean memberBean,Model model) throws NoSuchAlgorithmException {
				
				memberService.updateMyInfo(memberBean);
				model.addAttribute("MemberBean", memberBean);
				System.out.println("update controller");
				return "redirect:/member/myInfo";
			}
			
			@RequestMapping(value="/updatePw")
			@ResponseBody
			public Map<String, Object> updatePw( @RequestParam("mem_pw")String mem_pw, Model model, HttpSession session, AuthBean aBean) throws NoSuchAlgorithmException {
				aBean = (AuthBean) session.getAttribute("auth");
				Map<String, Object> map = new HashMap<String, Object>();
				if(aBean == null) {
					map.put("error", false);
					map.put("url", "/auth/login");
					return map;
				}
				

				map.put("error", true);
				
				SHA256 sha = new SHA256();
				String smem_pw = sha.encrypt(mem_pw);
				map.put("mem_pw", smem_pw);
				String mem_id = aBean.getAuth_id();
				map.put("mem_id", mem_id);
				memberService.updatePw(map);
				
				return map;
			}
			
			
			
			//마이오더
			@RequestMapping("/member/myOrder")
			public String exGoodsList(HttpSession session, AuthBean aBean,Model model) {
				aBean = (AuthBean) session.getAttribute("auth");
				if(aBean == null) {
					return "/auth/login";
				}
				String mem_id = aBean.getAuth_id();
				List<ExGoodsBean> list = memberService.myOrder(mem_id);
				model.addAttribute("myOrder", list);
				return "member/myOrder";
			}
			
			//내가 작성한 글
			@RequestMapping("/member/myMessage")
			public String myMessageList(HttpSession session, AuthBean aBean,Model model) {
				aBean = (AuthBean) session.getAttribute("auth");
				if(aBean == null) {
					return "/auth/login";
				}
				String mem_id = aBean.getAuth_id();
				List<CheBoardBean> list = memberService.myMessage(mem_id);
				model.addAttribute("myMessage", list);
				return "member/myMessage";
			}
			
			
			
			
			
			
			
			
			
		//탈퇴하기 비밀번호 체크, 탈퇴
			@RequestMapping(value="/member/myDelete")
			public String myDelete(HttpSession session, Model model, 
					AuthBean aBean) {
				System.out.println("myDelete");
				return "member/myDelete";
			}
			
			@RequestMapping(value="/pwCheck", method=RequestMethod.POST)
			public String pwCheck(HttpSession session, AuthBean aBean, @RequestParam("mem_pw")String pw) throws NoSuchAlgorithmException {
				aBean = (AuthBean) session.getAttribute("auth");
				String mem_id = aBean.getAuth_id();
				System.out.println(mem_id);
				String mem_pw = memberService.pwCheck(mem_id);
				System.out.println(mem_pw);
				String mem_shapw = memberService.pwCheck(mem_id);
				SHA256 sha = new SHA256();
				String smem_pw = sha.encrypt(pw);
				if(mem_shapw.equals(smem_pw)) {
					System.out.println(mem_shapw);
					System.out.println(smem_pw);
				return "redirect:/deleteMember";
				}else {
				return "member/myDelete";
				}
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
