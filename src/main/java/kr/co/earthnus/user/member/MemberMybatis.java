package kr.co.earthnus.user.member;

import java.util.ArrayList;

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
	public MailBean selectMail(@Param("name") String name);
	public int find(@Param("findName") String findName, @Param("findEmail") String findEmail);
	public ArrayList<MemberBean> findID(@Param("findName") String findName);
}