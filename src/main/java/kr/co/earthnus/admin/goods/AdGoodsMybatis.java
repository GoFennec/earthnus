package kr.co.earthnus.admin.goods;

import java.util.List;

import kr.co.earthnus.user.goods.GoodsBean;

public interface AdGoodsMybatis {
	public int getAdGoodsCount();
	public List<GoodsBean> getAdGoodsList();
	public String getNewGoodsNum();
	public List<GoodsBean> getGoodsCategory();
	public void isertGoodsOk(GoodsBean gBean);
	public GoodsBean getGoodsU(String goodsNumU);
	public void updateGoodsOk(GoodsBean gBean);
	public void deleteGoods(List<String> checkArr);
}
