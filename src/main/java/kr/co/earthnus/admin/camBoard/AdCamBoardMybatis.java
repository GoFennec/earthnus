package kr.co.earthnus.admin.camBoard;

import java.util.List;

import kr.co.earthnus.user.camBoard.PagingBean;
import kr.co.earthnus.user.camBoard.camBoardBean;

public interface AdCamBoardMybatis {
	public List<camBoardBean> getCamBoardListEntire(PagingBean pBean);
	public List<camBoardBean> getCamBoardListDoing(PagingBean pBean);
	public List<camBoardBean> getCamBoardListEnd(PagingBean pBean);
	public camBoardBean getCamBoard(int contentnum);
	public List<camBoardBean> camBoardEntireCount(PagingBean pBean);
	public List<camBoardBean> camBoardDoingCount(PagingBean pBean);
	public List<camBoardBean> camBoardEndCount(PagingBean pBean);
	public void camBoardUpdate(camBoardBean cBean);
	public void camBoardInsert(camBoardBean cBean);
	public void camBoardDelete(camBoardBean cBean);
}
