package kr.co.earthnus.admin.auth;

import kr.co.earthnus.user.member.MemberBean;

public interface AdAuthMybatis {
	public MemberBean selectByAdId(String auth_id);
}
