package kr.co.earthnus.user.cheBoard;

import java.util.ArrayList;
import java.util.List;

import kr.co.earthnus.user.pay.PayBean;

public interface CheBoardMybatis {
  List<CheBoardBean> get_CheBoardList(PageBean paramPageBean);
  
  void replyDelete(int reply_id);
  
  void replyInsert(CheBoardBean paramCheBoardBean);
  
  int get_total_comment();
  List<PayBean> get_select_dname(String user_id);

  void Comment_like(like_Bean likebean);

  void pay_comment_update(CheBoardBean BoardBean);

void Comment_like_candle(like_Bean likebean);

void like_countplus(like_Bean likebean);

void like_countdelete(like_Bean likebean);

int get_select_total_like(like_Bean likebean);

ArrayList<Integer> get_like_num(String user_id);
}