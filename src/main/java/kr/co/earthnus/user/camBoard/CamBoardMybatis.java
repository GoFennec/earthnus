package kr.co.earthnus.user.camBoard;

import java.util.List;

public interface CamBoardMybatis {
	public List<camBoardBean> getCamBoardListEntire(PagingBean pBean);
	public List<camBoardBean> getCamBoardListDoing(PagingBean pBean);
	public List<camBoardBean> getCamBoardListEnd(PagingBean pBean);
	public camBoardBean getCamBoard(int contentnum);
	public List<camBoardBean> camBoardEntireCount(PagingBean pBean);
	public List<camBoardBean> camBoardDoingCount(PagingBean pBean);
	public List<camBoardBean> camBoardEndCount(PagingBean pBean);
}
