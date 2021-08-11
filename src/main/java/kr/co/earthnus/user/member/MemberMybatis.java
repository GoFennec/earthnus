package kr.co.earthnus.user.member;

import org.apache.ibatis.annotations.Param;

import kr.co.earthnus.util.MailBean;

public interface MemberMybatis {
	
	public int insertMember(MemberBean memberBean);
	public String myPoint(String mem_id);
	public String myDonation(String mem_id);
	public MemberBean myInfo(String mem_id);
	public void updateMyInfo(MemberBean memberBean);
	public void deleteMember(String mem_id);
	public int idCheck(String mem_id);
	public String pwCheck(String mem_pw);
	public int insertMail(MailBean MailBean);
	public MailBean selectMail(@Param("id") String id);
}