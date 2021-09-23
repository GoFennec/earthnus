package kr.co.earthnus.admin.cheBoard;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.earthnus.admin.member.AdMemberService;
import kr.co.earthnus.user.cheBoard.CheBoardBean;

@Controller
public class AdCheBoardController {
	
	@Autowired
	private AdCheBoardService adCheBoardService;
	@Autowired
	private AdMemberService adMemberService;
	
	@RequestMapping(value="/adCheBoard/list")
	public String getCamBoardList(Model model) {
		
		List<CheBoardBean> list = adCheBoardService.getBoardList();
		model.addAttribute("CheBoard", list);
		
		int cheTotal = adCheBoardService.cheTotal();
		model.addAttribute("cheTotal",cheTotal);
		int cheToday = adCheBoardService.cheToday();
		model.addAttribute("cheToday",cheToday);
		return "cheBoard/adCheBoardList";
	}
	
	@RequestMapping(value="/adCheBoard/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteGoods(@RequestParam("deletePW") String deletePW, @RequestParam(value="checkArr[]") List<String> checkArr) throws NoSuchAlgorithmException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		int delete = adMemberService.deletePW(deletePW);
		
		if(delete > 0) {
			adCheBoardService.deleteCheBoard(checkArr);
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
	}
}
