package kr.co.earthnus.admin.auth;

import java.util.List;

import kr.co.earthnus.admin.member.AdMemberBean;
import kr.co.earthnus.user.camBoard.camBoardBean;
import kr.co.earthnus.user.cheBoard.CheBoardBean;
import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.user.pay.PayBean;

public interface AdAuthMybatis {
	public AdMemberBean getSelectByAdId(String auth_id);
	public List<PayBean> getAdPay();
	public List<ExGoodsBean> getAdGoods();
	public List<camBoardBean> getAdCamboard();
	public List<CheBoardBean> getAdCheboard();
	
	public String getSumPay();
	public int getCountMember();
	public int getOrderExGoods();
	public int getTodayVisitor();
	
	public void insertVisitor(VisitCountBean vcb);
}
