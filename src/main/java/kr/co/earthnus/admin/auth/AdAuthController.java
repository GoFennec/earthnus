package kr.co.earthnus.admin.auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.earthnus.user.camBoard.camBoardBean;
import kr.co.earthnus.user.cheBoard.CheBoardBean;
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
		for(int i = 0; i < adGoodsList.size(); i++) {
    		String exgnum = adGoodsList.get(i).getExg_num();
    		adGoodsList.get(i).setExg_num(exgnum.substring(0, exgnum.length()-4));   
    	}
		model.addAttribute("adGoods", adGoodsList);
		
		List<camBoardBean> adCamboardList = Service.adCamboard();
		model.addAttribute("adCamboard", adCamboardList);
		
		List<CheBoardBean> adCheboardList = Service.adCheboard();
		model.addAttribute("adCheboard", adCheboardList);
		
		String sumPay = Service.sumPay();
		model.addAttribute("sumPay",sumPay);
		
		int countMember = Service.countMember();
		model.addAttribute("countMember",countMember);
		
		int orderExGoods = Service.orderExGoods();
		model.addAttribute("orderExGoods",orderExGoods);
		
		int todayVisitor = Service.todayVisitor();
		model.addAttribute("todayVisitor",todayVisitor);
		
		return "adIndex";
	}
	
	@RequestMapping(value = "/auth/adLogin", method = RequestMethod.GET)
	public String adLogin() {
		return "auth/adLogin";
	}
	
	@RequestMapping(value = "/auth/adLogin", method = RequestMethod.POST)
	public String adLoginch(@RequestParam("auth_pw") String auth_pw,
			AdAuthBean aBean,HttpServletResponse response, HttpSession session, Model model) throws NoSuchAlgorithmException, IOException {
		model.addAttribute("auth_id", aBean.getAuth_id());
		aBean = Service.adLogin(aBean.getAuth_id(), auth_pw);
		
		if(aBean != null) {
			session.setAttribute("adauth", aBean);
			return "redirect:/adIndex";
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');location.href=\"/auth/adLogin\"</script>");
			out.close();
		}	
		return "auth/adLogin";
	}
	
	@RequestMapping("/adLogout")
	public String adLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/auth/adLogin";	
	}
	
	@RequestMapping("/adLogout2")
	public String adLogout2(HttpSession session) {
		session.invalidate();
		return "redirect:/";	
	}
}