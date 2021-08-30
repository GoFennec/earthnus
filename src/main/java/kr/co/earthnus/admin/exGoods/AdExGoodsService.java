package kr.co.earthnus.admin.exGoods;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.user.goods.PagingBean;

@Service("adExGoodsService")
public class AdExGoodsService {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void getAdExGoodsList(String pagenum, String contentnum, String category, Model model) {
		AdExGoodsMybatis exGoodsDAO = mybatis.getMapper(AdExGoodsMybatis.class);
		
		PagingBean pBean = new PagingBean();
        int cPagenum = Integer.parseInt(pagenum);
        int cContentnum = Integer.parseInt(contentnum);
        List<ExGoodsBean> exGoodsList = null;
        
        if (category.equals("Order")) {
        	 pBean.setTotalcount(exGoodsDAO.adExGoodsOrderCount());
        } else if (category.equals("Delivery")) {
        	pBean.setTotalcount(exGoodsDAO.adExGoodsDeliveryCount());
        } else if (category.equals("Approve")) {
        	pBean.setTotalcount(exGoodsDAO.adExGoodsApproveCount());
        } else if (category.equals("Cancle")) {
        	pBean.setTotalcount(exGoodsDAO.adExGoodsCancleCount());
        }
        pBean.setPagenum(cPagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pBean.setContentnum(cContentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pBean.setCurrentblock(cPagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pBean.setLastblock(pBean.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

        pBean.prevnext(cPagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pBean.setStartPage(pBean.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
        //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.

        if(cContentnum == 10){//선택 게시글 수
        	pBean.setPagenum(pBean.getPagenum()*10);
        	if (category.equals("Order")) {
        		exGoodsList = exGoodsDAO.getAdExGoodsOrderList(pBean);
            } else if (category.equals("Delivery")) {
            	exGoodsList = exGoodsDAO.getAdExGoodsDeliveryList(pBean);
            } else if (category.equals("Approve")) {
            	exGoodsList = exGoodsDAO.getAdExGoodsApproveList(pBean);
            	for(int i = 0; i < exGoodsList.size(); i++) {
            		String exgstate = exGoodsList.get(i).getExg_state();
            		if (exgstate.equals("결제완료")) {
            			exGoodsList.get(i).setExg_state("배송대기");
            		}
            	}
            } else if (category.equals("Cancle")) {
            	exGoodsList = exGoodsDAO.getAdExGoodsCancleList(pBean);
            }
        	for(int i = 0; i < exGoodsList.size(); i++) {
        		if (category.equals("Order")) {
        			exGoodsList.get(i).setExg_realnum(exGoodsList.get(i).getExg_num());
        		}
        		String exgnum = exGoodsList.get(i).getExg_num();
        		exGoodsList.get(i).setExg_num(exgnum.substring(0, exgnum.length()-4));   
        	}
        }
        
		model.addAttribute("exGoodsList", exGoodsList);
        model.addAttribute("page", pBean);
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
