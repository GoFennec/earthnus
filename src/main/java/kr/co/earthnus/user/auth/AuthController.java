package kr.co.earthnus.user.auth;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

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

import kr.co.earthnus.user.member.MemberBean;

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
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/auth/login", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		model.addAttribute("url",naverAuthUrl);
		return "auth/login";
	}
	
	

	//네이버 로그인
		@RequestMapping(value = "/callback")
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException{
			System.out.println("여기는 callback");
			OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);

	        //1. 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken);  //String형식의 json데이터
			
			/** apiResult json 구조
			{"resultcode":"00",
			 "message":"success",
			 "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
			**/
			
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

			System.out.println(id);
			System.out.println(name);
			System.out.println(email);
			
			
			
			//4.파싱 닉네임 세션으로 저장
			session.setAttribute("sessionId",id); //세션 생성
			
			model.addAttribute("result", apiResult);
		     
			return "/";
		}
		
		//로그아웃
		@RequestMapping(value = "/naverLogout", method = { RequestMethod.GET, RequestMethod.POST })
		public String naverLogout(HttpSession session)throws IOException {
				System.out.println("여기는 logout");
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
			return "redirect:/";
		} else {
			return "auth/login";
		}
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
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session, Model model, AuthBean aBean,
			MemberBean mBean) {

		System.out.println("code : " + code);
		String access_Token = kakao.getAccessToken(code);
		System.out.println("controller access_token : " + access_Token);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);
		if (userInfo.get("email") != null) {
			System.out.println("email not null");
			session.setAttribute("auth_id", userInfo.get("email"));
			session.setAttribute("auth_name", userInfo.get("nickname"));
			String auth_id = (String) session.getAttribute("auth_id");
			System.out.println("어쓰아이디" + auth_id);

			session.setAttribute("access_Token", access_Token);
			aBean = service.kakaoLogin(auth_id);
			model.addAttribute("aBean", aBean);
			if (aBean == null) {
				return "redirect:member/join_kakao";
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
