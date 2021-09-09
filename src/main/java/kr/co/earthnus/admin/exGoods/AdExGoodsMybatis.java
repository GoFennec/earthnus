package kr.co.earthnus.admin.exGoods;

import java.util.List;

import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.user.goods.PagingBean;

public interface AdExGoodsMybatis {
   public int getAdExGoodsOrderCount();
   public int getAdExGoodsDeliveryCount();
   public int getAdExGoodsApproveCount();
   public int getAdExGoodsCancleCount();
   public List<ExGoodsBean> getAdExGoodsOrderList(PagingBean pBean);
   public List<ExGoodsBean> getAdExGoodsDeliveryList(PagingBean pBean);
   public List<ExGoodsBean> getAdExGoodsApproveList(PagingBean pBean);
   public List<ExGoodsBean> getAdExGoodsCancleList(PagingBean pBean);
   public ExGoodsBean getExGoods(String exGoodsNum);
   public void updateDeliveryOk(ExGoodsBean eBean);
   public void cancleExGoods(ExGoodsBean eBean);
   public void updatePoint(ExGoodsBean eBean);
   
   public int getCountMonthly();
   public int getCountTotal();
   public int getCountWaiting();
   public List<ExGoodsBean> getCountLanking();
}