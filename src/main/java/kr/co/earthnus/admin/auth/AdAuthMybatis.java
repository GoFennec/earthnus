package kr.co.earthnus.admin.auth;

import java.util.List;

import kr.co.earthnus.admin.member.AdMemberBean;
import kr.co.earthnus.user.camBoard.camBoardBean;
import kr.co.earthnus.user.cheBoard.CheBoardBean;
import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.user.pay.PayBean;

public interface AdAuthMybatis {
	public AdMemberBean selectByAdId(String auth_id);
	public List<PayBean> adPay();
	public List<ExGoodsBean> adGoods();
	public List<camBoardBean> adCamboard();
	public List<CheBoardBean> adCheboard();
	
	public String sumPay();
	public int countMember();
	public int orderExGoods();
	public int todayVisitor();
	
	public void insertVisitor(VisitCountBean vcb);
}
