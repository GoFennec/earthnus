package kr.co.earthnus.admin.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.earthnus.user.goods.GoodsBean;

@Controller
public class AdGoodsController {
	@Autowired
	private AdGoodsService adGoodsService;
	
	@RequestMapping("/adGoods/list")
	public String getGoodsList(@RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "10") String contentnum, Model model) {
		adGoodsService.getAdGoodsList(pagenum, contentnum, model);
		return "goods/adGoodsList";
	}
	
	@RequestMapping("/adGoods/insert")
	public String insertGoods(Model model) {
		model.addAttribute("newGoodsNum", adGoodsService.newGoodsNum());
		return "goods/adGoodsInsert";
	}
	
	@RequestMapping("/adGoods/insertOk")
	public String insertGoodsOk(GoodsBean gBean, Model model) {
		adGoodsService.isertGoodsOk(gBean);
		return "redirect:/adGoods/list";
	}
	
	@RequestMapping("/adGoods/update")
	public String updateGoods(@RequestParam String goodsNumU, Model model) {
		model.addAttribute("goods", adGoodsService.updateGoods(goodsNumU));
		return "goods/adGoodsUpdate";
	}
	
	@RequestMapping("/adGoods/updateOk")
	public String updateGoodsOk(@ModelAttribute GoodsBean gBean, Model model) {
		adGoodsService.updateGoodsOk(gBean);
		return "redirect:/adGoods/list";
	}
	
	@RequestMapping("/adGoods/delete")
	public String deleteGoods(@RequestParam String goodsNumD) {
		adGoodsService.deleteGoods(goodsNumD);
		return "redirect:/adGoods/list";
	}
}
