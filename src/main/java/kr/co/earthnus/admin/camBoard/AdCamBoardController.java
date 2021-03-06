package kr.co.earthnus.admin.camBoard;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.earthnus.admin.member.AdMemberService;
import kr.co.earthnus.user.camBoard.camBoardBean;

@Controller
public class AdCamBoardController {
	@Autowired
	private AdCamBoardService adCamBoardService;
	@Autowired
	private AdMemberService adMemberService;
			
	@RequestMapping(value= {"/adCamBoard/list", "/adCamBoard"})
	public String getCamBoardList(Model model) {
		
		List<camBoardBean> list = adCamBoardService.getBoardList();
		model.addAttribute("CamBoardList", list);
		
		int camTotal = adCamBoardService.camTotal();
		model.addAttribute("camTotal",camTotal);
		
		int camIng = adCamBoardService.camIng();
		model.addAttribute("camIng",camIng);
		
		int camFinish = adCamBoardService.camFinish();
		model.addAttribute("camFinish",camFinish);
		
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping(value="/adCamBoard/ing")
	public String getCamBoardIngList(Model model) {
		
		List<camBoardBean> list = adCamBoardService.getBoardIngList();
		model.addAttribute("CamBoardIngList", list);
		
		int camTotal = adCamBoardService.camTotal();
		model.addAttribute("camTotal",camTotal);
		
		int camIng = adCamBoardService.camIng();
		model.addAttribute("camIng",camIng);
		
		int camFinish = adCamBoardService.camFinish();
		model.addAttribute("camFinish",camFinish);
		
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping(value="/adCamBoard/finish")
	public String getCamBoardFinishList(Model model) {
		
		List<camBoardBean> list = adCamBoardService.getBoardFinishList();
		model.addAttribute("CamBoardFinishList", list);
		
		int camTotal = adCamBoardService.camTotal();
		model.addAttribute("camTotal",camTotal);
		
		int camIng = adCamBoardService.camIng();
		model.addAttribute("camIng",camIng);
		
		int camFinish = adCamBoardService.camFinish();
		model.addAttribute("camFinish",camFinish);
		
		return "camBoard/adCamBoardList";
	}
	
	@RequestMapping(value="/adCamBoard/detail")
	public String getCamBoardDetail(@RequestParam("CAMB_NUM") String cambnum, @RequestParam("CAMB_NAME") String name, Model model) {
		
		model.addAttribute("camBoard", adCamBoardService.getCamBoard(Integer.parseInt(cambnum), name));
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		String CAMB_STARTDATE = simpleDateFormat.format(adCamBoardService.getCamBoard(Integer.parseInt(cambnum), name).getCAMB_STARTDATE());
		String CAMB_FINDATE = simpleDateFormat.format(adCamBoardService.getCamBoard(Integer.parseInt(cambnum), name).getCAMB_FINDATE());
		model.addAttribute("CAMB_STARTDATE", CAMB_STARTDATE);
		model.addAttribute("CAMB_FINDATE", CAMB_FINDATE);
		return "camBoard/adCamBoardDetail";
	}
	
	@RequestMapping(value="/adCamBoard/insert")
	public String insertCamBoard() {
		
		//return "camBoard/insertTest";
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
		
		adCamBoardService.updateCamBoard(Integer.parseInt(CAMB_NUM), CAMB_NAME, CAMB_SUBJECT, CAMB_CONTENT, CAMB_UPLOADFILE, CAMB_STARTDATE, CAMB_FINDATE);
		
		return "redirect:/adCamBoard/list";
	}
	
	@RequestMapping(value="/adCamBoard/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteCamBoard(@RequestParam("deletePW") String deletePW, @RequestParam("CAMB_NUM") String CAMB_NUM, HttpServletRequest request) throws NoSuchAlgorithmException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		int delete = adMemberService.deletePW(deletePW);
		System.out.println("delete : " + delete + ", CAMB_NUM : " + CAMB_NUM);
		
		if(delete > 0) {
			adCamBoardService.deleteCamBoard(Integer.parseInt(CAMB_NUM));
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
	}
	
	@RequestMapping(value="/ckupload/imgUpload", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile , 
			@RequestParam MultipartFile upload) throws Exception{ // ?????? ?????? ?????? 
		UUID uid1 = UUID.randomUUID();
		UUID uid2 = UUID.randomUUID();
		OutputStream out = null; 
		PrintWriter printWriter = null; //????????? 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8"); 
		try{ //?????? ?????? ???????????? 
			String fileName = upload.getOriginalFilename(); 
			byte[] bytes = upload.getBytes(); //????????? ?????? ?????? 
			String path = "/var/lib/tomcat9/webapps/upload/";// fileDir??? ?????? ????????? ?????? ????????? ?????? ??????????????? ??????.
			String ckUploadPath = path + uid1 + "_" + uid2; 
			File folder = new File(path); //?????? ???????????? ?????? 
			if(!folder.exists()){ 
				try{ folder.mkdirs(); // ?????? ?????? 
				}catch(Exception e){ 
					e.getStackTrace(); }
				} 
			out = new FileOutputStream(new File(ckUploadPath)); 
			out.write(bytes); out.flush(); // outputStram??? ????????? ???????????? ???????????? ????????? 
			String callback = request.getParameter("CKEditorFuncNum"); 
			printWriter = response.getWriter(); 
			String fileUrl = "/upload/?uid=" + uid1 + "&fileName=" + uid2; // ???????????? // ???????????? ????????? ?????? 
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
		String path = "/var/lib/tomcat9/webapps/upload/"; 
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