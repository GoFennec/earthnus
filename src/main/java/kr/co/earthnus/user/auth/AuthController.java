package kr.co.earthnus.user.auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import kr.co.earthnus.user.camBoard.camBoardBean;
import kr.co.earthnus.user.cheBoard.CheBoardBean;


@Controller
public class AuthController {
	@Autowired
	private AuthService service;
	@Autowired
	private KakaoAPI kakao;

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getIndex(Model model) {
		String total_pay = service.getTotal_pay();
		String endCam = service.getEndCam();
		String total_f = service.getTotal_f();
		String total_o = service.getTotal_o();
		String total_i = service.getTotal_i();
		String total_p = service.getTotal_p();
		List<camBoardBean> list = service.getCb_list();
		List<CheBoardBean> ch_list = service.getCh_list();
		
		model.addAttribute("getTotal_pay",total_pay);
		model.addAttribute("getEndCam",endCam);
		model.addAttribute("getTotal_f",total_f);
		model.addAttribute("getTotal_o",total_o);
		model.addAttribute("getTotal_i",total_i);
		model.addAttribute("getTotal_p",total_p);
		model.addAttribute("getCb_list", list);
		model.addAttribute("getCh_list", ch_list);
		return "index";
	}

	
	@RequestMapping(value = "/auth/login", method = RequestMethod.GET)
	   public String login() {
	      return "auth/login";
	      
	   }
	

	//네이버 로그인
		@RequestMapping(value = "/auth/callback", method = RequestMethod.GET)
		public String callback(Model model, @RequestParam String code, @RequestParam String state, 
				HttpSession session, AuthBean aBean) throws IOException, ParseException{
			
			OAuth2AccessToken oauthToken;
			
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	        //1. 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken);  //String형식의 json데이터
			
		
			
			//2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			
			//3. 데이터 파싱 
			//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			//response의 nickname값 파싱
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
			//4.파싱 닉네임 세션으로 저장
			session.setAttribute("mem_id",id); //세션 생성
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
					 String str = redirectUrl.substring(23);
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
		

		
		
//로그아웃
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
				 String str = redirectUrl.substring(23);
				 if(str.equals("/goods/exGoods")) {
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
			out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');location.href=\"/auth/login\"</script>");
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

	// 카카오로그인

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
					 String str = redirectUrl.substring(23);
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

//카카오 로그아웃
	@RequestMapping(value = "/kakaoLogout")
	public String logout(HttpSession session) {
		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("auth_id");
		return "/";
	}

	
}