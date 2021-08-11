package kr.co.earthnus.admin.camBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.earthnus.user.camBoard.camBoardBean;
import kr.co.earthnus.user.goods.GoodsBean;

@Controller
public class AdCamBoardController {
	@Autowired
	private AdCamBoardService adCamBoardService;
	
	@RequestMapping(value="/adCamBoard/list")
	public String getCamBoardList(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "6") String contentnum, camBoardBean bean, Model model) {
		
		String search = "%%";
		
		adCamBoardService.getCamBoardList(search, arr, bean, pagenum, contentnum, model);
		
		System.out.println("CamBoardController");
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping("/adCamBoard/list/search")
	public String searchCamBoardList(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "6") String contentnum, @RequestParam( value = "search", required=false) String search ,
			camBoardBean bean, Model model) {
		
		System.out.println("컨트롤러 검색어 : " + search);
		
		if(search != null) {
			search = "%" + search + "%";
		}else if(search == null || search.equals("")) {
			search = "%%";
		}
		
		adCamBoardService.searchCamBoard(arr, search, bean, pagenum, contentnum, model);
		
		System.out.println("CamBoardController");
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping(value="/adCamBoard/detail")
	public String getCamBoardDetail(@RequestParam("CAMB_NUM") String contentnum, Model model) {
		
		System.out.println("컨트롤러 : " + contentnum);
		model.addAttribute("camBoard", adCamBoardService.getCamBoard(contentnum));		
		
		return "camBoard/adCamBoardDetail";
	}
	
	@RequestMapping(value="/adCamBoard/insert")
	public String insertCamBoard() {
		
		System.out.println("컨트롤러 들어옴");
		
		return "camBoard/adCamBoardInsert";
	}
	
	/*@RequestMapping(value="/adCamBoard/insertOk")
	public String insertCamBoardOk(camBoardBean bean, Model model) {
		
		System.out.println("컨트롤러 들어옴");
		adCamBoardService.insertCamBoard(CAMB_NAME, CAMB_SUBJECT, CAMB_CONTENT, CAMB_FILE);
		return "camBoard/adCamBoardList";
	}*/
	
	/*@RequestMapping(value="/adCamBoard/delete")
	public String insertCamBoard() {
		
		System.out.println("컨트롤러 들어옴");
		
		return "camBoard/adCamBoardInsert";
	}*/
}
