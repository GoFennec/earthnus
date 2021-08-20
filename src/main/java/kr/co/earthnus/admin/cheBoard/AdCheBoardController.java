package kr.co.earthnus.admin.cheBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.earthnus.user.cheBoard.CheBoardBean;

@Controller
public class AdCheBoardController {
	
	@Autowired
	private AdCheBoardService adCheBoardService;
	
	@RequestMapping(value="/adCheBoard/list")
	public String getCamBoardList(Model model) {
		
		List<CheBoardBean> list = adCheBoardService.getBoardList();
		model.addAttribute("CheBoard", list);
		return "cheBoard/adCheBoardList";
	}
}
