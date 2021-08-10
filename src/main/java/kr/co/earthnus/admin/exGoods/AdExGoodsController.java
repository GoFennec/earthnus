package kr.co.earthnus.admin.exGoods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.earthnus.user.goods.ExGoodsBean;

@Controller
public class AdExGoodsController {
	@Autowired
	private AdExGoodsService adExGoodsService;
	
	@RequestMapping("/adExGoods/list")
	public String getGoodsList(@RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "10") String contentnum, Model model) {
		adExGoodsService.getAdExGoodsList(pagenum, contentnum, model);
		return "goods/adExGoodsList";
	}
	
	@RequestMapping("/adExGoods/update")
	public String updateGoods(@RequestParam int exGoodsNumU, @RequestParam String exGoodsPoint, 
			@RequestParam String exGoodsDate, Model model) {
		model.addAttribute("exGoodsPoint", exGoodsPoint);
		model.addAttribute("exGoodsDate", exGoodsDate);
		model.addAttribute("exGoods", adExGoodsService.updateExGoods(exGoodsNumU));
		return "goods/adExGoodsUpdate";
	}
	
	@RequestMapping("/adExGoods/updateOk")
	public String updateGoodsOk(@ModelAttribute ExGoodsBean eBean, Model model) {
		adExGoodsService.updateExGoodsOk(eBean);
		return "redirect:/adExGoods/list";
	}
	
	@RequestMapping("/adExGoods/delete")
	public String deleteGoods(@RequestParam int exGoodsNumD) {
		adExGoodsService.deleteExGoods(exGoodsNumD);
		return "redirect:/adExGoods/list";
	}
}
