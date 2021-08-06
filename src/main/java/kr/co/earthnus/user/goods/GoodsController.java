package kr.co.earthnus.user.goods;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.earthnus.user.auth.AuthBean;

@Controller
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("/goods/list")
	public String getGoodsList(@RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "6") String contentnum, GoodsBean bean, Model model) {
		goodsService.getGoodsList(bean, pagenum, contentnum, model);
		return "goods/goodsList";
	}
	@RequestMapping("/goods/exGoods")
	public String getGoodsAndMemOne(@ModelAttribute GoodsBean bean, 
			HttpSession session, Model model) {
		model.addAttribute("goods", goodsService.getGoods(bean));
		AuthBean auth = (AuthBean)session.getAttribute("auth");
		if (auth != null) {
			model.addAttribute("member", goodsService.getMember(auth));
		}
		return "goods/exGoods";
	}
	@RequestMapping("/goods/exGoodsOk")
	public String getExGoodsOk(@ModelAttribute ExGoodsBean exBean, 
			@ModelAttribute GoodsBean bean, Model model) {
		int exNum = goodsService.insertExGoods(exBean);
		model.addAttribute("member", goodsService.updateMemberPoint(exBean));
		model.addAttribute("goods", bean);
		model.addAttribute("exGoods", goodsService.getExGoods(exNum));
		return "goods/exGoodsOk";
	}
}
