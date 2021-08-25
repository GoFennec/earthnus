package kr.co.earthnus.user.camBoard;

import java.util.List;

public interface CamBoardMybatis {
	public List<camBoardBean> getBoardList(PagingBean pBean);
	public camBoardBean getCamBoard(int contentnum);
	public int getBoardListCount(PagingBean pBean);
	public int getBoardIndex(PagingBean pBean);
	public void camBoardInsert(camBoardBean cBean);
	public void camBoardUpdate(camBoardBean cBean);
	public void camBoardDelete(camBoardBean cBean);
}
