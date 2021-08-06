package kr.co.earthnus.user.pay;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.earthnus.user.auth.AuthBean;
import kr.co.earthnus.user.member.MemberBean;

@Controller
public class PayController {
	
	@Autowired
	private PayService payService;

	@RequestMapping("/pay/pay")
	public String getPayInfo(@ModelAttribute PayBean pBean, HttpSession session, Model model) {
		model.addAttribute("pay", pBean);
		AuthBean auth = (AuthBean)session.getAttribute("auth");
		if (auth != null) {
			model.addAttribute("member", payService.getMemberInfo(auth));
		}	
		return "pay/pay";
	}
	
	@RequestMapping("/pay/kakaoPay")
	public String getKakaoPay(@ModelAttribute MemberBean mBean, @ModelAttribute PayBean pBean, Model model) {
		model.addAttribute("member", mBean);
		model.addAttribute("pay", pBean);
		return "pay/kakaoPay";
	}
}
