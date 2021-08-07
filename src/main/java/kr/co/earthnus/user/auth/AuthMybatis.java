package kr.co.earthnus.user.auth;

import kr.co.earthnus.user.member.MemberBean;

public interface AuthMybatis {
	public MemberBean selectById(String auth_id);
}
