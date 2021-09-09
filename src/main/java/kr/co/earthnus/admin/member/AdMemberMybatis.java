package kr.co.earthnus.admin.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.earthnus.user.member.MemberBean;

public interface AdMemberMybatis {
	
	public List<MemberBean> getMemberList();
	public List<MemberBean>	getMemberListDetail(@Param("mem_id") String mem_id);
	public int getPayCount(@Param("mem_id") String mem_id);
	public Integer getPayTotal(@Param("mem_id") String mem_id);
	public int getCheerCount(@Param("mem_id") String mem_id);
	
	public int getCheckExgoods(@Param("deleteMember") String deleteMember);
	public int getDeletePW(@Param("deletePW") String deletePW);
	public int adDeleteMember(@Param("deleteMember") String deleteMember);
	
	public int getMemberTotal();
}
