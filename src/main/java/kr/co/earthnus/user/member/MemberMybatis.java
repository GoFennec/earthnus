package kr.co.earthnus.user.member;

public interface MemberMybatis {
	
	public int insertMember(MemberBean memberBean);
	public int idCheck(String mem_id);
}