package kr.co.earthnus.admin.goods;

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.tika.Tika;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.co.earthnus.user.goods.GoodsBean;

@Service("adGoodsService")
public class AdGoodsService {
	@Autowired
	private SqlSessionTemplate mybatis;
	private static final Log LOG = LogFactory.getLog(AdGoodsService.class);

	public void getAdGoodsList(Model model) {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);

        List<GoodsBean> goodsList = goodsDAO.getAdGoodsList();

		model.addAttribute("goodsList", goodsList);
	}
	
	public String newGoodsNum() {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		String gNum = goodsDAO.getNewGoodsNum();
		String alp = gNum.substring(0, 1);
		String num = String.valueOf(Integer.parseInt(gNum.substring(1)) + 1);
		gNum = alp + num;
		return gNum;
	}
	
	public  List<GoodsBean> getGoodsCategory() {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		 List<GoodsBean> goodsCategory = goodsDAO.getGoodsCategory();
		return goodsCategory;
	}
	
	public String isertGoodsOk(String total,  HashMap<String, String> paramMap, GoodsBean gBean, HttpServletResponse res) {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		MultipartFile uploadFile = gBean.getGoods_uploadFile();
		UUID uuid = UUID.randomUUID();
		String fileName = uploadFile.getOriginalFilename();
		String savedName = uuid.toString() + "_" + fileName;
		String returnStr = "";
		String path = "/var/lib/tomcat9/webapps/upload";
		File Folder = new File(path);
		String goodsInfo = "";
		StringTokenizer st = new StringTokenizer(total, "&");
		
		while (st.hasMoreTokens()) {
			goodsInfo += paramMap.get("goods_info_"+st.nextToken()) + "&";
		}
		goodsInfo = goodsInfo.substring(0, goodsInfo.length()-1);
		gBean.setGoods_info(goodsInfo);
		
		if (!Folder.exists()) {
			try{		
				Folder.mkdirs();
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
					uploadFile.transferTo(new File("/var/lib/tomcat9/webapps/upload/" + savedName));
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
		String[] goodsInfo = fullGoodsInfo.split("&");
		
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
		String path = "/var/lib/tomcat9/webapps/upload";
		File Folder = new File(path);
		String goodsInfo = "";
		StringTokenizer st = new StringTokenizer(total, "&");
		
		while (st.hasMoreTokens()) {
			goodsInfo += paramMap.get("goods_info_"+st.nextToken()) + "&";
		}
		goodsInfo = goodsInfo.substring(0, goodsInfo.length()-1);
		gBean.setGoods_info(goodsInfo);
		
		if (!Folder.exists()) {
			try{		
				Folder.mkdirs();
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
					uploadFile.transferTo(new File("/var/lib/tomcat9/webapps/upload/" + savedName));
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
	
	public void deleteGoods(List<String> checkArr) {
		AdGoodsMybatis goodsDAO = mybatis.getMapper(AdGoodsMybatis.class);
		goodsDAO.deleteGoods(checkArr);
	}
}
