package kr.co.earthnus.user.pay;

import kr.co.earthnus.user.auth.AuthBean;
import kr.co.earthnus.user.member.MemberBean;

public interface PayMybatis {
	public MemberBean getMemberInfo(AuthBean auth);
	public void insertPay(PayBean pBean);
	public PayBean getPayInfo(String var);
}
