package kr.co.earthnus.user.auth;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.earthnus.user.camBoard.camBoardBean;
import kr.co.earthnus.user.cheBoard.CheBoardBean;
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


        auth_pw = cryptogram;
        //비밀번호 일치 여부

        MemberBean mBean = dao.selectById(auth_id);
		if (mBean == null) {
			aBean = null;
		} else {
			if (mBean.getMem_pw().equals(auth_pw) && mBean.getMem_id().equals(auth_id)) {
				aBean.setAuth_id(mBean.getMem_id());
				aBean.setAuth_name(mBean.getMem_name());
			} else {
				aBean = null;
			}

		}
		return aBean;
	}
	
	public AuthBean kakaoLogin(String auth_id) {
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		AuthBean aBean = new AuthBean();
		MemberBean mBean = dao.selectById(auth_id);
			if (mBean == null) {
				aBean = null;
			} else {	
			aBean.setAuth_id(mBean.getMem_id());
			aBean.setAuth_name(mBean.getMem_name());
		} return aBean;
}
	
	public AuthBean naverLogin(String auth_id) {
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		AuthBean aBean = new AuthBean();
		MemberBean mBean = dao.selectById(auth_id);
			if (mBean == null) {
				aBean = null;
			} else {	
			aBean.setAuth_id(mBean.getMem_id());
			aBean.setAuth_name(mBean.getMem_name());
		} return aBean;
}
	public String total_pay() {
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		String total_pay = dao.total_pay();
		return total_pay;
	}
	public String endCam() {
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		String endCam = dao.endCam();
		return endCam;
	}
	
	public String total_f() {
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		String total_f = dao.total_f();
		return total_f;
	}
	public String total_o() {
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		String total_o = dao.total_o();
		return total_o;
	}
	public String total_i() {
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		String total_i = dao.total_i();
		return total_i;
	}
	public String total_p() {
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		String total_p = dao.total_p();
		return total_p;
	}
	public List<CheBoardBean> ch_list() {
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		List<CheBoardBean> ch_list = dao.ch_list();
		return ch_list;
	}
	public List<camBoardBean> cb_list() {
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		List<camBoardBean> list = dao.cb_list();
		return list;
	}
}