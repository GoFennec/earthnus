package kr.co.earthnus.user.auth;

import java.security.NoSuchAlgorithmException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.earthnus.user.member.MemberBean;
import kr.co.earthnus.util.SHA256;

@Service("authService")
public class AuthService {
	@Autowired
	private SqlSessionTemplate mybatis;

	public AuthBean login(String auth_id, String auth_pw) throws NoSuchAlgorithmException{
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		AuthBean aBean = new AuthBean();
		
		SHA256 sha256 = new SHA256();
		//비밀번호
        String password = auth_pw;
        //SHA256으로 암호화된 비밀번호
        String cryptogram = sha256.encrypt(password);
        
        System.out.println(cryptogram);
        
        auth_pw = cryptogram;
        //비밀번호 일치 여부
        System.out.println(cryptogram.equals(sha256.encrypt(password)));
		
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