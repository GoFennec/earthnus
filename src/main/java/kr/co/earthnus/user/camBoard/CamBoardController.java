package kr.co.earthnus.user.camBoard;

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
		
		String search = "%%";
		
		camBoardService.getCamBoardList(search, arr, bean, pagenum, contentnum, model);
		
		System.out.println("CamBoardController");
		return "camBoard/camBoardList";
	}
	
	@RequestMapping("/camBoard/list/search")
	public String searchCamBoardList(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "6") String contentnum, @RequestParam( value = "search", required=false) String search ,
			camBoardBean bean, Model model) {
		
		System.out.println("컨트롤러 검색어 : " + search);
		
		if(search != null) {
			search = "%" + search + "%";
		}else if(search == null || search.equals("")) {
			search = "%%";
		}
		
		camBoardService.searchCamBoard(arr, search, bean, pagenum, contentnum, model);
		
		System.out.println("CamBoardController");
		return "camBoard/camBoardList";
	}
	
	@RequestMapping(value="/camBoard/detail")
	public String getCamBoardDetail(@RequestParam("CAMB_NUM") String contentnum, Model model) {
		
		System.out.println("컨트롤러 : " + contentnum);
		model.addAttribute("camBoard", camBoardService.getCamBoard(contentnum));		
		
		return "camBoard/camBoardDetail";
	}
}