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

	public void getAdExGoodsList(String pagenum, String contentnum, Model model) {
		AdExGoodsMybatis exGoodsDAO = mybatis.getMapper(AdExGoodsMybatis.class);
		
		PagingBean pBean = new PagingBean();

        int cPagenum = Integer.parseInt(pagenum);
        int cContentnum = Integer.parseInt(contentnum);

        List<ExGoodsBean> exGoodsList = null;

        pBean.setTotalcount(exGoodsDAO.adExGoodsCount()); // mapper 전체 게시글 개수를 지정한다
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
        	exGoodsList = exGoodsDAO.getAdExGoodsList(pBean);
        }
        
		model.addAttribute("exGoodsList", exGoodsList);
        model.addAttribute("page", pBean);
	}
}
