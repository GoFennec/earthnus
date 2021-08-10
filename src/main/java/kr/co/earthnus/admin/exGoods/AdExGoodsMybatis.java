package kr.co.earthnus.admin.exGoods;

import java.util.List;
import java.util.Map;

import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.user.goods.PagingBean;

public interface AdExGoodsMybatis {
	public int adExGoodsCount();
	public List<ExGoodsBean> getAdExGoodsList(PagingBean pBean);
	public ExGoodsBean getExGoodsU(int exGoodsNumU);
	public void updateExGoodsOk(ExGoodsBean eBean);
	public ExGoodsBean getExGoodsD(int exGoodsNumD);
	public void deleteExGoods(int exGoodsNumD);
	public void updatePoint(Map map);
}
