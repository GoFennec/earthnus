package kr.co.earthnus.admin.cheBoard;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.earthnus.user.cheBoard.CheBoardBean;

public interface AdCheBoardMybatis {
	public List<CheBoardBean> getAdCheBoardList();
	public void deleteCheBoard(List<String> checkArr);
	public void deleteCheBoard1(String cheb_num);
	
	public int getCheTotal();
	public int getCheToday();
	
	public CheBoardBean getCheBoardDetail(@Param("num") String num);
}
