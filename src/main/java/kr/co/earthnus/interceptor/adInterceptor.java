package kr.co.earthnus.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class adInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			HttpSession session = request.getSession();
			
			if (session.getAttribute("adauth") == null) {
				//response.sendRedirect("/auth/adLogin");
					response.setCharacterEncoding("UTF-8");
				 response.setContentType("text/html;charset=UTF-8");
		         PrintWriter out = response.getWriter();
		         out.println("<script>alert('관리자 로그인이 필요한 서비스입니다. 관리자 로그인 페이지로 이동합니다.'); location.href=\"/auth/adLogin\"</script>");
		         out.close();
				return false;
			}
			return true;
		}
	}
