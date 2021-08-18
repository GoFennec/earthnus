package kr.co.earthnus.user.auth;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.earthnus.user.member.MemberBean;

@Controller
public class AuthController {
	@Autowired
	private AuthService service;
	@Autowired
	private KakaoAPI kakao;
	
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/auth/login", method = RequestMethod.GET)
	public String login() {
		return "auth/login";
	}
	
	@RequestMapping(value = "/auth/login", method = RequestMethod.POST)
	public String loginch(@RequestParam("auth_pw") String auth_pw,
			AuthBean aBean, HttpSession session, Model model) throws NoSuchAlgorithmException {
		model.addAttribute("id", aBean.getAuth_id());
		System.out.println(auth_pw);
		aBean = service.login(aBean.getAuth_id(), auth_pw);
		if(aBean != null) {
			session.setAttribute("auth", aBean);
			System.out.println("로그인쪽 세션"+session);
			return "redirect:/";
		} else {
			return "auth/login";
		}
	}
	
	@RequestMapping("/logout")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";	
	}
	
	@RequestMapping("/auth/find")
	public String find() {
		return "/auth/find";	
	}
	
	@RequestMapping("/auth/findPW")
	public String findPW() {
		return "/auth/findPW";	
	}
	
	
	// 카카오로그인

	@RequestMapping(value = "/kakaoLogin")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session, Model model, AuthBean aBean, MemberBean mBean) {

		System.out.println("code : " + code);
		String access_Token = kakao.getAccessToken(code);
		System.out.println("controller access_token : " + access_Token);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);
		if (userInfo.get("email") != null) {
			System.out.println("email not null");
			session.setAttribute("auth_id", userInfo.get("email"));
			session.setAttribute("auth_name", userInfo.get("nickname"));
			String auth_id = (String) session.getAttribute("auth_id");
			System.out.println("어쓰아이디" + auth_id);
		
			session.setAttribute("access_Token", access_Token);
			aBean = service.kakaoLogin(auth_id);
			model.addAttribute("aBean", aBean);
			if (aBean == null) {
				return "redirect:member/join_kakao";
			} else {
				session.setAttribute("auth", aBean);
				return "redirect:/";
			}
		} else {
			return "/auth/login";
		}
	}

//카카오 로그아웃
	@RequestMapping(value = "/kakaoLogout")
	public String logout(HttpSession session) {
		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("auth_id");
		return "index";
	}
	
	
	//네이버
	@RequestMapping(value="/callback", method=RequestMethod.GET)
	public String callback(HttpSession session) {
		
		return "/auth/callback";
	}

	
	
	
	
	
	
	
	
	
}
