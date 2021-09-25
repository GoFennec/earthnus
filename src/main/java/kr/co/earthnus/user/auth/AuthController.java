package kr.co.earthnus.user.auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.earthnus.user.camBoard.CamBoardService;
import kr.co.earthnus.user.camBoard.camBoardBean;
import kr.co.earthnus.user.cheBoard.CheBoardBean;


@Controller
public class AuthController {
	@Autowired
	private AuthService service;
	@Autowired
	private CamBoardService camBoardService;
	@Autowired
	private KakaoAPI kakao;

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	private static final Log LOG = LogFactory.getLog(AuthController.class);
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getIndex(Model model) throws java.text.ParseException {
		String total_pay = service.getTotal_pay();
		String endCam = service.getEndCam();
		String total_f = service.getTotal_f();
		String total_o = service.getTotal_o();
		String total_i = service.getTotal_i();
		String total_p = service.getTotal_p();
		List<camBoardBean> list = service.getCb_list();
		List<CheBoardBean> ch_list = service.getCh_list();
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(int i = 0; i < ch_list.size(); i++) {
			ch_list.get(i).setCheb_time(fm.parse(ch_list.get(i).getCheb_date()));
		}
		
		model.addAttribute("getTotal_pay",total_pay);
		model.addAttribute("getEndCam",endCam);
		model.addAttribute("getTotal_f",total_f);
		model.addAttribute("getTotal_o",total_o);
		model.addAttribute("getTotal_i",total_i);
		model.addAttribute("getTotal_p",total_p);
		model.addAttribute("getCh_list", ch_list);

		camBoardService.getBoardList("", "CAMB_ENTIRE", "인덱스조회", "entire", "CAMB_NUM", "DESC", "6", "1", list, model);
		
		return "index";
	}

	
	@RequestMapping(value = "/auth/login", method = RequestMethod.GET)
	   public String login() {
	      return "auth/login";
	      
	   }
	

