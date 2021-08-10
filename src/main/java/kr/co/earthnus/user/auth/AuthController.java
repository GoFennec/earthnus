package kr.co.earthnus.user.auth;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {
	@Autowired
	private AuthService service;
	
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
		if(aBean == null) {
			System.out.println("에이빈 널");
		}
		if(aBean != null) {
			session.setAttribute("auth", aBean);
			//session.setAttribute("auth_id", auth_id);
			//session.setAttribute("auth_name", auth_name);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
