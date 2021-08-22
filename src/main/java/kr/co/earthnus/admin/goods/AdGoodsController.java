package kr.co.earthnus.admin.goods;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.earthnus.admin.member.AdMemberService;
import kr.co.earthnus.user.goods.GoodsBean;

@Controller
public class AdGoodsController {
	@Autowired
	private AdGoodsService adGoodsService;
	@Autowired
	private AdMemberService adMemberService;
	
	@RequestMapping("/adGoods/list")
	public String getGoodsList(Model model) {
		adGoodsService.getAdGoodsList(model);
		return "goods/adGoodsList";
	}
	
	@RequestMapping("/adGoods/insert")
	public String insertGoods(Model model) {
		model.addAttribute("newGoodsNum", adGoodsService.newGoodsNum());
		return "goods/adGoodsInsert";
	}
	
	@RequestMapping("/adGoods/insertOk")
	public String insertGoodsOk(@RequestParam String total, @RequestParam HashMap<String, String> paramMap, 
			GoodsBean gBean, Model model, HttpServletResponse res) {
		return adGoodsService.isertGoodsOk(total, paramMap, gBean, res);
	}
	
	@RequestMapping("/adGoods/update")
	public String updateGoods(@RequestParam String goodsNumU, Model model) {
		System.out.println(goodsNumU);
		adGoodsService.updateGoods(goodsNumU, model);
		return "goods/adGoodsUpdate";
	}
	
	@RequestMapping("/adGoods/updateOk")
	public String updateGoodsOk(@RequestParam String total, @RequestParam HashMap<String, String> paramMap, 
			@ModelAttribute GoodsBean gBean, Model model, HttpServletResponse res) {
		return adGoodsService.updateGoodsOk(total, paramMap, gBean, res);
	}
	
	@RequestMapping(value="/adGoods/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteGoods(@RequestParam("deletePW") String deletePW, @RequestParam(value="checkArr[]") List<String> checkArr) throws NoSuchAlgorithmException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		int delete = adMemberService.deletePW(deletePW);
		
		if(delete > 0) {
			adGoodsService.deleteGoods(checkArr);
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
	}
}
