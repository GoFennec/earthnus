package kr.co.earthnus.user.camBoard;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class camBoardBean {
	private int CAMB_NUM;
	private String CAMB_NAME;
	private String CAMB_SUBJECT;
	private String CAMB_CONTENT;
	private String CAMB_FILE;
	private MultipartFile CAMB_UPLOADFILE;
	private Date CAMB_STARTDATE;
	private Date CAMB_FINDATE;
	private Date CAMB_DATE;
	private int CAMB_ABLEDATE;
	
	public int getCAMB_NUM() {
		return CAMB_NUM;
	}
	public void setCAMB_NUM(int cAMB_NUM) {
		CAMB_NUM = cAMB_NUM;
	}
	public String getCAMB_NAME() {
		return CAMB_NAME;
	}
	public void setCAMB_NAME(String cAMB_NAME) {
		CAMB_NAME = cAMB_NAME;
	}
	public String getCAMB_SUBJECT() {
		return CAMB_SUBJECT;
	}
	public void setCAMB_SUBJECT(String cAMB_SUBJECT) {
		CAMB_SUBJECT = cAMB_SUBJECT;
	}
	public String getCAMB_CONTENT() {
		return CAMB_CONTENT;
	}
	public void setCAMB_CONTENT(String cAMB_CONTENT) {
		CAMB_CONTENT = cAMB_CONTENT;
	}
	public String getCAMB_FILE() {
		return CAMB_FILE;
	}
	public void setCAMB_FILE(String cAMB_FILE) {
		CAMB_FILE = cAMB_FILE;
	}
	
	public MultipartFile getCAMB_UPLOADFILE() {
		return CAMB_UPLOADFILE;
	}
	public void setCAMB_UPLOADFILE(MultipartFile cAMB_UPLOADFILE) {
		CAMB_UPLOADFILE = cAMB_UPLOADFILE;
	}
	
	public Date getCAMB_STARTDATE() {
		return CAMB_STARTDATE;
	}
	public void setCAMB_STARTDATE(Date cAMB_STARTDATE) {
		
		CAMB_STARTDATE = cAMB_STARTDATE;
	}
	public Date getCAMB_FINDATE() {
		return CAMB_FINDATE;
	}
	public void setCAMB_FINDATE(Date cAMB_FINDATE) {
		
		CAMB_FINDATE = cAMB_FINDATE;
	}
	public Date getCAMB_DATE() {
		return CAMB_DATE;
	}
	public void setCAMB_DATE(Date cAMB_DATE) {
		
		CAMB_DATE = cAMB_DATE;
	}
	public int getCAMB_ABLEDATE() {
		return CAMB_ABLEDATE;
	}
	public void setCAMB_ABLEDATE(int cAMB_ABLEDATE) {
		CAMB_ABLEDATE = cAMB_ABLEDATE;
	}
	@Override
	public String toString() {
		return "camBoardBean [CAMB_NUM=" + CAMB_NUM + ", CAMB_NAME=" + CAMB_NAME + ", CAMB_SUBJECT=" + CAMB_SUBJECT
				+ ", CAMB_CONTENT=" + CAMB_CONTENT + ", CAMB_FILE=" + CAMB_FILE + ", CAMB_UPLOADFILE=" + CAMB_UPLOADFILE
				+ ", CAMB_STARTDATE=" + CAMB_STARTDATE + ", CAMB_FINDATE=" + CAMB_FINDATE + ", CAMB_DATE=" + CAMB_DATE
				+ ", CAMB_ABLEDATE=" + CAMB_ABLEDATE + "]";
	}
}
