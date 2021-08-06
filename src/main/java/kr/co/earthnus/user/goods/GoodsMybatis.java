package kr.co.earthnus.user.goods;

import java.util.List;

import kr.co.earthnus.user.auth.AuthBean;
import kr.co.earthnus.user.member.MemberBean;

public interface GoodsMybatis {
	public List<GoodsBean> getGoodsList(PagingBean pBean);
	public GoodsBean getGoods(GoodsBean bean);
	public MemberBean getMember(AuthBean abean);
	public int goodsCount();
	public int insertExGoods(ExGoodsBean exBean);
	public int newExGoods(ExGoodsBean exBean);
	public int updateMemberPoint(ExGoodsBean exBean);
	public MemberBean exMemberPoint(ExGoodsBean exBean);
	public ExGoodsBean getExGoods(int exNum);
}
