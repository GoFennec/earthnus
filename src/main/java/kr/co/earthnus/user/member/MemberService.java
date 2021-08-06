package kr.co.earthnus.user.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertMember(MemberBean memberBean) {
		System.out.println("서비스");
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int n = dao.insertMember(memberBean);
		return n;
	}
	
}