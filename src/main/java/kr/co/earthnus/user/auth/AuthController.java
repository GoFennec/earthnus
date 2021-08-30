package kr.co.earthnus.user.auth;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

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
	public String index(Model model) {
		String total_pay = service.total_pay();
		String total_f = service.total_f();
		String total_o = service.total_o();
		String total_i = service.total_i();
		String total_p = service.total_p();
		List<camBoardBean> list = service.cb_list();
		List<CheBoardBean> ch_list = service.ch_list();
		
		model.addAttribute("total_pay",total_pay);
		model.addAttribute("total_f",total_f);
		model.addAttribute("total_o",total_o);
		model.addAttribute("total_i",total_i);
		model.addAttribute("total_p",total_p);
		model.addAttribute("cb_list", list);
		model.addAttribute("ch_list", ch_list);
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
			System.out.println("여기는 callback session : " + session);
			System.out.println("여기는 callback state : " + state);
			System.out.println("여기는 callback code : " + code);
			
			OAuth2AccessToken oauthToken;
			
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	        System.out.println("oauthToken쪽 : " + oauthToken);
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
			System.out.println(mobile);
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
			System.out.println("id test" + auth_id);
			aBean = service.naverLogin(auth_id);
			model.addAttribute("aBean", aBean);
			
			if(aBean == null) {
				return "redirect:/join_naver";
			}else {
				session.setAttribute("auth", aBean);
				return "redirect:/";
			}
		} else {
			return "/auth/login";
		}
}
		
		//로그아웃
		@RequestMapping(value = "/naverLogout")
		public String naverLogout(HttpSession session)throws IOException {
				System.out.println("여기는 logout");
				session.removeAttribute(apiResult);
				session.invalidate();

		        
				return "redirect:/";
			}
	
	
	
	
	@RequestMapping(value = "/auth/login", method = RequestMethod.POST)
	public String loginch(@RequestParam("auth_pw") String auth_pw, AuthBean aBean, HttpSession session, Model model)
			throws NoSuchAlgorithmException {
		model.addAttribute("id", aBean.getAuth_id());
		System.out.println(auth_pw);
		aBean = service.login(aBean.getAuth_id(), auth_pw);
		if (aBean != null) {
			session.setAttribute("auth", aBean);
			System.out.println("로그인쪽 세션" + session);
			 String redirectUrl = (String) session.getAttribute("url_prior_login");
			 System.out.println(redirectUrl);
			 if(redirectUrl != null) {
				 String str = redirectUrl.substring(21);
				 System.out.println(str);
				 if(str.equals("/goods/list")) {
					 return "redirect:" + str;
				 }else if(str.contains("donation")) {
					 return "redirect:" + str;
				 }
			 }
			else {
				 return "index";
			 }
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

		System.out.println("code : " + code);
		String access_Token = kakao.getAccessToken(code);
		System.out.println("controller access_token : " + access_Token);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);
		if (userInfo.get("email") != null) {
			System.out.println("email not null");
			session.setAttribute("auth_id", userInfo.get("email"));
			session.setAttribute("auth_name", userInfo.get("nickname"));
			session.setAttribute("mem_email", userInfo.get("email"));
			
			
			String auth_id = (String) session.getAttribute("auth_id");
			
			System.out.println("어쓰아이디" + auth_id);
			if (userInfo.get("gender").toString().equals("male")) {
				session.setAttribute("mem_gender", "male");
			} else if (userInfo.get("gender").toString().equals("female")) {
				session.setAttribute("mem_gender", "female");
			} else {
				session.setAttribute("mem_gender", "none");
			}
			
		
			session.setAttribute("access_Token", access_Token);
			aBean = service.kakaoLogin(auth_id);
			model.addAttribute("aBean", aBean);
			if (aBean == null) {
				return "redirect:/join_kakao";
			} else {
				session.setAttribute("auth", aBean);
				return "redirect:/";
			}
		} else {
			return "/auth/login";
		}
	}

//카카오 로그아웃
	@RequestMapping(value = "/kakaoLogout")
	public String logout(HttpSession session) {
		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("auth_id");
		return "index";
	}

	
}