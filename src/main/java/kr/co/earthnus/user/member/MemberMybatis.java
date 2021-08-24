package kr.co.earthnus.user.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.earthnus.user.cheBoard.CheBoardBean;
import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.user.pay.PayBean;
import kr.co.earthnus.util.MailBean;

public interface MemberMybatis {
	
	public int insertMember(MemberBean memberBean);
	public int insertMember_kakao(MemberBean memberBean);
	public int insertMember_naver(MemberBean memberBean);
	public String myPoint(String mem_id);
	public String myDonation(String mem_id);
	public String myDonation_f(String mem_id);
	public String myDonation_o(String mem_id);
	public String myDonation_i(String mem_id);
	public String myDonation_p(String mem_id);
	
	public MemberBean myInfo(String mem_id);
	public void updateMyInfo(MemberBean memberBean);
	public void updatePw(Map<String, Object> map);
	public void updateEmail(Map<String, Object> map);
	public void deleteMember(String mem_id);
	public int idCheck(String mem_id);
	public String pwCheck(String mem_id);
	
	public int insertMail(MailBean MailBean);
	public MailBean selectMail(@Param("name") String name, @Param("email") String email);
	public String selectMailPW(@Param("email") String email, @Param("mem_id") String mem_id);
	public int find(@Param("findName") String findName, @Param("findEmail") String findEmail);
	public int findpw(@Param("findName") String findName, @Param("findEmail") String findEmail, @Param("mem_id") String mem_id);
	public List<MemberBean> findID(@Param("findName") String findName, @Param("mail_receiver") String mail_receiver);
	public int changePW(@Param("changeNum") String changeNum, @Param("email") String email, @Param("name") String name);
	public List<ExGoodsBean> myOrder(String mem_id);
	public List<CheBoardBean> myMessage(String mem_id);
	public List<PayBean> myPay(String mem_id);
}