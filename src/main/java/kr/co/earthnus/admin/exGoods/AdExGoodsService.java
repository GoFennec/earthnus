package kr.co.earthnus.admin.exGoods;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.earthnus.user.goods.ExGoodsBean;

@Service("adExGoodsService")
public class AdExGoodsService {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void getAdExGoodsList(String pagenum, String contentnum, String category, Model model) {
		AdExGoodsMybatis exGoodsDAO = mybatis.getMapper(AdExGoodsMybatis.class);
		
        List<ExGoodsBean> exGoodsList = null;

        	if (category.equals("Order")) {
        		exGoodsList = exGoodsDAO.getAdExGoodsOrderList();
            } else if (category.equals("Delivery")) {
            	exGoodsList = exGoodsDAO.getAdExGoodsDeliveryList();
            } else if (category.equals("Approve")) {
            	exGoodsList = exGoodsDAO.getAdExGoodsApproveList();
            	for(int i = 0; i < exGoodsList.size(); i++) {
            		String exgstate = exGoodsList.get(i).getExg_state();
            		if (exgstate.equals("결제완료")) {
            			exGoodsList.get(i).setExg_state("배송대기");
            		}
            	}
            } else if (category.equals("Cancle")) {
            	exGoodsList = exGoodsDAO.getAdExGoodsCancleList();
            }
        
		model.addAttribute("exGoodsList", exGoodsList);
	}
	
	public ExGoodsBean getExGoods(String exGoodsNum) {
		AdExGoodsMybatis exGoodsDAO = mybatis.getMapper(AdExGoodsMybatis.class);
		ExGoodsBean exGoodsBean = exGoodsDAO.getExGoods(exGoodsNum);
		exGoodsBean.setExg_realnum(exGoodsNum);
		return exGoodsBean;
	}
	
	public void updateDeliveryOk(ExGoodsBean eBean) {
		AdExGoodsMybatis exGoodsDAO = mybatis.getMapper(AdExGoodsMybatis.class);
		exGoodsDAO.updateDeliveryOk(eBean);
	}
	
	public void cancleExGoods(ExGoodsBean eBean) {
		AdExGoodsMybatis exGoodsDAO = mybatis.getMapper(AdExGoodsMybatis.class);
		exGoodsDAO.cancleExGoods(eBean);
		exGoodsDAO.updatePoint(eBean);
	}
	
	public void count(Model model) {
		AdExGoodsMybatis exGoodsDAO = mybatis.getMapper(AdExGoodsMybatis.class);
		int countMonthly = exGoodsDAO.countMonthly();
		int countTotal = exGoodsDAO.countTotal();
		int countWaiting = exGoodsDAO.countWaiting();
		List<ExGoodsBean> countLanking = exGoodsDAO.countLanking();
		
		model.addAttribute("countMonthly",countMonthly);
		model.addAttribute("countTotal",countTotal);
		model.addAttribute("countWaiting",countWaiting);
		model.addAttribute("countLanking",countLanking);
		
	}
}
