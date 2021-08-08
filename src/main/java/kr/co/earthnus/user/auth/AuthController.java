package kr.co.earthnus.user.auth;

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
			AuthBean aBean, HttpSession session, Model model) {
		model.addAttribute("id", aBean.getAuth_id());
		aBean = service.login(aBean.getAuth_id(), auth_pw);
		if(aBean != null) {
			session.setAttribute("auth", aBean);
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
}
