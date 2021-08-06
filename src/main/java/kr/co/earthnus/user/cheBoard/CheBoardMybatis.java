package kr.co.earthnus.user.cheBoard;


import java.util.List;


public interface CheBoardMybatis {
	public int CheBoardCount();
	public List<CheBoardBean> CheBoardList(PagingBean bean);
}