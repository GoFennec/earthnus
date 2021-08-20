package kr.co.earthnus.admin.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.earthnus.user.member.MemberBean;

@Service("adMemberService")
public class AdMemberService {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MemberBean> memberList() {
		AdMemberMybatis dao = mybatis.getMapper(AdMemberMybatis.class);
		List<MemberBean> memberList = dao.memberList();
		return memberList;
	}
}
