package kr.co.earthnus.user.cheBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CheBoardController{
	@Autowired
	private CheBoardService service;
	
	@RequestMapping("/cheBoard/list")
	public String CheBoardLis(@RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "6") String contentnum, CheBoardBean bean, Model model) {
		service.CheBoardList(bean, pagenum, contentnum, model);
		return "/cheBoard/cheBoardList";
	}

}
