package kr.co.earthnus.admin.camBoard;


import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String getCamBoardList(Model model) {
		
		List<camBoardBean> list = adCamBoardService.getBoardList();
		model.addAttribute("CamBoardList", list);
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping(value="/adCamBoard/ing")
	public String getCamBoardIngList(Model model) {
		
		List<camBoardBean> list = adCamBoardService.getBoardIngList();
		model.addAttribute("CamBoardIngList", list);
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping(value="/adCamBoard/finish")
	public String getCamBoardFinishList(Model model) {
		
		List<camBoardBean> list = adCamBoardService.getBoardFinishList();
		model.addAttribute("CamBoardFinishList", list);
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping(value="/adCamBoard/detail")
	public String getCamBoardDetail(@RequestParam("CAMB_NUM") String contentnum, Model model) {
		
		System.out.println("Controller contentnum : " + contentnum);
		System.out.println("Controller CAMB_SUBJECT : " + adCamBoardService.getCamBoard(contentnum).getCAMB_SUBJECT());
		model.addAttribute("camBoard", adCamBoardService.getCamBoard(contentnum));
				
		return "camBoard/adCamBoardDetail";
	}
	
	@RequestMapping(value="/adCamBoard/insert")
	public String insertCamBoard() {
		
		System.out.println("insertCamBoard");
		
		return "camBoard/adCamBoardInsert";
	}
	
	@RequestMapping(value="/adCamBoard/insertOk", method=RequestMethod.POST)
	public String insertCamBoardOk(@RequestParam("CAMB_NAME") String CAMB_NAME , @RequestParam("CAMB_SUBJECT") String CAMB_SUBJECT , 
			@RequestParam("CAMB_CONTENT") String CAMB_CONTENT , @RequestParam("CAMB_UPLOADFILE") MultipartFile CAMB_UPLOADFILE , 
			@RequestParam("CAMB_STARTDATE") Date CAMB_STARTDATE, @RequestParam("CAMB_FINDATE") Date CAMB_FINDATE, Model model) {
		
		System.out.println("insertCamBoardOk");
		
		adCamBoardService.insertCamBoard(CAMB_NAME, CAMB_SUBJECT, CAMB_CONTENT, CAMB_UPLOADFILE, CAMB_STARTDATE, CAMB_FINDATE);
		return "redirect:/adCamBoard/list";
	}
	
	@RequestMapping(value="/adCamBoard/update")
	public String updateCamBoard(@ModelAttribute camBoardBean cBean, Model model) {
		
		model.addAttribute("camBoard", cBean);
		System.out.println("updateCamBoard CAMB_SUBJECT : " + cBean.getCAMB_SUBJECT());
		
		return "camBoard/adCamBoardUpdate";
	}
	
	@RequestMapping(value="/adCamBoard/updateOk", method=RequestMethod.POST)
	public String updateCamBoardOk(@RequestParam(value="CAMB_NAME") String CAMB_NAME, @RequestParam(value="CAMB_SUBJECT") String CAMB_SUBJECT, 
			@RequestParam(value="CAMB_CONTENT") String CAMB_CONTENT, @RequestParam(value="CAMB_UPLOADFILE") MultipartFile CAMB_UPLOADFILE, 
			@RequestParam(value="CAMB_NUM") String CAMB_NUM, @RequestParam("CAMB_STARTDATE") Date CAMB_STARTDATE, 
			@RequestParam("CAMB_FINDATE") Date CAMB_FINDATE, Model model) {
		
		System.out.println("updateOk 而⑦듃濡ㅻ윭 =======> �젣紐� : " + CAMB_NAME + ", 二쇱젣 : " + CAMB_SUBJECT + 
				", �궡�슜 : " + CAMB_CONTENT + ", �뙆�씪 : " + CAMB_UPLOADFILE + ", 번호 : " + CAMB_NUM);
		adCamBoardService.updateCamBoard(CAMB_NUM, CAMB_NAME, CAMB_SUBJECT, CAMB_CONTENT, CAMB_UPLOADFILE, CAMB_STARTDATE, CAMB_FINDATE);
		System.out.println("updateCamBoardOk");
		
		return "redirect:/adCamBoard/list";
	}
	
	@RequestMapping(value="/adCamBoard/delete")
	public String deleteCamBoard(camBoardBean cBean, Model model) {
		
		System.out.println("deleteCamBoard");
		adCamBoardService.deleteCamBoard(cBean);
		
		return "redirect:/adCamBoard/list";
	}
}
