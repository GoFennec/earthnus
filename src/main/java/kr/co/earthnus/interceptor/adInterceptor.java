package kr.co.earthnus.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class adInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

//		@Override
//		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//				throws Exception {
//			
//			HttpSession session = request.getSession();
//			if (session.getAttribute("adauth") == null) {
//				response.sendRedirect("/auth/adLogin");
//				
//				return false;
//			}
//			return true;
//		}
	}
