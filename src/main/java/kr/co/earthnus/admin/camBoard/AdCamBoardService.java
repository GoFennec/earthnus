package kr.co.earthnus.admin.camBoard;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
	
	public int camTotal() {
		AdCamBoardMybatis CamBoardDAO = mybatis.getMapper(AdCamBoardMybatis.class);
		int camTotal = CamBoardDAO.getCamTotal();
		return camTotal;
	}
	
	public int camIng() {
		AdCamBoardMybatis CamBoardDAO = mybatis.getMapper(AdCamBoardMybatis.class);
		int camIng = CamBoardDAO.getCamIng();
		return camIng;
	}
	
	public int camFinish() {
		AdCamBoardMybatis CamBoardDAO = mybatis.getMapper(AdCamBoardMybatis.class);
		int camFinish = CamBoardDAO.getCamFinish();
		return camFinish;
	}
	
	public void insertCamBoard(String CAMB_NAME, String CAMB_SUBJECT, String CAMB_CONTENT, 
			MultipartFile CAMB_UPLOADFILE, Date CAMB_STARTDATE, Date CAMB_FINDATE) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		camBoardBean cBean = new camBoardBean();
		cBean.setCAMB_NAME(CAMB_NAME);
		cBean.setCAMB_SUBJECT(CAMB_SUBJECT);
		cBean.setCAMB_CONTENT(CAMB_CONTENT);
		cBean.setCAMB_STARTDATE(CAMB_STARTDATE);
		cBean.setCAMB_FINDATE(CAMB_FINDATE);
		
		MultipartFile uploadFile = CAMB_UPLOADFILE;
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			try {
				System.out.println("service filename : " + fileName);
				System.out.println(uploadFile);
				uploadFile.transferTo(new File("/var/lib/tomcat9/webapps/upload/" + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			cBean.setCAMB_FILE("/upload/" + fileName);
		} else {
			cBean.setCAMB_FILE("/resources/camBoard/imgDefault.png");
		}
		CamBoardDAO.camBoardInsert(cBean);
	}
	
	public void updateCamBoard(int CAMB_NUM, String CAMB_NAME, String CAMB_SUBJECT, String CAMB_CONTENT, 
			MultipartFile CAMB_UPLOADFILE, Date CAMB_STARTDATE, Date CAMB_FINDATE) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		camBoardBean cBean = new camBoardBean();
		cBean.setCAMB_NUM(CAMB_NUM);
		cBean.setCAMB_NAME(CAMB_NAME);
		cBean.setCAMB_CONTENT(CAMB_CONTENT);
		cBean.setCAMB_SUBJECT(CAMB_SUBJECT);	
		cBean.setCAMB_UPLOADFILE(CAMB_UPLOADFILE);
		cBean.setCAMB_STARTDATE(CAMB_STARTDATE);
		cBean.setCAMB_FINDATE(CAMB_FINDATE);
		System.out.println(CAMB_UPLOADFILE.isEmpty());
		MultipartFile uploadFile = cBean.getCAMB_UPLOADFILE();
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			try {
				uploadFile.transferTo(new File("/var/lib/tomcat9/webapps/upload/" + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			cBean.setCAMB_FILE("/upload/" + fileName);
		} else if(uploadFile.isEmpty()){
			cBean.setCAMB_FILE("/resources/camBoard/imgDefault.png");
		}
		System.out.println(cBean.getCAMB_NUM() + ", " + cBean.getCAMB_NAME() + ", " + cBean.getCAMB_SUBJECT());
		CamBoardDAO.camBoardUpdate(cBean);
	}
	
	public void deleteCamBoard(int CAMB_NUM) {
		CamBoardMybatis camBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		System.out.println("서비스 삭제 캠페인 번호 : " + CAMB_NUM);
		camBoardDAO.camBoardDelete(CAMB_NUM);
	}
	
	public camBoardBean getCamBoard(String cambname) {
		CamBoardMybatis camBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		
		camBoardBean cBean = new camBoardBean();
		
		cBean = camBoardDAO.getCamBoard(cambname);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		return camBoardDAO.getCamBoard(cambname);
	}
	/*public MemberBean getMember(MemberBean mBean) {
		return CamBoardDAO.getMember(mBean);
	}*/
}