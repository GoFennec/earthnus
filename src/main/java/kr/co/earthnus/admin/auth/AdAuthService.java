package kr.co.earthnus.admin.auth;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.earthnus.user.auth.AuthBean;
import kr.co.earthnus.user.member.MemberBean;

@Service("adAuthService")
public class AdAuthService {
	@Autowired
	private SqlSessionTemplate mybatis;

	public AuthBean adLogin(String auth_id, String auth_pw){
		AdAuthMybatis dao = mybatis.getMapper(AdAuthMybatis.class);
		AuthBean aBean = new AuthBean();
		MemberBean mBean = dao.selectByAdId(auth_id);
		if (mBean.getMem_pw().equals(auth_pw)) {
			aBean.setAuth_id(mBean.getMem_id());
			aBean.setAuth_name(mBean.getMem_name());
		} else {
			aBean = null;
		}
		return aBean;
	}
}