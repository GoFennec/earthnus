package kr.co.earthnus.user.member;

import org.apache.ibatis.annotations.Param;

import kr.co.earthnus.util.MailBean;

public interface MemberMybatis {
	
	public int insertMember(MemberBean memberBean);
	public MemberBean myPage(String mem_id);
	public MemberBean myInfo(String mem_id);
	public void updateMyInfo(MemberBean memberBean);
	public void deleteMember(MemberBean memberBean);
	public int idCheck(String mem_id);
	public int pwCheck(String mem_pw);
	public int insertMail(MailBean MailBean);
	public int selectMail(@Param("mailCheck") String mailCheck, @Param("email") String email);
}