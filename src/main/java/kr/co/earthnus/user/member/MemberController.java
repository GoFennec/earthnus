package kr.co.earthnus.user.member;


import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.earthnus.user.auth.AuthBean;
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
		memberService.insertMember(memberBean);
		return "redirect:/auth/login";
	}

			
	
			@RequestMapping(value="/join_kakao", method = RequestMethod.GET)
			public String memberJoin_kakao(AuthBean aBean, MemberBean memberBean, Model model, HttpSession session) throws NoSuchAlgorithmException {
				memberBean.setMem_id((String) session.getAttribute("auth_id"));
				memberBean.setMem_name((String) session.getAttribute("auth_name"));
				memberBean.setMem_email((String) session.getAttribute("mem_email"));
				memberBean.setMem_gender((String) session.getAttribute("mem_gender"));
				memberService.insertMember_kakao(memberBean);
				model.addAttribute("MemberBean", memberBean);
				return "redirect:/kakaoLogin";
			}
			//네이버 회원가입
			@RequestMapping(value="/join_naver", method=RequestMethod.GET)
			public String memberJoin_naver(AuthBean aBean, MemberBean memberBean, 
					Model model, HttpSession session) throws NoSuchAlgorithmException {
				memberBean.setMem_id((String) session.getAttribute("mem_id"));
				memberBean.setMem_name((String) session.getAttribute("mem_name"));
				memberBean.setMem_email((String) session.getAttribute("mem_email"));
				memberBean.setMem_tel((String) session.getAttribute("mem_tel"));
				memberBean.setMem_gender((String) session.getAttribute("mem_gender"));
				memberBean.setMem_birth((String) session.getAttribute("mem_birth"));
				memberService.insertMember_naver(memberBean);
				model.addAttribute("MemberBean", memberBean);
				return "redirect:/auth/callback";
			}
			
	
	
			//마이페이지
			@RequestMapping(value="/member/myPage")
			public String myPage(@RequestParam(defaultValue = "1") String pagenum, 
					@RequestParam(defaultValue = "5") String contentnum, HttpSession session, Model model, AuthBean aBean) {
				aBean = (AuthBean) session.getAttribute("auth");
				String mem_id = aBean.getAuth_id();
				memberService.getMyPay(mem_id, pagenum, contentnum, model);
				String myPoint = memberService.myPoint(mem_id);
				String myDonation = memberService.myDonation(mem_id);
				String myDonation_f = memberService.myDonation_f(mem_id);
				String myDonation_o = memberService.myDonation_o(mem_id);
				String myDonation_i = memberService.myDonation_i(mem_id);
				String myDonation_p = memberService.myDonation_p(mem_id);
				
				model.addAttribute("getMyDonation",myDonation);
				model.addAttribute("getMyPoint",myPoint);
				model.addAttribute("getMyDonation_f",myDonation_f);
				model.addAttribute("getMyDonation_o",myDonation_o);
				model.addAttribute("getMyDonation_i",myDonation_i);
				model.addAttribute("getMyDonation_p",myDonation_p);
				return "member/myPage";
			}
			
			
			
			
			
			
			
	//내정보 조회,수정
			@RequestMapping(value="/member/myInfo")
			public String myInfo(HttpSession session, Model model, AuthBean aBean) {
				aBean = (AuthBean) session.getAttribute("auth");
				String mem_id = aBean.getAuth_id();
				MemberBean memberBean = memberService.myInfo(mem_id);
				model.addAttribute("MemberBean",memberBean); 
				return "member/myInfo";
					 
			}
			@RequestMapping(value="/updateMyInfo")
			public String updateMyInfo(MemberBean memberBean,Model model) throws NoSuchAlgorithmException {
				
				memberService.updateMyInfo(memberBean);
				model.addAttribute("MemberBean", memberBean);
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
					map.put("error", true);
				}
					else {map.put("error", false);
						
					}
				
				
			
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
					System.out.println("if");
					map.put("mem_pw", mem_pw);
					String mem_id = aBean.getAuth_id();
					map.put("mem_id", mem_id);
					memberService.updatePw(map);
				} else {
					System.out.println("else");
				map.put("mem_pw", smem_pw);
				String mem_id = aBean.getAuth_id();
				map.put("mem_id", mem_id);
				memberService.updatePw(map);
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
			public String exGoodsList(@RequestParam(defaultValue = "1") String pagenum, 
					@RequestParam(defaultValue = "5") String contentnum, HttpSession session, AuthBean aBean, Model model) {
				aBean = (AuthBean) session.getAttribute("auth");
				String mem_id = aBean.getAuth_id();
				memberService.myOrder(mem_id, pagenum, contentnum, model);//
				//List<ExGoodsBean> list = memberService.myOrder(mem_id);
				//model.addAttribute("myOrder", list);
				return "member/myOrder";
			}
			
			//내가 작성한 글
				@RequestMapping("/member/myMessage")
				public String myMessageList(@RequestParam(defaultValue = "1") String pagenum, 
						@RequestParam(defaultValue = "10") String contentnum, AuthBean aBean, HttpSession session, Model model) {
					aBean = (AuthBean) session.getAttribute("auth");
					String mem_id = aBean.getAuth_id();
					memberService.myMessage(mem_id, pagenum, contentnum, model);//
					return "member/myMessage";
				}
				
				@RequestMapping(value = "/delete_c")
				public String myMessageDelete(HttpSession session, Model model, 
						AuthBean aBean, @RequestParam("cheb_num") int cheb_num, HttpServletResponse response) throws IOException{
					aBean = (AuthBean) session.getAttribute("auth");
					memberService.myMessageDelete(cheb_num);
					//memberService.update_pay_comment(mem_id);
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('삭제 되었습니다.');location.href=\"/member/myMessage\"</script>");
					out.close();
					session.invalidate();
				//	}
					return "redirect: /member/myMessage";
				}
		
			
			
			
			
			
			
		//탈퇴하기 비밀번호 체크, 탈퇴
			@RequestMapping(value="/member/myDelete")
			public String myDelete(HttpSession session, Model model, 
					AuthBean aBean) {
				aBean = (AuthBean) session.getAttribute("auth");
				String mem_id = aBean.getAuth_id();
				MemberBean myInfo = memberService.myInfo(mem_id);
				model.addAttribute("getMyInfo",myInfo);
				return "member/myDelete";
			}
			
			@RequestMapping(value="/pwCheck", method=RequestMethod.POST)
			public String pwCheck(HttpSession session, AuthBean aBean, HttpServletResponse response, @RequestParam("mem_pw")String pw) throws NoSuchAlgorithmException, IOException {
				aBean = (AuthBean) session.getAttribute("auth");
				String mem_id = aBean.getAuth_id();
				String mem_shapw = memberService.pwCheck(mem_id);
				SHA256 sha = new SHA256();
				String smem_pw = sha.encrypt(pw);
				if(mem_shapw.equals(smem_pw)) {
				return "redirect:/deleteMember";
				
				}else {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('비밀번호가 일치하지 않습니다.');location.href=\"member/myDelete\"</script>");
					out.close();
				}				return "member/myDelete";

			}
			
			
			@RequestMapping(value = "/deleteMember")
			public String myDelete(HttpSession session, Model model, 
					AuthBean aBean, HttpServletResponse response, String mem_id) throws IOException{
				aBean = (AuthBean) session.getAttribute("auth");
				mem_id = aBean.getAuth_id();
				int exGoods = memberService.getCheckExgoods(mem_id);
				if(exGoods == 0) {
				memberService.deleteMember(mem_id);
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('탈퇴가 완료 되었습니다.');location.href=\"/\"</script>");
				out.close();
				session.invalidate();
				return "redirect:/";	
				}else {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('배송 완료 되지 않은 지구마켓 상품이 있습니다. 배송 완료 후 탈퇴 가능합니다.');location.href=\"/member/myDelete\"</script>");
					out.close();
				}
				return "redirect: /member/myDelete";
			}
			
	@RequestMapping(value = "/deleteMember_api")
			public String myDelete_api(HttpSession session, Model model, 
					AuthBean aBean, HttpServletResponse response, String mem_id) throws IOException{
				aBean = (AuthBean) session.getAttribute("auth");
				mem_id = aBean.getAuth_id();
				int exGoods = memberService.getCheckExgoods(mem_id);
				if(exGoods == 0) {
				memberService.deleteMember_api(mem_id);
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('탈퇴가 완료 되었습니다.');location.href=\"/\"</script>");
				out.close();
				session.invalidate();
				return "redirect:/";	
			} else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('배송 완료 되지 않은 지구마켓 상품이 있습니다. 배송 완료 후 탈퇴 가능합니다.');location.href=\"/member/myDelete\"</script>");
				out.close();
			}
			return "redirect: /member/myDelete";
		}
		
	
	
	@RequestMapping(value="/member/idcheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam("mem_id") String mem_id, HttpServletRequest request) {
		
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