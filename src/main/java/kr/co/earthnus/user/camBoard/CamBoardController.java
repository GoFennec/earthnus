package kr.co.earthnus.user.camBoard;

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

import com.google.gson.Gson;

@Controller
public class CamBoardController{	
	@Autowired
	private CamBoardService camBoardService;
	
	@RequestMapping(value="/camBoard/list")
	public String getCamBoardList(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "6") String contentnum, camBoardBean bean, Model model) {
		
		String search = "%%";
		String search_type = "CAMB_NAME";
		String orderBy = "CAMB_NUM";
		String order = "DESC";
		
		camBoardService.getBoardList(search, search_type, arr, orderBy, order, contentnum, pagenum, model);
		
		System.out.println("CamBoardController pagenum : " + pagenum);
		return "camBoard/camBoardList";
	}
	
	@RequestMapping("/camBoard/list/search")
	public String searchCamBoardList(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "6") String contentnum, @RequestParam( value = "search", required=false) String search ,
			@RequestParam(defaultValue = "desc") String order, camBoardBean bean, Model model) {
		
		System.out.println("컨트롤러 검색어 : " + search);
		
		if(search != null) {
			search = "%" + search + "%";
		}else if(search == null || search.equals("")) {
			search = "%%";
		}
		String search_type = "CAMB_NAME";
		String orderBy = "CAMB_NUM";
		
		camBoardService.getBoardList(search, search_type, arr, orderBy, order, contentnum, pagenum, model);
		
		System.out.println("CamBoardController");
		return "camBoard/camBoardList";
	}
	
	@RequestMapping(value="/camBoard/detail")
	public String getCamBoardDetail(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "") String search , @RequestParam(defaultValue = "desc") String order, 
			camBoardBean bean, @RequestParam("CAMB_NUM") String cambnum, @RequestParam(defaultValue = "1") String p, 
			@RequestParam("CAMB_NAME") String cambname, Model model) {
		search = "%" + search + "%";		
		
		Map<String, Object> list = new HashMap<String, Object>();
		String search_type = "CAMB_NAME";
		String orderBy = "CAMB_NUM";
		
		camBoardService.getBoardIndex(search, search_type, arr, orderBy, order, Integer.parseInt(cambnum), list, model);
		System.out.println("컨트롤러 : " + cambnum);
		model.addAttribute("index", list.get("index"));
		model.addAttribute("nextBoard", (camBoardBean)list.get("nextBoard"));
		model.addAttribute("preBoard", (camBoardBean)list.get("preBoard"));
		model.addAttribute("camBoard", camBoardService.getCamBoard(cambnum));
		model.addAttribute("page", Integer.parseInt(p));
		
		return "camBoard/camBoardDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/getList", method=RequestMethod.GET)
	public String list(@RequestParam(defaultValue = "entire") String arr, @RequestParam(defaultValue = "1") String pagenum, 
			@RequestParam(defaultValue = "6") String contentnum, @RequestParam( value = "search", required=false) String search ,
			@RequestParam(defaultValue = "desc") String order, camBoardBean bean, Model model){
		List<camBoardBean> CamBoardList = null;
		
		System.out.println("getList pagenum : " + pagenum);
		if(search != null) {
			search = "%" + search + "%";
		}else if(search == null || search.equals("")) {
			search = "%%";
		}
		String search_type = "CAMB_ENTIRE";
		String orderBy = "CAMB_NUM";
		
		CamBoardList = camBoardService.getList(search, search_type, arr, orderBy, order, contentnum, pagenum, CamBoardList, model);
		String json = new Gson().toJson(CamBoardList);
		
		System.out.println("controller json : " + json);
		
		return json;
	}
}