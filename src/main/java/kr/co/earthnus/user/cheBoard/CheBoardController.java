package kr.co.earthnus.user.cheBoard;

import java.util.List;

import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CheBoardController{
	@Autowired
	private CheBoardService service;
	
	
	
	@ResponseBody
	@RequestMapping(value="/cheBoard/Cheboard_delete", method = RequestMethod.POST)
	public void CheBoardDelete(int reply_id) {
		 service.deleteReply(reply_id);		
	}
   
    @ResponseBody
    @RequestMapping(value="/cheBoard/Cheboard_insert", method = RequestMethod.POST)
    public void CheBoardInsert(@RequestBody CheBoardBean BoardBean){
    	 service.replyInsert(BoardBean);
    }   
    
    @RequestMapping(value="/cheBoard/list", method = RequestMethod.GET)
    public String comment(){
    	 return "/cheBoard/cheBoardList";
    }
    
    @ResponseBody
    @RequestMapping("/cheBoard/comment_list")
    public List<CheBoardBean> selectAllComment(CheBoardBean bean, Model model){
    	List<CheBoardBean> CheBoardList = null;
		CheBoardList =service.selectAllComment(bean,model);		
		return CheBoardList;
        
        
    }
}