package kr.co.earthnus.admin.goods;

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.tika.Tika;
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
	
	public String isertGoodsOk(String total,  HashMap<String, String> paramMap, GoodsBean gBean, HttpServletResponse res) {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		MultipartFile uploadFile = gBean.getGoods_uploadFile();
		UUID uuid = UUID.randomUUID();
		String fileName = uploadFile.getOriginalFilename();
		String savedName = uuid.toString() + "_" + fileName;
		String returnStr = "";
		String path = "C:\\upload";
		File Folder = new File(path);
		String goodsInfo = "";
		StringTokenizer st = new StringTokenizer(total, ",");
		
		while (st.hasMoreTokens()) {
			goodsInfo += paramMap.get("goods_info_"+st.nextToken()) + ",";
		}
		goodsInfo = goodsInfo.substring(0, goodsInfo.length()-1);
		gBean.setGoods_info(goodsInfo);
		
		if (!Folder.exists()) {
			try{		
				Folder.mkdir();
			} catch(Exception e){
				e.getStackTrace();
			}
		}
		if (!uploadFile.isEmpty()) {
			try {
				InputStream inputStream = uploadFile.getInputStream();
				Tika tika = new Tika();
				String mimeType = tika.detect(inputStream);
				
				if (mimeType.startsWith("image")) {
					uploadFile.transferTo(new File("C:/upload/" + savedName));
					gBean.setGoods_img("/upload/" + savedName);
					goodsDAO.isertGoodsOk(gBean);
					returnStr = "redirect:/adGoods/list";
				} else {
					res.setContentType("text/html;charset=UTF-8");
					PrintWriter out = res.getWriter();
					out.println("<script>");
					out.println("alert('정상적인 이미지 파일이 아닙니다. 이미지파일 확인 후 추가해주세요.');");
					out.println("history.back();");
					out.println("</script>");
					out.flush();
					returnStr = "forward:/adGoods/insert";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			gBean.setGoods_img("/resources/goods/imgDefault.png");
			goodsDAO.isertGoodsOk(gBean);
			returnStr = "redirect:/adGoods/list";
		}
		return returnStr;
	}
	
	public void updateGoods(String goodsNumU, Model model) {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		GoodsBean goodsBean = goodsDAO.getGoodsU(goodsNumU);
		String fullGoodsInfo = goodsBean.getGoods_info();
		String[] goodsInfo = fullGoodsInfo.split(",");
		
		model.addAttribute("goods", goodsBean);
		model.addAttribute("goodsInfo", goodsInfo);
	}
	
	public String updateGoodsOk(String total,  HashMap<String, String> paramMap, GoodsBean gBean, HttpServletResponse res) {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		MultipartFile uploadFile = gBean.getGoods_uploadFile();
		UUID uuid = UUID.randomUUID();
		String fileName = uploadFile.getOriginalFilename();
		String savedName = uuid.toString() + "_" + fileName;
		String returnStr = "";
		String path = "C:\\upload";
		File Folder = new File(path);
		String goodsInfo = "";
		StringTokenizer st = new StringTokenizer(total, ",");
		
		while (st.hasMoreTokens()) {
			goodsInfo += paramMap.get("goods_info_"+st.nextToken()) + ",";
		}
		goodsInfo = goodsInfo.substring(0, goodsInfo.length()-1);
		gBean.setGoods_info(goodsInfo);
		
		if (!Folder.exists()) {
			try{		
				Folder.mkdir();
			} catch(Exception e){
				e.getStackTrace();
			}
		}
		if (!uploadFile.isEmpty()) {
			try {
				InputStream inputStream = uploadFile.getInputStream();
				Tika tika = new Tika();
				String mimeType = tika.detect(inputStream);
				
				if (mimeType.startsWith("image")) {
					uploadFile.transferTo(new File("C:/upload/" + savedName));
					gBean.setGoods_img("/upload/" + savedName);
					goodsDAO.updateGoodsOk(gBean);
					returnStr = "redirect:/adGoods/list";
				} else {
					res.setContentType("text/html;charset=UTF-8");
					PrintWriter out = res.getWriter();
					out.println("<script>");
					out.println("alert('정상적인 이미지 파일이 아닙니다. 이미지파일 확인 후 추가해주세요.');");
					out.println("history.back();");
					out.println("</script>");
					out.flush();
					returnStr = "forward:/adGoods/update";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			goodsDAO.updateGoodsOk(gBean);
			returnStr = "redirect:/adGoods/list";
		}
		return returnStr;
	}
	
	public void deleteGoods(String goodsNumD) {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		goodsDAO.deleteGoods(goodsNumD);
	}
}
