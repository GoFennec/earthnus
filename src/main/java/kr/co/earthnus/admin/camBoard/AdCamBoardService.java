package kr.co.earthnus.admin.camBoard;

import java.io.File;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import kr.co.earthnus.user.camBoard.CamBoardMybatis;
import kr.co.earthnus.user.camBoard.PagingBean;
import kr.co.earthnus.user.camBoard.camBoardBean;

@Service
public class AdCamBoardService {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void getBoardList(String search, String search_type, String arr, String orderBy, String order, 
			String contentnum, String pagenum, Model model) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		PagingBean pBean = new PagingBean();
		
        int cPagenum = Integer.parseInt(pagenum);
        int cContentnum = Integer.parseInt(contentnum);
        
        List<camBoardBean> CamBoardList = null;
        
        pBean.setSearch_type(search_type);
        pBean.setSearch(search);
        pBean.setArr(arr);
        pBean.setOrderBy(orderBy);
        pBean.setOrder(order);
        pBean.setTotalcount(CamBoardDAO.getBoardListCount(pBean));
        pBean.setPagenum(cPagenum-1);
        pBean.setContentnum(cContentnum);
        pBean.setCurrentblock(cPagenum);
        pBean.setLastblock(pBean.getTotalcount());

        pBean.prevnext(cPagenum);
        pBean.setStartPage(pBean.getCurrentblock());
        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
        
        if(cContentnum == 6){
        	pBean.setPagenum(pBean.getPagenum()*6);
        	
        	CamBoardList = CamBoardDAO.getBoardList(pBean);
        }
        
        pBean.setTotalcount(CamBoardDAO.getBoardListCount(pBean));
        
        System.out.println("service pBean =======> search = " + pBean.getSearch() + ", contentnum = " + pBean.getContentnum() +
        		", pagenum = " + pBean.getPagenum() + ", totalcount = " + CamBoardDAO.getBoardListCount(pBean));
        
        pBean.setSearch(search.substring(1, search.length()-1));
        
		model.addAttribute("CamBoardList", CamBoardList);
        model.addAttribute("page", pBean);
	}
	
	public void insertCamBoard(String CAMB_NAME, String CAMB_SUBJECT, String CAMB_CONTENT, MultipartFile CAMB_UPLOADFILE) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		camBoardBean cBean = new camBoardBean();
		cBean.setCAMB_NAME(CAMB_NAME);
		cBean.setCAMB_SUBJECT(CAMB_SUBJECT);
		cBean.setCAMB_CONTENT(CAMB_CONTENT);
		
		MultipartFile uploadFile = CAMB_UPLOADFILE;
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			try {
				System.out.println("service filename : " + fileName);
				System.out.println(uploadFile);
				uploadFile.transferTo(new File("C:/upload/" + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			cBean.setCAMB_FILE("/upload/" + fileName);
		} else {
			cBean.setCAMB_FILE("/resources/camBoard/imgDefault.png");
		}
		CamBoardDAO.camBoardInsert(cBean);
	}
	
	public void updateCamBoard(String CAMB_NAME, String CAMB_SUBJECT, String CAMB_CONTENT, MultipartFile CAMB_UPLOADFILE) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		camBoardBean cBean = new camBoardBean();
		
		cBean.setCAMB_NAME(CAMB_NAME);
		cBean.setCAMB_CONTENT(CAMB_CONTENT);
		cBean.setCAMB_SUBJECT(CAMB_SUBJECT);	
		cBean.setCAMB_UPLOADFILE(CAMB_UPLOADFILE);
		
		System.out.println("updateOk 서비스 =======> 제목 : " + cBean.getCAMB_NAME() + ", 주제 : " + cBean.getCAMB_SUBJECT() + 
				", 내용 : " + cBean.getCAMB_CONTENT() + ", 파일 : " + cBean.getCAMB_UPLOADFILE());
		MultipartFile uploadFile = cBean.getCAMB_UPLOADFILE();
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			try {
				uploadFile.transferTo(new File("C:/upload/" + fileName));
				System.out.println("service filename : " + fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("service filename : " + fileName);
			cBean.setCAMB_FILE("/resources/camBoard/" + fileName);
		} else {
			cBean.setCAMB_FILE("/resources/camBoard/imgDefault.png");
		}
		CamBoardDAO.camBoardUpdate(cBean);
	}
	
	public void deleteCamBoard(camBoardBean cBean) {
		CamBoardMybatis camBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		camBoardDAO.camBoardDelete(cBean);
	}
	
	public camBoardBean getCamBoard(String contentnum) {
		CamBoardMybatis camBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		System.out.println("占쏙옙占쏙옙 : " + contentnum);
		return camBoardDAO.getCamBoard(Integer.parseInt(contentnum));
	}
	/*public MemberBean getMember(MemberBean mBean) {
		return CamBoardDAO.getMember(mBean);
	}*/
}
