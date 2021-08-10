package kr.co.earthnus.admin.goods;

import java.io.File;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.co.earthnus.user.goods.GoodsBean;
import kr.co.earthnus.user.goods.PagingBean;

@Service("adGoodsService")
public class AdGoodsService {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void getAdGoodsList(String pagenum, String contentnum, Model model) {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		
		PagingBean pBean = new PagingBean();

        int cPagenum = Integer.parseInt(pagenum);
        int cContentnum = Integer.parseInt(contentnum);

        List<GoodsBean> goodsList = null;

        pBean.setTotalcount(goodsDAO.adGoodsCount()); // mapper 전체 게시글 개수를 지정한다
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
        	goodsList = goodsDAO.getAdGoodsList(pBean);
        }
        
		model.addAttribute("goodsList", goodsList);
        model.addAttribute("page", pBean);
	}
	
	public String newGoodsNum() {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		String gNum = goodsDAO.newGoodsNum();
		String alp = gNum.substring(0, 1);
		String num = String.valueOf(Integer.parseInt(gNum.substring(1)) + 1);
		gNum = alp + num;
		return gNum;
	}
	
	public void isertGoodsOk(GoodsBean gBean) {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		MultipartFile uploadFile = gBean.getGoods_uploadFile();
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			try {
				uploadFile.transferTo(new File("C:/upload/" + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			gBean.setGoods_img("C:/upload/" + fileName);
		} else {
			gBean.setGoods_img("/resources/goods/imgDefault.png");
		}
		goodsDAO.isertGoodsOk(gBean);
	}
	
	public GoodsBean updateGoods(String goodsNumU) {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		return goodsDAO.getGoodsU(goodsNumU);
	}
	
	public void updateGoodsOk(GoodsBean gBean) {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		MultipartFile uploadFile = gBean.getGoods_uploadFile();
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			try {
				uploadFile.transferTo(new File("C:/upload/" + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			gBean.setGoods_img("C:/upload/" + fileName);
		}
		goodsDAO.updateGoodsOk(gBean);
	}
	
	public void deleteGoods(String goodsNumD) {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		goodsDAO.deleteGoods(goodsNumD);
	}
}
