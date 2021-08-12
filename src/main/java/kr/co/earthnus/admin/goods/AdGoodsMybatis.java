package kr.co.earthnus.admin.goods;

import java.util.List;

import kr.co.earthnus.user.goods.GoodsBean;
import kr.co.earthnus.user.goods.PagingBean;

public interface AdGoodsMybatis {
	public int adGoodsCount();
	public List<GoodsBean> getAdGoodsList(PagingBean pBean);
	public String newGoodsNum();
	public void isertGoodsOk(GoodsBean gBean);
	public GoodsBean getGoodsU(String goodsNumU);
	public void updateGoodsOk(GoodsBean gBean);
	public void deleteGoods(String goodsNumD);
}
