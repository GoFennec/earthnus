package kr.co.earthnus.admin.camBoard;

import java.util.List;

import kr.co.earthnus.user.camBoard.camBoardBean;

public interface AdCamBoardMybatis {
	public List<camBoardBean> getAdBoardList();
	public List<camBoardBean> getAdBoardIngList();
	public List<camBoardBean> getAdBoardFinishList();
	
	public int camTotal();
	public int camIng();
	public int camFinish();
}
