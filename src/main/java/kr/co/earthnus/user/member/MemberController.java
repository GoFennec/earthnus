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
import kr.co.earthnus.user.pay.PayBean;
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

			
	
			@RequestMapping(value="/join_kakao", method = RequestMethod.GET)
			public String memberJoin_kakao(AuthBean aBean, MemberBean memberBean, Model model, HttpSession session) throws NoSuchAlgorithmException {
				memberBean.setMem_id((String) session.getAttribute("auth_id"));
				memberBean.setMem_name((String) session.getAttribute("auth_name"));
				memberBean.setMem_email((String) session.getAttribute("mem_email"));
				memberBean.setMem_gender((String) session.getAttribute("mem_gender"));
				memberService.insertMember_kakao(memberBean);
				model.addAttribute("MemberBean", memberBean);
				System.out.println("join kakao controller");
				return "redirect:/kakaoLogin";
			}
			//네이버 회원가입
			@RequestMapping(value="/join_naver", method=RequestMethod.GET)
			public String memberJoin_naver(AuthBean aBean, MemberBean memberBean, 
					Model model, HttpSession session) throws NoSuchAlgorithmException {
				memberBean.setMem_id((String) session.getAttribute("mem_id"));
				System.out.println("memid test naver" + (String) session.getAttribute("auth_id"));
				memberBean.setMem_name((String) session.getAttribute("mem_name"));
				memberBean.setMem_email((String) session.getAttribute("mem_email"));
				memberBean.setMem_tel((String) session.getAttribute("mem_tel"));
				memberBean.setMem_gender((String) session.getAttribute("mem_gender"));
				memberBean.setMem_birth((String) session.getAttribute("mem_birth"));
				memberService.insertMember_naver(memberBean);
				model.addAttribute("MemberBean", memberBean);
				System.out.println("join naver controller");
				return "redirect:/auth/callback";
			}
			
	
	
			//마이페이지
			@RequestMapping(value="/member/myPage")
			public String myPage(HttpSession session, Model model, AuthBean aBean) {
				aBean = (AuthBean) session.getAttribute("auth");
				
				String mem_id = aBean.getAuth_id();
				List<PayBean> list = memberService.myPay(mem_id);
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
				model.addAttribute("myPay", list);
				return "member/myPage";
			}
			
	//내정보 조회,수정
			@RequestMapping(value="/member/myInfo")
			public String myInfo(HttpSession session, Model model, AuthBean aBean) {
				aBean = (AuthBean) session.getAttribute("auth");
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
			
			
			
			//비밀번호 변경시 현재 비밀번호 체크, 변경			
			@RequestMapping(value="/cpwCheck", method=RequestMethod.POST)
			@ResponseBody
			public Map<String, Object> cpwCheck(HttpSession session, AuthBean aBean, @RequestParam("mem_pw")String pw) throws NoSuchAlgorithmException {
				aBean = (AuthBean) session.getAttribute("auth");
				Map<String, Object> map = new HashMap<String, Object>();
				
				String mem_id = aBean.getAuth_id();
				String mem_pw = memberService.pwCheck(mem_id);
				SHA256 sha = new SHA256();
				String smem_pw = sha.encrypt(pw);
			
				
					if(mem_pw.equals(smem_pw)) {
						System.out.println("mem_pw" + mem_pw);
						System.out.println("smem_pw" + smem_pw);
					map.put("error", true);
				}
					else {map.put("error", false);
						
					}
				
				System.out.println(map.toString());
				
			
				return map;
				}
			
			
			
			
			
				
			
			
			@RequestMapping(value="/updatePw")
			@ResponseBody
			public Map<String, Object> updatePw( @RequestParam("mem_pw")String mem_pw, Model model, HttpSession session, AuthBean aBean) throws NoSuchAlgorithmException {
				aBean = (AuthBean) session.getAttribute("auth");
				Map<String, Object> map = new HashMap<String, Object>();

				map.put("error", true);
				
				SHA256 sha = new SHA256();
				String smem_pw = sha.encrypt(mem_pw);
				if(smem_pw.equals("mem_pw")) {
					map.put("mem_pw", mem_pw);
					String mem_id = aBean.getAuth_id();
					map.put("mem_id", mem_id);
					memberService.updatePw(map);
				} else {
				map.put("mem_pw", smem_pw);
				String mem_id = aBean.getAuth_id();
				map.put("mem_id", mem_id);
				memberService.updatePw(map);
				System.out.println("비번변경 컨트롤러");
				}
				return map;
			}
			
			
			
			//이메일 변경
			@RequestMapping(value="/updateEmail")
			@ResponseBody
			public Map<String, Object> updateEmail( @RequestParam("mem_email")String mem_email, Model model, HttpSession session, AuthBean aBean) throws NoSuchAlgorithmException {
				aBean = (AuthBean) session.getAttribute("auth");
				Map<String, Object> map = new HashMap<String, Object>();
				

				map.put("error", true);
				
				map.put("mem_email", mem_email);
				String mem_id = aBean.getAuth_id();
				map.put("mem_id", mem_id);
				memberService.updateEmail(map);
				return map;
			}
			
			
			//마이오더
			@RequestMapping("/member/myOrder")
			public String exGoodsList(HttpSession session, AuthBean aBean, Model model) {
				aBean = (AuthBean) session.getAttribute("auth");
				String mem_id = aBean.getAuth_id();
				List<ExGoodsBean> list = memberService.myOrder(mem_id);
				model.addAttribute("myOrder", list);
				return "member/myOrder";
			}
			
			//내가 작성한 글
			@RequestMapping("/member/myMessage")
			public String myMessageList(HttpSession session, AuthBean aBean,Model model) {
				aBean = (AuthBean) session.getAttribute("auth");
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