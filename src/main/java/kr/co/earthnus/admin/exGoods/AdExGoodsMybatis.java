package kr.co.earthnus.admin.exGoods;

import java.util.List;

import kr.co.earthnus.user.goods.ExGoodsBean;

public interface AdExGoodsMybatis {
//	public int adExGoodsOrderCount();
//	public int adExGoodsDeliveryCount();
//	public int adExGoodsApproveCount();
//	public int adExGoodsCancleCount();
	
	public List<ExGoodsBean> getAdExGoodsOrderList();
	public List<ExGoodsBean> getAdExGoodsDeliveryList();
	public List<ExGoodsBean> getAdExGoodsApproveList();
	public List<ExGoodsBean> getAdExGoodsCancleList();
	
	public ExGoodsBean getExGoods(String exGoodsNum);
	public void updateDeliveryOk(ExGoodsBean eBean);
	public void cancleExGoods(ExGoodsBean eBean);
	public void updatePoint(ExGoodsBean eBean);
	
	public int countMonthly();
	public int countTotal();
	public int countWaiting();
	public List<ExGoodsBean> countLanking();
}
