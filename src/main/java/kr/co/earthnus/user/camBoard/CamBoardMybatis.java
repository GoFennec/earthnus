package kr.co.earthnus.user.camBoard;

import java.util.List;

public interface CamBoardMybatis {
	public List<camBoardBean> getBoardList(PagingBean pBean);
	public List<CamBoardStatBean> getStatList(PagingBean pBean);
	public camBoardBean getCamBoard(camBoardBean cBean);
	public int getBoardListCount(PagingBean pBean);
	public int getBoardIndex(PagingBean pBean);
	public camBoardBean getOtherBoard(PagingBean pBean);
	public void camBoardInsert(camBoardBean cBean);
	public void camBoardUpdate(camBoardBean cBean);
	public void camBoardDelete(int CAMB_NUM);
	public int deletePW(String deletePW);
}