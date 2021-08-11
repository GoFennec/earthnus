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

	public void getCamBoardList(String search, String arr, camBoardBean bean, String pagenum, String contentnum, Model model) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		PagingBean pBean = new PagingBean();

        int cPagenum = Integer.parseInt(pagenum);
        int cContentnum = Integer.parseInt(contentnum);
        
        List<camBoardBean> CamBoardList = null;
        List<camBoardBean> CamBoardCount = null;
        
        pBean.setSearch(search);

		if(arr.equals("entire")) {
			CamBoardCount = CamBoardDAO.camBoardEntireCount(pBean);       		
    	}else if(arr.equals("doing")) {
    		CamBoardCount = CamBoardDAO.camBoardDoingCount(pBean);
    	}else if(arr.equals("end")) {
    		CamBoardCount = CamBoardDAO.camBoardEndCount(pBean);
    	}
        
        int count = CamBoardCount.size();
		
		pBean.setTotalcount(count);
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
        	
        	if(arr.equals("entire")) {
        		CamBoardList = CamBoardDAO.getCamBoardListEntire(pBean);       		
        	}else if(arr.equals("doing")) {
        		CamBoardList = CamBoardDAO.getCamBoardListDoing(pBean);
        	}else if(arr.equals("end")) {
        		CamBoardList = CamBoardDAO.getCamBoardListEnd(pBean);
        	}
        }
        
        // mapper 전체 게시글 개수를 지정한다
        if(arr.equals("entire")) {
        	pBean.setTotalcount(count);
        }else if(arr.equals("doing")) {
        	pBean.setTotalcount(count);
        }else if(arr.equals("end")) {
        	pBean.setTotalcount(count);
        }
        
        System.out.println("service pBean =======> search = " + pBean.getSearch() + ", contentnum = " + pBean.getContentnum() +
        		", pagenum = " + pBean.getPagenum() + ", content = " + 
        		CamBoardList.get(0).getCAMB_CONTENT()+ ", totalcount = " + count);
        
        pBean.setSearch(search.substring(1, search.length()-1));
        
		model.addAttribute("CamBoardList", CamBoardList);
        model.addAttribute("page", pBean);
	}
	
	public void searchCamBoard (String arr, String search, camBoardBean bean, String pagenum, String contentnum, Model model) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		PagingBean pBean = new PagingBean();
		
        int cPagenum = Integer.parseInt(pagenum);
        int cContentnum = Integer.parseInt(contentnum);

        List<camBoardBean> CamBoardList = null;
        List<camBoardBean> CamBoardCount = null;
        
        pBean.setSearch(search);

		if(arr.equals("entire")) {
			CamBoardCount = CamBoardDAO.camBoardEntireCount(pBean);       		
    	}else if(arr.equals("doing")) {
    		CamBoardCount = CamBoardDAO.camBoardDoingCount(pBean);
    	}else if(arr.equals("end")) {
    		CamBoardCount = CamBoardDAO.camBoardEndCount(pBean);
    	}
        
        int count = CamBoardCount.size();
		
		pBean.setTotalcount(count);
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

        	if(arr.equals("entire")) {
        		CamBoardList = CamBoardDAO.getCamBoardListEntire(pBean);       		
        	}else if(arr.equals("doing")) {
        		CamBoardList = CamBoardDAO.getCamBoardListDoing(pBean);
        	}else if(arr.equals("end")) {
        		CamBoardList = CamBoardDAO.getCamBoardListEnd(pBean);
        	}
        }
        
        System.out.println("service pBean =======> search = " + pBean.getSearch() + ", contentnum = " + pBean.getContentnum() +
        		", pagenum = " + pBean.getPagenum() + ", totalcount = " + count);
        
        // mapper 전체 게시글 개수를 지정한다
        if(arr.equals("entire")) {
        	pBean.setTotalcount(count);
        }else if(arr.equals("doing")) {
        	pBean.setTotalcount(count);
        }else if(arr.equals("end")) {
        	pBean.setTotalcount(count);
        }
        
        pBean.setSearch(search.substring(1, search.length()-1));
        
		model.addAttribute("CamBoardList", CamBoardList);
        model.addAttribute("page", pBean);
	}
	
	/*public void insertCamBoard(camBoardBean cBean) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		MultipartFile uploadFile = cBean.getCAMB_FILE();
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
	}*/
	
	public camBoardBean getCamBoard(String contentnum) {
		CamBoardMybatis camBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		System.out.println("서비스 : " + contentnum);
		return camBoardDAO.getCamBoard(Integer.parseInt(contentnum));
	}
	/*public MemberBean getMember(MemberBean mBean) {
		return CamBoardDAO.getMember(mBean);
	}*/
}
