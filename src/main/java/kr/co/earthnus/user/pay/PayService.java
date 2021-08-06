package kr.co.earthnus.user.pay;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.earthnus.user.auth.AuthBean;
import kr.co.earthnus.user.member.MemberBean;

@Service("payService")
public class PayService {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MemberBean getMemberInfo(AuthBean auth) {
		PayMybatis dao = mybatis.getMapper(PayMybatis.class);
		MemberBean member = dao.getMemberInfo(auth);
		return member;
	}
}
