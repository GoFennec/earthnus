package kr.co.earthnus.user.cheBoard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.earthnus.user.pay.PayBean;

@Service
public class CheBoardService {
  @Autowired
  private SqlSessionTemplate mybatis;
  
  public void deleteReply(int reply_id) {
    CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
    ChreBoardDAO.replyDelete(reply_id);
   
  }
  
  public void replyInsert(CheBoardBean boardBean) {
    CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
    ChreBoardDAO.replyInsert(boardBean);
  }
  
  public List<CheBoardBean> selectAllComment(String startnum, String comment_step) {
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
  
  public void donation_dname(Model model, String user_id) {
    CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
    List<PayBean> d_name = null;
    d_name = ChreBoardDAO.get_select_dname(user_id);
    int total_comment = ChreBoardDAO.get_total_comment();
    model.addAttribute("payCheck", d_name);
    model.addAttribute("total_comment", total_comment);
  }

 public void Comment_like(like_Bean likebean) {
	 CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
	 
      ChreBoardDAO.Comment_like(likebean);
     
}

public void pay_comment_update(CheBoardBean BoardBean) {
	 CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
	 ChreBoardDAO.pay_comment_update(BoardBean);
}

public void total_comment(Model model) {
	CheBoardMybatis ChreBoardDAO = (CheBoardMybatis)this.mybatis.getMapper(CheBoardMybatis.class);
	int total_comment = ChreBoardDAO.get_total_comment();
	model.addAttribute("total_comment", total_comment);
}


}