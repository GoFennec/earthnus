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
			@RequestParam(defaultValue = "8") String contentnum, 
			@RequestParam(defaultValue = "") String goodsKinds, GoodsBean gBean, Model model) {
		model.addAttribute("goodsKinds", goodsKinds);
		model.addAttribute("goodsCategory", goodsService.getGoodsCategory());
		goodsService.getGoodsList(gBean, pagenum, contentnum, goodsKinds, model);
		return "goods/goodsList";
	}
	@RequestMapping("/goods/exGoods")
	public String getGoodsAndMemOne(@RequestParam("goods_num") String goods_num, HttpSession session, Model model) {
		model.addAttribute("goods", goodsService.getGoods(goods_num, model));
		AuthBean auth = (AuthBean)session.getAttribute("auth");
		if (auth != null) {
			model.addAttribute("member", goodsService.getMember(auth));
		}
		return "goods/exGoods";
	}
	@RequestMapping("/goods/exGoodsOk")
	public String getExGoodsOk(@ModelAttribute ExGoodsBean eBean, @ModelAttribute GoodsBean gBean, Model model) {
		String exNum = goodsService.insertExGoods(eBean);
		model.addAttribute("member", goodsService.updateMemberPoint(eBean));
		model.addAttribute("goods", gBean);
		model.addAttribute("exGoods", goodsService.getExGoods(exNum));
		return "goods/exGoodsOk";
	}
}
