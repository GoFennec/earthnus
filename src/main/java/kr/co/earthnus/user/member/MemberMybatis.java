package kr.co.earthnus.user.member;

public interface MemberMybatis {
	
	public int insertMember(MemberBean memberBean);
	public MemberBean myInfo(String mem_id);
	public void updateMyInfo(MemberBean memberBean);
	public void deleteMember(MemberBean memberBean);
}