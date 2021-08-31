package kr.co.earthnus.user.cheBoard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.earthnus.user.auth.AuthBean;

@Controller
public class CheBoardController {
  @Autowired
  private CheBoardService service;
  
  @ResponseBody
  @RequestMapping(value = {"/cheBoard/Cheboard_delete"}, method = {RequestMethod.POST})
  public void CheBoardDelete(int reply_id) {
    this.service.deleteReply(reply_id);
  }
  
  @ResponseBody
  @RequestMapping(value = {"/cheBoard/Cheboard_insert"}, method = {RequestMethod.POST})
  public void CheBoardInsert(@RequestBody CheBoardBean BoardBean) {
    this.service.replyInsert(BoardBean);
  }
  
  @RequestMapping(value = {"/cheBoard/list"}, method = {RequestMethod.GET})
  public String sessionRequest(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
    AuthBean user = (AuthBean)session.getAttribute("auth");
    
    if (user == null)
      return "/cheBoard/cheBoardList"; 
    String user_id = user.getAuth_id();
    service.donation_dname(model, user_id);
      return "/cheBoard/cheBoardList";
  }
  
  @ResponseBody
  @RequestMapping({"/cheBoard/comment_list"})
  public List<CheBoardBean> selectAllComment(String startnum, String comment_step) {
    List<CheBoardBean> CheBoardList = null;
    CheBoardList = service.selectAllComment(startnum, comment_step);
    
    System.out.println("");
    return CheBoardList;
  }
  
  @ResponseBody
  @RequestMapping(value = {"/cheBoard/Cheboard_comment_like"}, method = {RequestMethod.POST})
  public void Comment_like(@RequestBody like_Bean likebean) {
   
    System.out.println("1111");
    service.Comment_like(likebean);
   
  }

  
}
	