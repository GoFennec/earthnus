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
        pBean.setPagenum(cPagenum-1);   // ���� �������� ������ ��ü�� �����Ѵ� -1 �� �ؾ� �������� ����Ҽ� �ִ�
        pBean.setContentnum(cContentnum); // �� �������� ��� �Խñ��� �������� �����Ѵ�.
        pBean.setCurrentblock(cPagenum); // ���� ������ ����� ������� ���� ������ ��ȣ�� ���ؼ� �����Ѵ�.
        pBean.setLastblock(pBean.getTotalcount()); // ������ ��� ��ȣ�� ��ü �Խñ� ���� ���ؼ� ���Ѵ�.

        pBean.prevnext(cPagenum);//���� ������ ��ȣ�� ȭ��ǥ�� ��Ÿ���� ���Ѵ�.
        pBean.setStartPage(pBean.getCurrentblock()); // ���� �������� ������ ��Ϲ�ȣ�� ���Ѵ�.
        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
        //������ �������� ������ ������ ��ϰ� ���� ������ ��� ��ȣ�� ���Ѵ�.
        
        if(cContentnum == 6){//���� �Խñ� ��
        	pBean.setPagenum(pBean.getPagenum()*6);
        	
        	if(arr.equals("entire")) {
        		CamBoardList = CamBoardDAO.getCamBoardListEntire(pBean);       		
        	}else if(arr.equals("doing")) {
        		CamBoardList = CamBoardDAO.getCamBoardListDoing(pBean);
        	}else if(arr.equals("end")) {
        		CamBoardList = CamBoardDAO.getCamBoardListEnd(pBean);
        	}
        }
        
        // mapper ��ü �Խñ� ������ �����Ѵ�
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
        pBean.setPagenum(cPagenum-1);   // ���� �������� ������ ��ü�� �����Ѵ� -1 �� �ؾ� �������� ����Ҽ� �ִ�
        pBean.setContentnum(cContentnum); // �� �������� ��� �Խñ��� �������� �����Ѵ�.
        pBean.setCurrentblock(cPagenum); // ���� ������ ����� ������� ���� ������ ��ȣ�� ���ؼ� �����Ѵ�.
        pBean.setLastblock(pBean.getTotalcount()); // ������ ��� ��ȣ�� ��ü �Խñ� ���� ���ؼ� ���Ѵ�.

        pBean.prevnext(cPagenum);//���� ������ ��ȣ�� ȭ��ǥ�� ��Ÿ���� ���Ѵ�.
        pBean.setStartPage(pBean.getCurrentblock()); // ���� �������� ������ ��Ϲ�ȣ�� ���Ѵ�.
        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
        //������ �������� ������ ������ ��ϰ� ���� ������ ��� ��ȣ�� ���Ѵ�.
        
        if(cContentnum == 6){//���� �Խñ� ��
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
        
        // mapper ��ü �Խñ� ������ �����Ѵ�
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
		
		System.out.println("���� : " + contentnum);
		return camBoardDAO.getCamBoard(Integer.parseInt(contentnum));
	}
	/*public MemberBean getMember(MemberBean mBean) {
		return CamBoardDAO.getMember(mBean);
	}*/
}
