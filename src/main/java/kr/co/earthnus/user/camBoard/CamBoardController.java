package kr.co.earthnus.user.camBoard;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CamBoardController{	
	@Autowired
	private CamBoardService camBoardService;
	
	@RequestMapping(value="/camBoard/list")
	public String getCamBoardList(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "6") String contentnum, camBoardBean bean, Model model) {
		
		String search = "";
		String search_type = "CAMB_NAME";
		String orderBy = "CAMB_NUM";
		String order = "DESC";
		
		camBoardService.getBoardList(search, search_type, arr, orderBy, order, contentnum, pagenum, model);
		
		return "camBoard/camBoardList";
	}
	
	@RequestMapping("/camBoard/list/search")
	public String searchCamBoardList(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "CAMB_ENTIRE") String search_type, 
			@RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "6") String contentnum, 
			@RequestParam( value = "search", required=false) String search , @RequestParam(defaultValue = "desc") String order, 
			camBoardBean bean, Model model) {
				
		String orderBy = "CAMB_NUM";
		
		camBoardService.getBoardList(search, search_type, arr, orderBy, order, contentnum, pagenum, model);
		
		return "camBoard/camBoardList";
	}
	
	@RequestMapping(value="/camBoard/detail")
	public String getCamBoardDetail(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "") String search, @RequestParam(defaultValue = "CAMB_ENTIRE") String search_type, 
			@RequestParam(defaultValue = "desc") String order, 
			camBoardBean bean, @RequestParam("CAMB_NUM") String cambnum, @RequestParam(defaultValue = "1") String p, 
			@RequestParam("CAMB_NAME") String cambname, Model model) {
		
		if(search.equals("plastic")) {
			search = "플라스틱";
		}else if(search.equals("ocean")) {
			search = "해양";
		}else if(search.equals("forest")) {
			search = "산림";
		}else if(search.equals("ice")) {
			search = "극지방";
		}else if(search.equals("all")) {
			search = "기타";
		}
		
		search = "%" + search + "%";		
		Map<String, Object> list = new HashMap<String, Object>();
		String orderBy = "CAMB_NUM";
		
		camBoardService.getBoardIndex(search, search_type, arr, orderBy, order, Integer.parseInt(cambnum), list, model);

		model.addAttribute("totalIndex", list.get("totalIndex"));
		model.addAttribute("index", list.get("index"));
		model.addAttribute("nextBoard", (camBoardBean)list.get("nextBoard"));
		model.addAttribute("preBoard", (camBoardBean)list.get("preBoard"));
		model.addAttribute("camBoard", camBoardService.getCamBoard(cambnum));
		model.addAttribute("page", Integer.parseInt(p));
		
		return "camBoard/camBoardDetail";
	}
}