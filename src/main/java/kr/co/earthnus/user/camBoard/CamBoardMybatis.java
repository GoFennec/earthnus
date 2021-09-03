package kr.co.earthnus.user.camBoard;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CamBoardMybatis {
	public List<camBoardBean> getBoardList(PagingBean pBean);
	public List<CamBoardStatBean> getStatList(PagingBean pBean);
	public camBoardBean getCamBoard(int contentnum);
	public int getBoardListCount(PagingBean pBean);
	public int getBoardIndex(PagingBean pBean);
	public camBoardBean nextBoard(PagingBean pBean);
	public camBoardBean preBoard(PagingBean pBean);
	public void camBoardInsert(camBoardBean cBean);
	public void camBoardUpdate(camBoardBean cBean);
	public void camBoardDelete(int CAMB_NUM);
	public int deletePW(String deletePW);
}