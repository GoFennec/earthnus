package kr.co.earthnus.admin.camBoard;

import java.io.File;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.earthnus.user.camBoard.CamBoardMybatis;
import kr.co.earthnus.user.camBoard.camBoardBean;

@Service
public class AdCamBoardService {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<camBoardBean> getBoardList() {
		AdCamBoardMybatis CamBoardDAO = mybatis.getMapper(AdCamBoardMybatis.class);
        List<camBoardBean> CamBoardList = CamBoardDAO.getAdBoardList();
        return CamBoardList;
	}
	
	public List<camBoardBean> getBoardIngList() {
		AdCamBoardMybatis CamBoardDAO = mybatis.getMapper(AdCamBoardMybatis.class);
        List<camBoardBean> CamBoardList = CamBoardDAO.getAdBoardIngList();
        return CamBoardList;
	}
	public List<camBoardBean> getBoardFinishList() {
		AdCamBoardMybatis CamBoardDAO = mybatis.getMapper(AdCamBoardMybatis.class);
        List<camBoardBean> CamBoardList = CamBoardDAO.getAdBoardFinishList();
        return CamBoardList;
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
			cBean.setCAMB_FILE("C:/upload/" + fileName);
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
