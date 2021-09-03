package kr.co.earthnus.user.cheBoard;

import java.util.List;

import kr.co.earthnus.user.pay.PayBean;

public interface CheBoardMybatis {
  List<CheBoardBean> CheBoardList(PageBean paramPageBean);
  
  void replyDelete(int reply_id);
  
  void replyInsert(CheBoardBean paramCheBoardBean);
  
  List<PayBean> select_dname(String user_id);

  void Comment_like(like_Bean likebean);

  void pay_comment_update(CheBoardBean BoardBean);
}