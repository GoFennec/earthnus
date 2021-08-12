package kr.co.earthnus.admin.camBoard;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.earthnus.user.camBoard.camBoardBean;

@Controller
public class AdCamBoardController {
	@Autowired
	private AdCamBoardService adCamBoardService;
			
	@RequestMapping(value="/adCamBoard/list")
	public String getCamBoardList(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "6") String contentnum, camBoardBean cBean, Model model) {
		
		String search = "%%";
		
		adCamBoardService.getCamBoardList(search, arr, cBean, pagenum, contentnum, model);
		
		System.out.println("Controller pagenum : ");
		
		System.out.println("CamBoardController");
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping("/adCamBoard/list/search")
	public String searchCamBoardList(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "6") String contentnum, @RequestParam( value = "search", required=false) String search ,
			camBoardBean cBean, Model model) {
		
		System.out.println("Controller : " + search);
		
		if(search != null) {
			search = "%" + search + "%";
		}else if(search == null || search.equals("")) {
			search = "%%";
		}
		
		adCamBoardService.searchCamBoard(arr, search, cBean, pagenum, contentnum, model);
		
		System.out.println("CamBoardController");
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping(value="/adCamBoard/detail")
	public String getCamBoardDetail(@RequestParam("CAMB_NUM") String contentnum, Model model) {
		
		System.out.println("Controller contentnum : " + contentnum);
		model.addAttribute("camBoard", adCamBoardService.getCamBoard(contentnum));
				
		return "camBoard/adCamBoardDetail";
	}
	
	@RequestMapping(value="/adCamBoard/insert")
	public String insertCamBoard() {
		
		System.out.println("insertCamBoard");
		
		return "camBoard/adCamBoardInsert";
	}
	
	@RequestMapping(value="/adCamBoard/insertOk")
	public String insertCamBoardOk(@RequestParam("CAMB_NAME") String CAMB_NAME , @RequestParam("CAMB_SUBJECT") String CAMB_SUBJECT , 
			@RequestParam("CAMB_CONTENT") String CAMB_CONTENT , @RequestParam("CAMB_UPLOADFILE") MultipartFile CAMB_UPLOADFILE , Model model) {
		
		System.out.println("insertCamBoardOk");
		
		adCamBoardService.insertCamBoard(CAMB_NAME, CAMB_SUBJECT, CAMB_CONTENT, CAMB_UPLOADFILE);
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping(value="/adCamBoard/update")
	public String updateCamBoard() {
		
		System.out.println("updateCamBoard");
		
		return "camBoard/adCamBoardUpdate";
	}
	
	/*@RequestMapping(value="/adCamBoard/updateOk", method = RequestMethod.POST)
	public String updateCamBoardOk(HttpServletRequest httpServletRequest, Model model) {
		String CAMB_NAME = httpServletRequest.getParameter("CAMB_NAME");
		String CAMB_SUBJECT = httpServletRequest.getParameter("CAMB_SUBJECT");
		String CAMB_CONTENT = httpServletRequest.getParameter("CAMB_CONTENT");
		MultipartFile CAMB_UPLOADFILE = httpServletRequest.getParameter("CAMB_UPLOADFILE");
		
		System.out.println("updateCamBoardOk");
		adCamBoardService.updateCamBoard(CAMB_NAME, CAMB_SUBJECT, CAMB_CONTENT, CAMB_UPLOADFILE);
		
		return "camBoard/adCamBoardUpdate";
	}*/
	
	@RequestMapping(value="/adCamBoard/delete")
	public String deleteCamBoard(camBoardBean cBean, Model model) {
		
		System.out.println("deleteCamBoard");
		adCamBoardService.deleteCamBoard(cBean);
		
		return "camBoard/adCamBoardList";
	}
}
