package kr.co.earthnus.user.goods;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.earthnus.user.auth.AuthBean;
import kr.co.earthnus.user.member.MemberBean;

@Service("goodsService")
public class GoodsService {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void getGoodsList(GoodsBean bean, String pagenum, String contentnum, Model model) {
		GoodsMybatis goodsDAO = mybatis.getMapper(GoodsMybatis.class);
		
		PagingBean pBean = new PagingBean();

        int cPagenum = Integer.parseInt(pagenum);
        int cContentnum = Integer.parseInt(contentnum);

        List<GoodsBean> goodsList = null;

        pBean.setTotalcount(goodsDAO.goodsCount()); // mapper 전체 게시글 개수를 지정한다
        pBean.setPagenum(cPagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pBean.setContentnum(cContentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pBean.setCurrentblock(cPagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pBean.setLastblock(pBean.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

        pBean.prevnext(cPagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pBean.setStartPage(pBean.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
        //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.

        if(cContentnum == 6){//선택 게시글 수
        	pBean.setPagenum(pBean.getPagenum()*6);
        	goodsList = goodsDAO.getGoodsList(pBean);
        }
        
		model.addAttribute("goodsList", goodsList);
        model.addAttribute("page", pBean);
	}
	public GoodsBean getGoods(GoodsBean bean, Model model) {
		GoodsMybatis goodsDAO = mybatis.getMapper(GoodsMybatis.class);
		GoodsBean goodsBean = goodsDAO.getGoods(bean);
		String[] goodsInfo = goodsBean.getGoods_info().split(",");
		model.addAttribute("goodsInfo", goodsInfo);
		return goodsBean;
	}
	public MemberBean getMember(AuthBean aBean) {
		GoodsMybatis goodsDAO = mybatis.getMapper(GoodsMybatis.class);
		return goodsDAO.getMember(aBean);
	}
	public int insertExGoods(ExGoodsBean exBean) {
		GoodsMybatis goodsDAO = mybatis.getMapper(GoodsMybatis.class);
		goodsDAO.insertExGoods(exBean);
		int exNum = goodsDAO.newExGoods(exBean);
		return exNum;
	}
	public MemberBean updateMemberPoint(ExGoodsBean exBean) {
		GoodsMybatis goodsDAO = mybatis.getMapper(GoodsMybatis.class);
		goodsDAO.updateMemberPoint(exBean);
		return goodsDAO.exMemberPoint(exBean);
	}
	public ExGoodsBean getExGoods(int exNum) {
		GoodsMybatis goodsDAO = mybatis.getMapper(GoodsMybatis.class);
		return goodsDAO.getExGoods(exNum);
	}
}
