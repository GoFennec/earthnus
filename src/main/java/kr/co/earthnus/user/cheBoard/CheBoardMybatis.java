package kr.co.earthnus.user.cheBoard;


import java.util.List;


public interface CheBoardMybatis {
	public List<CheBoardBean> CheBoardList();
	public void replyDelete(int reply_id);
	public void replyInsert(CheBoardBean boardBean);
	
}