package kr.co.earthnus.user.cheBoard;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.earthnus.user.pay.PayBean;

@Service
public class CheBoardService {
  @Autowired
  private SqlSessionTemplate mybatis;
  
  
  
  
  public void donation_dname(Model model, String user_id) {
	    CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
	    List<PayBean> d_name = null;
	    
	    d_name = ChreBoardDAO.get_select_dname(user_id);
	    int total_comment = ChreBoardDAO.get_total_comment();
	    
	    
	    model.addAttribute("payCheck", d_name);
	    
	    
}
  
  
//login-user 
  @SuppressWarnings("unchecked")
public JSONObject login_user_list(String startnum, String comment_step,String user_id) {
	    CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
	    PageBean bean = new PageBean();
	    int start_num = Integer.parseInt(startnum);
	    int step_num = Integer.parseInt(comment_step);
	    JSONObject json = new JSONObject();
	    ArrayList<Integer> cheb_num = new ArrayList<Integer>();
	    List CheBoardList = null;
	   
	    bean.setComment_step(step_num);
	    bean.setStartNum(start_num);
	    int total_comment = ChreBoardDAO.get_total_comment(); 
	    if(total_comment > 0) {
	    try{
	    	CheBoardList = ChreBoardDAO.get_CheBoardList(bean);
	    	 cheb_num = ChreBoardDAO.get_like_num(user_id);
	    	 
	    	 if(cheb_num.size() != 0)
	    		 json.put("like_check_num", cheb_num);
	    	 	json.put("comment_total", total_comment);
	    	 	json.put("CheBoardList", CheBoardList);
	       }catch(Exception e){
			e.printStackTrace();
	       	}
	  }
		return json;
  }
	  
  public List<CheBoardBean> visitor_user_list(String startnum, String comment_step) {
	    CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
	    PageBean bean = new PageBean();
	    List<CheBoardBean> CheBoardList = null;
	    int start_num = Integer.parseInt(startnum);
	    int step_num = Integer.parseInt(comment_step);
	    bean.setComment_step(step_num);
	    bean.setStartNum(start_num);
	    
	    CheBoardList = ChreBoardDAO.get_CheBoardList(bean);
	    return CheBoardList;
}
  
  
  
  
  
 
  
  
  public void total_comment(Model model) {
		CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
		int total_comment = ChreBoardDAO.get_total_comment();
		model.addAttribute("total_comment", total_comment);
  }
  
  
  public void deleteReply(int reply_id) {
    CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
    ChreBoardDAO.replyDelete(reply_id);
  }
  
  public void replyInsert(CheBoardBean boardBean) {
    CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
    ChreBoardDAO.replyInsert(boardBean);
  }

public void pay_comment_update(CheBoardBean BoardBean) {
	 CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
	 ChreBoardDAO.pay_comment_update(BoardBean);
  }




public int select_total_like(like_Bean likebean) {
	CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
	return ChreBoardDAO.get_select_total_like(likebean);
}

public void Comment_like(like_Bean likebean) {
	 CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
	 ChreBoardDAO.like_countplus(likebean);
     ChreBoardDAO.Comment_like(likebean);
    
}

public void Comment_like_candle(like_Bean likebean) {
	CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
	 ChreBoardDAO.Comment_like_candle(likebean);
	 ChreBoardDAO.like_countdelete(likebean);
}



}