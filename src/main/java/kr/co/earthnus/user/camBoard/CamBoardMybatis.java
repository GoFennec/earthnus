package kr.co.earthnus.user.camBoard;

import java.util.List;

public interface CamBoardMybatis {
	public List<camBoardBean> getCamBoardList(PagingBean pBean);
	public List<camBoardBean> searchCamBoardList(PagingBean pBean);
	public camBoardBean getCamBoard(int contentnum);
	public int camBoardCount();
}
