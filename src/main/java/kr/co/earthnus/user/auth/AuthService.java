package kr.co.earthnus.user.auth;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.earthnus.user.camBoard.camBoardBean;
import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.user.member.MemberBean;
import kr.co.earthnus.user.member.MemberMybatis;
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
        System.out.println(cryptogram.equals(sha256.encrypt(password)) + " 암호화 한 비밀번호");

        MemberBean mBean = dao.selectById(auth_id);
		if (mBean == null) {
			aBean = null;
		} else {
			System.out.println(mBean.getMem_pw() + " 디비에 있는 비밀번호");
			if (mBean.getMem_pw().equals(auth_pw) && mBean.getMem_id().equals(auth_id)) {
				aBean.setAuth_id(mBean.getMem_id());
				aBean.setAuth_name(mBean.getMem_name());
				System.out.println(aBean.getAuth_id() + " 서비스");
			} else {
				aBean = null;
			}

		}
		return aBean;
	}
	
	public AuthBean kakaoLogin(String auth_id) {
		System.out.println("서비스 auth_id" + auth_id);
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		AuthBean aBean = new AuthBean();
		MemberBean mBean = dao.selectById(auth_id);
			System.out.println("abean? " + aBean);
			if (mBean == null) {
				aBean = null;
			} else {	
			aBean.setAuth_id(mBean.getMem_id());
			aBean.setAuth_name(mBean.getMem_name());
		} return aBean;
}
	
	public AuthBean naverLogin(String auth_id) {
		System.out.println("naver 서비스 auth_id" + auth_id);
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		AuthBean aBean = new AuthBean();
		MemberBean mBean = dao.selectById(auth_id);
			System.out.println("abean? " + aBean);
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
/*	public camBoardBean cb_list() {
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		camBoardBean cbBean = dao.cb_list();
		return cbBean;
	}*/
	public List<camBoardBean> cb_list() {
		AuthMybatis dao = mybatis.getMapper(AuthMybatis.class);
		List<camBoardBean> list = dao.cb_list();
		return list;
	}
}