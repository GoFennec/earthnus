package kr.co.earthnus.user.goods;

import java.util.List;

import kr.co.earthnus.user.auth.AuthBean;
import kr.co.earthnus.user.member.MemberBean;

public interface GoodsMybatis {
	public int goodsCount();
	public int goodsKindsCount();
	public List<GoodsBean> getGoodsList(PagingBean pBean);
	public List<GoodsBean> getGoodsKindsList(PagingBean pBean);
	public GoodsBean getGoods(GoodsBean gBean);
	public MemberBean getMember(AuthBean abean);
	public int insertExGoods(ExGoodsBean eBean);
	public String newExGoods(ExGoodsBean eBean);
	public int updatePoint(ExGoodsBean eBean);
	public MemberBean exMemberPoint(ExGoodsBean eBean);
	public ExGoodsBean getExGoods(String exNum);
}
