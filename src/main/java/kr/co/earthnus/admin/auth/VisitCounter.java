package kr.co.earthnus.admin.auth;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class VisitCounter implements HttpSessionListener{
	
	@Override
    public void sessionCreated(HttpSessionEvent event){
		AdAuthMybatis dao = getSessionService(event).getMapper(AdAuthMybatis.class);
		VisitCountBean vo = new VisitCountBean();
		
        HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        vo.setVisit_ip(req.getRemoteAddr());
        vo.setVisit_agent(req.getHeader("User-Agent"));//브라우저 정보
        dao.insertVisitor(vo);
    }
    @Override
    public void sessionDestroyed(HttpSessionEvent event){
        //TODO Auto-generated method stub
    }
    
    private SqlSessionTemplate getSessionService(HttpSessionEvent se) {
		WebApplicationContext context = WebApplicationContextUtils
				.getWebApplicationContext(se.getSession().getServletContext());
		return (SqlSessionTemplate) context.getBean("sqlSessionTemplate");
	}
	

}
