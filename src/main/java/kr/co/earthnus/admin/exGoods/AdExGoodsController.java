package kr.co.earthnus.admin.exGoods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdExGoodsController {
	@Autowired
	private AdExGoodsService adExGoodsService;
	
	@RequestMapping("/adGoods/exList")
	public String getGoodsList(@RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "10") String contentnum, Model model) {
		adExGoodsService.getAdExGoodsList(pagenum, contentnum, model);
		return "goods/adExGoodsList";
	}
}
