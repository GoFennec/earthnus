package kr.co.earthnus.admin.auth;

import java.util.List;

import kr.co.earthnus.admin.member.AdMemberBean;
import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.user.pay.PayBean;

public interface AdAuthMybatis {
	public AdMemberBean selectByAdId(String auth_id);
	public List<PayBean> adPay();
	public List<ExGoodsBean> adGoods();
	
	public int sumPay();
	public int countMember();
	public int orderExGoods();
	
	public void insertVisitor(VisitCountBean vcb);
}
