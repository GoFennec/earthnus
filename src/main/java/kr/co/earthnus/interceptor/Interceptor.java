/*package kr.co.earthnus.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.earthnus.user.auth.AuthBean;

public class Interceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

	
	
//	static final String[] EXCLUDE_URL_LIST = {
//			 "/member/join"
//	};

	
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			
			HttpSession session = request.getSession();
			AuthBean aBean= (AuthBean)session.getAttribute("aBean");
			
			if (aBean == null) {
				response.sendRedirect("/auth/login");
				return false;
			}
			return true;
		}
	
	}
	 */

