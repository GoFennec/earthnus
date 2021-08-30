package kr.co.earthnus.admin.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.earthnus.user.member.MemberBean;

public interface AdMemberMybatis {
	
	public List<MemberBean> memberList();
	public List<MemberBean>	memberListDetail(@Param("mem_id") String mem_id);
	public int payCount(@Param("mem_id") String mem_id);
	public Integer payTotal(@Param("mem_id") String mem_id);
	public int cheerCount(@Param("mem_id") String mem_id);
	public int deletePW(@Param("deletePW") String deletePW);
	public int adDeleteMember(@Param("deleteMember") String deleteMember);
	
	public int memberTotal();
}
