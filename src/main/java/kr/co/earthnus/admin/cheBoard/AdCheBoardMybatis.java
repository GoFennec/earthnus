package kr.co.earthnus.admin.cheBoard;

import java.util.List;

import kr.co.earthnus.user.cheBoard.CheBoardBean;

public interface AdCheBoardMybatis {

	
	
	public List<CheBoardBean> AdCheBoardList();
	public void replyDelete(int reply_id);
}
