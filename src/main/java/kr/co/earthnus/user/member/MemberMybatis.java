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
	public String getMyPoint(String mem_id);
	public String getMyDonation(String mem_id);
	public String getMyDonation_f(String mem_id);
	public String getMyDonation_o(String mem_id);
	public String getMyDonation_i(String mem_id);
	public String getMyDonation_p(String mem_id);
	
	public MemberBean getMyInfo(String mem_id);
	public void updateMyInfo(MemberBean memberBean);

	public void updatePw(Map<String, Object> map);
	public void updateEmail(Map<String, Object> map);
	public int getCheckExgoods(String mem_id);
	public void deleteMember(String mem_id);
	public void deleteMember_api(@Param("mem_id")String mem_id,@Param("deleteMember")String deleteMember);
	public int getDeleteCount();
	public int getIdCheck(@Param("mem_id") String mem_id);
	public String getPwCheck(String mem_id);
	
	public int insertMail(MailBean MailBean);
	public MailBean getSelectMail(@Param("name") String name, @Param("email") String email);
	public int getFind(@Param("findName") String findName, @Param("findEmail") String findEmail);
	public int getFindpw(@Param("findName") String findName, @Param("findEmail") String findEmail, @Param("mem_id") String mem_id);
	public List<MemberBean> getFindID(@Param("findName") String findName, @Param("mail_receiver") String mail_receiver);
	public int changePW(@Param("changeNum") String changeNum, @Param("email") String email, @Param("name") String name);
	public int getMyOrderCount(String mem_id); 
	public List<ExGoodsBean> getMyOrder(@Param("mem_id") String mem_id, @Param("contentnum") int contentnum, @Param("pagenum") int pagenum);
	public int getMyMessageCount(String mem_id); 
	public List<CheBoardBean> getMyMessage(@Param("mem_id") String mem_id, @Param("contentnum") int contentnum, @Param("pagenum") int pagenum);
	public int getMyPayCount(String mem_id); 
	public List<PayBean> getMyPay(@Param("mem_id") String mem_id, @Param("contentnum") int contentnum, @Param("pagenum") int pagenum);
}