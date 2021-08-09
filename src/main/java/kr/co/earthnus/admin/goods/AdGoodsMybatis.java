package kr.co.earthnus.admin.goods;

import java.util.List;

import kr.co.earthnus.user.goods.GoodsBean;
import kr.co.earthnus.user.goods.PagingBean;

public interface AdGoodsMybatis {
	public List<GoodsBean> getAdGoodsList(PagingBean pBean);
	public int adGoodsCount();
}
