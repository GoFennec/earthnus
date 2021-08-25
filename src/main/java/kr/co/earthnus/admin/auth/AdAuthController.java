package kr.co.earthnus.admin.auth;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.user.pay.PayBean;


@Controller
public class AdAuthController {
	@Autowired
	private AdAuthService Service;
	
	@RequestMapping(value = "/adIndex", method = RequestMethod.GET)
	public String index(Model model) {
		
		List<PayBean> adPayList = Service.adPay();
		model.addAttribute("adPay", adPayList);
		
		List<ExGoodsBean> adGoodsList = Service.adGoods();
		model.addAttribute("adGoods", adGoodsList);
		
		int sumPay = Service.sumPay();
		model.addAttribute("sumPay",sumPay);
		
		int countMember = Service.countMember();
		model.addAttribute("countMember",countMember);
		
		int orderExGoods = Service.orderExGoods();
		model.addAttribute("orderExGoods",orderExGoods);
		
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