	//�꽕�씠踰� 濡쒓렇�씤
		@RequestMapping(value = "/auth/callback", method = RequestMethod.GET)
		public String callback(Model model, @RequestParam String code, @RequestParam String state, 
				HttpSession session, AuthBean aBean) throws IOException, ParseException{
			
			OAuth2AccessToken oauthToken;
			
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	        //1. 濡쒓렇�씤 �궗�슜�옄 �젙蹂대�� �씫�뼱�삩�떎.
			apiResult = naverLoginBO.getUserProfile(oauthToken);  //String�삎�떇�쓽 json�뜲�씠�꽣
			
		
			
			//2. String�삎�떇�씤 apiResult瑜� json�삎�깭濡� 諛붽퓞
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			
			//3. �뜲�씠�꽣 �뙆�떛 
			//Top�젅踰� �떒怨� _response �뙆�떛
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			//response�쓽 nickname媛� �뙆�떛
			String id = (String)response_obj.get("id");
			String name = (String) response_obj.get("name");
			String email = (String) response_obj.get("email");
			String mobile = (String) response_obj.get("mobile");
			String birthday = (String) response_obj.get("birthday");
			String birthyear = (String) response_obj.get("birthyear");
			String gender = (String) response_obj.get("gender");
			String mem_birth = birthyear + '-' + birthday;
			
			mobile = mobile.replace("-","");
			if(response_obj.get("id") != null) {
			//4.�뙆�떛 �땳�꽕�엫 �꽭�뀡�쑝濡� ���옣
			session.setAttribute("mem_id",id); //�꽭�뀡 �깮�꽦
			session.setAttribute("mem_name", name);
			session.setAttribute("mem_email", email);
			session.setAttribute("mem_tel", mobile);
	
			session.setAttribute("mem_birth", mem_birth);
			session.setAttribute("mem_gender", gender);
			if (gender.equals("M")) {
				session.setAttribute("mem_gender", "male");
			} else if (gender.equals("F")) {
				session.setAttribute("mem_gender", "female");
			} else {
				session.setAttribute("mem_gender", "none");
			}
	
			
			model.addAttribute("result", apiResult);
			String auth_id = (String) session.getAttribute("mem_id");
			aBean = service.getNaverLogin(auth_id);
			model.addAttribute("aBean", aBean);
			if (aBean != null) {
				session.setAttribute("auth", aBean);
				 String redirectUrl = (String) session.getAttribute("url_prior_login");
				 if(redirectUrl != null) {
					 String str = redirectUrl.substring(24);
					 LOG.error("============>/auth/callback" + str);
					 if(str.equals("/goods/exGoods")) {
						 return "redirect:" + str;
					 }else if(str.contains("donation")) {
						 return "redirect:" + str;
					 }
				 }else {
					 return "redirect:/";
				 }
				 }else {
					 return "redirect:/join_naver";
				 }
		} return "/auth/login";
	}
		

		
		
//濡쒓렇�븘�썐
	@RequestMapping(value = "/naverLogout")
	public String naverLogout(HttpSession session)throws IOException {
				session.removeAttribute(apiResult);
				session.invalidate();

				return "redirect:/";
			}
	
	
	
	
	@RequestMapping(value = "/auth/login", method = RequestMethod.POST)
	public String loginch(@RequestParam("auth_pw") String auth_pw, AuthBean aBean,  HttpServletResponse response, HttpSession session, Model model)
			throws NoSuchAlgorithmException, IOException {
		model.addAttribute("id", aBean.getAuth_id());
		aBean = service.getLogin(aBean.getAuth_id(), auth_pw);
		if (aBean != null) {
			session.setAttribute("auth", aBean);
			 String redirectUrl = (String) session.getAttribute("url_prior_login");
			 if(redirectUrl != null) {
				 String str = redirectUrl.substring(24);
				 LOG.error("============>/auth/login" + str);
				 if(str.contains("/goods/exGoods")) {
					 return "redirect:" + str;
				 }else if(str.contains("donation")) {
					 return "redirect:" + str;
				 }
			 }else {
				 return "redirect:/";
			 }
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('�븘�씠�뵒 �삉�뒗 鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�뒿�땲�떎.');location.href=\"/auth/login\"</script>");
			out.close();
		}
		return "auth/login";
			
	}

	@RequestMapping("/logout")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/auth/find")
	public String find() {
		return "/auth/find";
	}

	@RequestMapping("/auth/findPW")
	public String findPW() {
		return "/auth/findPW";
	}

	// 移댁뭅�삤濡쒓렇�씤

	@RequestMapping(value = "/kakaoLogin")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session, Model model, AuthBean aBean) {

		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		if (userInfo.get("email") != null) {
			session.setAttribute("auth_id", userInfo.get("email"));
			session.setAttribute("auth_name", userInfo.get("nickname"));
			session.setAttribute("mem_email", userInfo.get("email"));
			
			
			String auth_id = (String) session.getAttribute("auth_id");
			
			if (userInfo.get("gender").toString().equals("male")) {
				session.setAttribute("mem_gender", "male");
			} else if (userInfo.get("gender").toString().equals("female")) {
				session.setAttribute("mem_gender", "female");
			} else {
				session.setAttribute("mem_gender", "none");
			}
			
		
			session.setAttribute("access_Token", access_Token);
			aBean = service.getKakaoLogin(auth_id);
			model.addAttribute("aBean", aBean);
			if (aBean != null) {
				session.setAttribute("auth", aBean);
				 String redirectUrl = (String) session.getAttribute("url_prior_login");
				 if(redirectUrl != null) {
					 String str = redirectUrl.substring(24);
					 LOG.error("============>/kakaoLogin" + str);
					 if(str.equals("/goods/exGoods")) {
						 return "redirect:" + str;
					 }else if(str.contains("donation")) {
						 return "redirect:" + str;
					 }
				 }else {
					 return "redirect:/";
				 }
				 }else { 
					 return "redirect:/join_kakao";
				 }
		} return "/auth/login";
	}

//移댁뭅�삤 濡쒓렇�븘�썐
	@RequestMapping(value = "/kakaoLogout")
	public String logout(HttpSession session) {
		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("auth_id");
		return "/";
	}

	
}