package kr.co.earthnus.admin.camBoard;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.earthnus.user.camBoard.camBoardBean;

@Controller
public class AdCamBoardController {
	@Autowired
	private AdCamBoardService adCamBoardService;
			
	@RequestMapping(value= {"/adCamBoard/list", "/adCamBoard"})
	public String getCamBoardList(Model model) {
		
		List<camBoardBean> list = adCamBoardService.getBoardList();
		model.addAttribute("CamBoardList", list);
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping(value="/adCamBoard/ing")
	public String getCamBoardIngList(Model model) {
		
		List<camBoardBean> list = adCamBoardService.getBoardIngList();
		model.addAttribute("CamBoardIngList", list);
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping(value="/adCamBoard/finish")
	public String getCamBoardFinishList(Model model) {
		
		List<camBoardBean> list = adCamBoardService.getBoardFinishList();
		model.addAttribute("CamBoardFinishList", list);
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping(value="/adCamBoard/detail")
	public String getCamBoardDetail(@RequestParam("CAMB_NUM") String contentnum, Model model) {
		
		model.addAttribute("camBoard", adCamBoardService.getCamBoard(contentnum));
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		String CAMB_STARTDATE = simpleDateFormat.format(adCamBoardService.getCamBoard(contentnum).getCAMB_STARTDATE());
		String CAMB_FINDATE = simpleDateFormat.format(adCamBoardService.getCamBoard(contentnum).getCAMB_FINDATE());
		model.addAttribute("CAMB_STARTDATE", CAMB_STARTDATE);
		model.addAttribute("CAMB_FINDATE", CAMB_FINDATE);
		return "camBoard/adCamBoardDetail";
	}
	
	@RequestMapping(value="/adCamBoard/insert")
	public String insertCamBoard() {
		
		return "camBoard/adCamBoardInsert";
	}
	
	@RequestMapping(value="/adCamBoard/insertOk", method=RequestMethod.POST)
	public String insertCamBoardOk(@RequestParam("CAMB_NAME") String CAMB_NAME , @RequestParam("CAMB_SUBJECT") String CAMB_SUBJECT , 
			@RequestParam("CAMB_CONTENT") String CAMB_CONTENT , @RequestParam("CAMB_UPLOADFILE") MultipartFile CAMB_UPLOADFILE , 
			@RequestParam("CAMB_STARTDATE") Date CAMB_STARTDATE, @RequestParam("CAMB_FINDATE") Date CAMB_FINDATE, Model model) {
		
		
		adCamBoardService.insertCamBoard(CAMB_NAME, CAMB_SUBJECT, CAMB_CONTENT, CAMB_UPLOADFILE, CAMB_STARTDATE, CAMB_FINDATE);
		return "redirect:/adCamBoard/list";
	}
	
	@RequestMapping(value="/adCamBoard/update")
	public String updateCamBoard(@ModelAttribute camBoardBean cBean, Model model) {
		
		model.addAttribute("camBoard", cBean);
		System.out.println("updateCamBoard CAMB_SUBJECT : " + cBean.getCAMB_SUBJECT());
		
		return "camBoard/adCamBoardUpdate";
	}
	
	@RequestMapping(value="/adCamBoard/updateOk", method=RequestMethod.POST)
	public String updateCamBoardOk(@RequestParam(value="CAMB_NAME") String CAMB_NAME, @RequestParam(value="CAMB_SUBJECT") String CAMB_SUBJECT, 
			@RequestParam(value="CAMB_CONTENT") String CAMB_CONTENT, @RequestParam(value="CAMB_UPLOADFILE") MultipartFile CAMB_UPLOADFILE, 
			@RequestParam(value="CAMB_NUM") String CAMB_NUM, @RequestParam("CAMB_STARTDATE") Date CAMB_STARTDATE, 
			@RequestParam("CAMB_FINDATE") Date CAMB_FINDATE, Model model) {
		
		System.out.println("updateOk 而⑦듃濡ㅻ윭 =======> �젣紐� : " + CAMB_NAME + ", 二쇱젣 : " + CAMB_SUBJECT + 
				", �궡�슜 : " + CAMB_CONTENT + ", �뙆�씪 : " + CAMB_UPLOADFILE + ", 번호 : " + CAMB_NUM);
		adCamBoardService.updateCamBoard(CAMB_NUM, CAMB_NAME, CAMB_SUBJECT, CAMB_CONTENT, CAMB_UPLOADFILE, CAMB_STARTDATE, CAMB_FINDATE);
		System.out.println("updateCamBoardOk");
		
		return "redirect:/adCamBoard/list";
	}
	
	@RequestMapping(value="/adCamBoard/delete")
	public String deleteCamBoard(camBoardBean cBean, Model model) {
		
		System.out.println("deleteCamBoard");
		adCamBoardService.deleteCamBoard(cBean);
		
		return "redirect:/adCamBoard/list";
	}
	
	@RequestMapping(value="/ckupload/imgUpload", method = RequestMethod.POST) 
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile , 
			@RequestParam MultipartFile upload) throws Exception{ // 랜덤 문자 생성 
		UUID uid1 = UUID.randomUUID();
		UUID uid2 = UUID.randomUUID();
		OutputStream out = null; 
		PrintWriter printWriter = null; //인코딩 
		response.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8"); 
		try{ //파일 이름 가져오기 
			String fileName = upload.getOriginalFilename(); 
			byte[] bytes = upload.getBytes(); //이미지 경로 생성 
			String path = "C:/upload/";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
			String ckUploadPath = path + uid1 + "_" + uid2; 
			File folder = new File(path); //해당 디렉토리 확인 
			if(!folder.exists()){ 
				try{ folder.mkdirs(); // 폴더 생성 
				}catch(Exception e){ 
					e.getStackTrace(); }
				} 
			out = new FileOutputStream(new File(ckUploadPath)); 
			out.write(bytes); out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화 
			String callback = request.getParameter("CKEditorFuncNum"); 
			printWriter = response.getWriter(); 
			String fileUrl = "/upload/?uid=" + uid1 + "&fileName=" + uid2; // 작성화면 // 업로드시 메시지 출력 
			printWriter.println("{\"filename\" : \""+uid2+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}"); 
			printWriter.flush(); 
			}catch(IOException e){ 
				e.printStackTrace(); 
				} finally { 
					try {
						if(out != null) {
							out.close(); 
						} if(printWriter != null) { 
							printWriter.close(); 
						} 
					} catch(IOException e) {
						e.printStackTrace(); 
						} 
					} return;
				}

	@RequestMapping(value="/upload/") 
	public void ckSubmit(@RequestParam(value="uid") String uid , @RequestParam(value="fileName") String fileName , 
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String path = "/upload/"; 
		String sDirPath = path + uid + "_" + fileName; 
		File imgFile = new File(sDirPath);
		if(imgFile.isFile()){ 
			byte[] buf = new byte[1024]; 
			int readByte = 0; 
			int length = 0; 
			byte[] imgBuf = null; 
			FileInputStream fileInputStream = null; 
			ByteArrayOutputStream outputStream = null; 
			ServletOutputStream out = null; 
			
			try{ 
				fileInputStream = new FileInputStream(imgFile); 
				outputStream = new ByteArrayOutputStream(); 
				out = response.getOutputStream(); 
				while((readByte = fileInputStream.read(buf)) != -1){ 
					outputStream.write(buf, 0, readByte); 
					} 
				imgBuf = outputStream.toByteArray(); 
				length = imgBuf.length; 
				out.write(imgBuf, 0, length); out.flush(); 
				}catch(IOException e){
					}
			finally { 
				outputStream.close(); 
				fileInputStream.close(); 
				out.close(); 
				} 
			}
		}

}