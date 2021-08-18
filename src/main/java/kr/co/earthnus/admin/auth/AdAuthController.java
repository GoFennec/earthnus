package kr.co.earthnus.admin.auth;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class AdAuthController {
	@Autowired
	private AdAuthService Service;
	
	@RequestMapping(value = "/adIndex", method = RequestMethod.GET)
	public String index() {
		return "adIndex";
	}
	
	@RequestMapping(value = "/auth/adLogin", method = RequestMethod.GET)
	public String adLogin() {
		return "auth/adLogin";
	}
	
	@RequestMapping(value = "/auth/adLogin", method = RequestMethod.POST)
	public String adLoginch(@RequestParam("auth_pw") String auth_pw,
			AdAuthBean aBean, HttpSession session, Model model) throws NoSuchAlgorithmException {
		aBean = Service.adLogin(aBean.getAuth_id(), auth_pw);
		
		if(aBean != null) {
			session.setAttribute("auth", aBean);
			return "redirect:/adIndex";
		} else {
			return "auth/adLogin";
		}
	}
	
	@RequestMapping("/adLogout")
	public String adLogout(HttpSession session) {
		session.invalidate();
		return "redirect:auth/adLogin";	
	}
}
