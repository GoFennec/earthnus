package kr.co.earthnus.user.camBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.earthnus.user.auth.AuthBean;

@Controller
public class CamBoardController{	
	@Autowired
	private CamBoardService camBoardService;
	
	@RequestMapping(value="/camBoard/list")
	public String getCamBoardList(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "6") String contentnum, camBoardBean bean, Model model) {
		
		String search = "";
		String search_type = "CAMB_ENTIRE";
		String orderBy = "CAMB_NUM";
		String order = "DESC";
		
		camBoardService.getBoardList(search, search_type, "", arr, orderBy, order, contentnum, pagenum, model);
		
		return "camBoard/camBoardList";
	}
	
	@RequestMapping("/camBoard/list/search")
	public String searchCamBoardList(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "전체") String search_type, 
			@RequestParam(defaultValue = "1") String pagenum, @RequestParam(defaultValue = "6") String contentnum, 
			@RequestParam( value = "search", required=false) String search , @RequestParam(defaultValue = "desc") String order, 
			HttpSession session, camBoardBean bean, Model model) {
		String search_user = "";
		AuthBean auth = (AuthBean)session.getAttribute("auth");
		
		if(auth != null) {
			search_user = auth.getAuth_id();
		}
		
		if(search_type.equals("제목")) {
			search_type = "CAMB_NAME";
		}else if(search_type.equals("내용")) {
			search_type = "CAMB_CONTENT";
		}else if(search_type.equals("CAMB_SUBJECT") || search_type.equals("주제")){
			search_type = "CAMB_SUBJECT";
		}else {
			search_type = "CAMB_ENTIRE";
		}
		String orderBy = "CAMB_NUM";
		
		camBoardService.getBoardList(search, search_type,search_user, arr, orderBy, order, contentnum, pagenum, model);
		
		return "camBoard/camBoardList";
	}
	
	@RequestMapping(value="/camBoard/detail")
	public String getCamBoardDetail(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "") String search, @RequestParam(defaultValue = "占쏙옙체") String search_type, 
			@RequestParam(defaultValue = "desc") String order, camBoardBean bean, @RequestParam("CAMB_NUM") String cambnum, 
			@RequestParam(defaultValue = "1") String p, @RequestParam("CAMB_NAME") String cambname, Model model) {
		
		if(search_type.equals("제목")) {
			search_type = "CAMB_NAME";
		}else if(search_type.equals("내용")) {
			search_type = "CAMB_CONTENT";
		}else if(search_type.equals("CAMB_SUBJECT") || search_type.equals("주제")){
			search_type = "CAMB_SUBJECT";
		}else {
			search_type = "CAMB_ENTIRE";
		}
		
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
		List<camBoardBean> CamBoardList = null;
		
		String orderBy = "CAMB_NUM";
		
		int num = Integer.parseInt(cambnum);
		
		int limit = 1;
		int offset = 0;
		
		if(cambnum.equals(list.get("totalIndex"))) {
			camBoardService.getBoardIndex(search, search_type, arr, orderBy, order, num, limit, offset, CamBoardList, list, model);
		} else if(cambnum.equals("1")) {
			limit = 2;
			offset = num - 1;
			camBoardService.getBoardIndex(search, search_type, arr, orderBy, order, num, limit, offset, CamBoardList, list, model);
		} else {
			limit = 3;
			offset = num - 2;
			camBoardService.getBoardIndex(search, search_type, arr, orderBy, order, num, limit, offset, CamBoardList, list, model);
		}
		
		model.addAttribute("totalIndex", list.get("totalIndex"));
		model.addAttribute("index", num);
		
		model.addAttribute("nextBoard", (camBoardBean)list.get("nextBoard"));
		model.addAttribute("preBoard", (camBoardBean)list.get("preBoard"));
		model.addAttribute("camBoard", camBoardService.getCamBoard(Integer.parseInt(cambnum), cambname));
		model.addAttribute("currentIndex", Integer.parseInt(cambnum));
		model.addAttribute("page", Integer.parseInt(p));
		
		return "camBoard/camBoardDetail";
	}
}