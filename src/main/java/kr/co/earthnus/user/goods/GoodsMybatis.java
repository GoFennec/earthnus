package kr.co.earthnus.user.goods;

import java.util.List;

import kr.co.earthnus.user.auth.AuthBean;
import kr.co.earthnus.user.member.MemberBean;

public interface GoodsMybatis {
	public int goodsCount();
	public int goodsKindsCount(PagingBean pBean);
	public List<GoodsBean> getGoodsList(PagingBean pBean);
	public List<GoodsBean> getGoodsKindsList(PagingBean pBean);
	public List<GoodsBean> getGoodsCategory();
	public GoodsBean getGoods(String goods_num);
	public MemberBean getMember(AuthBean abean);
	public int insertExGoods(ExGoodsBean eBean);
	public String newExGoods(ExGoodsBean eBean);
	public int updatePoint(ExGoodsBean eBean);
	public MemberBean exMemberPoint(ExGoodsBean eBean);
	public ExGoodsBean getExGoods(String exNum);
}
