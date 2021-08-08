package kr.co.earthnus.user.auth;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.earthnus.user.member.MemberBean;

@Service("authService")
public class AuthService {
	@Autowired
	private SqlSessionTemplate mybatis;

	public AuthBean login(String auth_id, String auth_pw){
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		AuthBean aBean = new AuthBean();
		MemberBean mBean = dao.selectById(auth_id);
		if (mBean.getMem_pw().equals(auth_pw)) {
			aBean.setAuth_id(mBean.getMem_id());
			aBean.setAuth_name(mBean.getMem_name());
		} else {
			aBean = null;
		}
		return aBean;
	}
}