package kr.co.earthnus.user.cheBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.earthnus.user.auth.AuthBean;

@Controller
public class CheBoardController {
  @Autowired
  private CheBoardService service;
  
  
  @RequestMapping(value = {"/cheBoard/list"}, method = {RequestMethod.GET})
  public String sessionRequest(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
    AuthBean user = (AuthBean)session.getAttribute("auth");
    
    if (user == null) {
    	service.total_comment(model);
      return "/cheBoard/visitorCheboardList"; 
    }
    String user_id = user.getAuth_id();
    service.donation_dname(model, user_id);
      return "/cheBoard/cheBoardList";
  }
  
  
  @ResponseBody
  @RequestMapping({"/cheBoard/visitor_comment_list"})
  public List<CheBoardBean> visitor_user_list(String startnum, String comment_step) {
    List<CheBoardBean> CheBoardList = null;
    CheBoardList = service.visitor_user_list(startnum, comment_step);

    return CheBoardList;
  }
  
  
  
  
  
  @ResponseBody
  @RequestMapping({"/cheBoard/user_select_all"})
  public JSONObject login_user_list(HttpSession session, String startnum, String comment_step) {
	  AuthBean user = (AuthBean)session.getAttribute("auth");
	  JSONObject json = new JSONObject();
	  String user_id = user.getAuth_id();
	  json = service.login_user_list(startnum, comment_step,user_id);

    return json;
  }
  
  
  
  @ResponseBody
  @RequestMapping(value = {"/cheBoard/comment_delete"}, method = {RequestMethod.POST})
  public void CheBoardDelete(int reply_id) {
    this.service.deleteReply(reply_id);
  }
  @ResponseBody
  @RequestMapping(value = {"/cheBoard/comment_insert"}, method = {RequestMethod.POST})
  public void CheBoardInsert(@RequestBody CheBoardBean BoardBean) {
	this.service.replyInsert(BoardBean);
	
	service.pay_comment_update(BoardBean);
  }
  
  
  
  @ResponseBody
  @RequestMapping(value = {"/cheBoard/comment_like"}, method = {RequestMethod.POST})
  public int Comment_like(@RequestBody like_Bean likebean) {
   int like_total = 0;
    service.Comment_like(likebean);
    like_total = service.select_total_like(likebean);
   return like_total;
  }
  @ResponseBody
  @RequestMapping(value = {"/cheBoard/comment_like_cancle"}, method = {RequestMethod.POST})
  public int Comment_like_candle(@RequestBody like_Bean likebean) {
	  int like_total = 0;
    service.Comment_like_candle(likebean);
    like_total = service.select_total_like(likebean);
    return like_total;
  }
  
}
	