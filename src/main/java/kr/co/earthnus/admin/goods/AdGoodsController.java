package kr.co.earthnus.admin.goods;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.earthnus.user.goods.GoodsBean;

@Controller
public class AdGoodsController {
	@Autowired
	private AdGoodsService adGoodsService;
	
	@RequestMapping("/adGoods/list")
	public String getGoodsList(@RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "10") String contentnum, GoodsBean bean, Model model) {
		adGoodsService.getAdGoodsList(bean, pagenum, contentnum, model);
		return "goods/adGoodsList";
	}
}
