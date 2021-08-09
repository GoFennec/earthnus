package kr.co.earthnus.admin.exGoods;

import java.util.List;

import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.user.goods.PagingBean;

public interface AdExGoodsMybatis {
	public List<ExGoodsBean> getAdExGoodsList(PagingBean pBean);
	public int adExGoodsCount();
}
