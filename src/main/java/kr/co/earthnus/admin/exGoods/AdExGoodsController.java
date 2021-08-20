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
	
	@RequestMapping("/adExGoods/oList")
	public String getAdExGoodsOrderList(@RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "10") String contentnum, Model model) {
		String category = "Order";
		adExGoodsService.getAdExGoodsList(pagenum, contentnum, category, model);
		return "goods/adExGoodsOrderList";
	}
	
	@RequestMapping("/adExGoods/dList")
	public String getAdExGoodsDeliveryList(@RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "10") String contentnum, Model model) {
		String category = "Delivery";
		adExGoodsService.getAdExGoodsList(pagenum, contentnum, category, model);
		return "goods/adExGoodsDeliveryList";
	}
	
	@RequestMapping("/adExGoods/aList")
	public String getAdExGoodsApproveList(@RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "10") String contentnum, Model model) {
		String category = "Approve";
		adExGoodsService.getAdExGoodsList(pagenum, contentnum, category, model);
		return "goods/adExGoodsApproveList";
	}
	
	@RequestMapping("/adExGoods/cList")
	public String getAdExGoodsCancleList(@RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "10") String contentnum, Model model) {
		String category = "Cancle";
		adExGoodsService.getAdExGoodsList(pagenum, contentnum, category, model);
		return "goods/adExGoodsCancleList";
	}
	
	@RequestMapping("/adExGoods/detail")
	public String updateGoods(@RequestParam("exg_num") int exGoodsNum, Model model) {
		model.addAttribute("exGoods", adExGoodsService.getExGoods(exGoodsNum));
		return "goods/adExGoodsDetail";
	}
	
	@RequestMapping("/adExGoods/deliveryOk")
	public String updateGoodsOk(@ModelAttribute ExGoodsBean eBean, Model model) {
		adExGoodsService.updateDeliveryOk(eBean);
		return "redirect:/adExGoods/oList";
	}
	
	@RequestMapping("/adExGoods/cancle")
	public String cancleGoods(@ModelAttribute ExGoodsBean eBean) {
		adExGoodsService.cancleExGoods(eBean);
		return "redirect:/adExGoods/oList";
	}
}
