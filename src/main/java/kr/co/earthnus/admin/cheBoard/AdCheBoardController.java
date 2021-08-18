package kr.co.earthnus.admin.cheBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.earthnus.user.cheBoard.CheBoardBean;

@Controller
public class AdCheBoardController {

	@Autowired
	private AdCheBoardService service;
	
	
	@ResponseBody
	@RequestMapping(value="/adcheBoard/adCheboard_delete", method = RequestMethod.POST)
	public void CheBoardDelete(int reply_id) {
		 service.deleteReply(reply_id);		
	}
   
    
    
    @RequestMapping(value="/adcheBoard/list", method = RequestMethod.GET)
    public String comment(){
    	 return "/cheBoard/adcheBoard";
    }
    
    @ResponseBody
    @RequestMapping("/adcheBoard/comment_list")
    public List<CheBoardBean> selectAllComment(Model model){
    	List<CheBoardBean> CheBoardList = null;
		CheBoardList =service.selectAllComment(model);		
		return CheBoardList;
        
        
    }
}
