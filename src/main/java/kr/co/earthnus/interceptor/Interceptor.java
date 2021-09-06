package kr.co.earthnus.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		// AuthBean aBean= (AuthBean)session.getAttribute("aBean");

		if (session.getAttribute("auth") == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인이 필요한 서비스입니다.\r\n" + 
					"로그인 페이지로 이동합니다.'); location.href=\"/auth/login\"</script>");
			out.close();
			String referrer = request.getHeader("Referer");
			request.getSession().setAttribute("url_prior_login", referrer);
			// response.sendRedirect("/auth/login");
			return false;
		}
		return true;
	}
}
