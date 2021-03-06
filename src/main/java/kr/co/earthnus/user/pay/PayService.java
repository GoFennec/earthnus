package kr.co.earthnus.user.pay;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.earthnus.user.auth.AuthBean;
import kr.co.earthnus.user.member.MemberBean;

@Service("payService")
public class PayService {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MemberBean getMemberInfo(AuthBean auth) {
		PayMybatis dao = mybatis.getMapper(PayMybatis.class);
		MemberBean member = dao.getMemberInfo(auth);
		return member;
	}
	
	public void insertPay(PayBean pBean) {
		PayMybatis dao = mybatis.getMapper(PayMybatis.class);
		String pay_pdate = getTimestampToDate(pBean.getPay_pdate());
		pBean.setPay_pdate(pay_pdate);
		dao.insertPay(pBean);
	}
	
	public String getTimestampToDate(String timestampStr){
	    long timestamp = Long.parseLong(timestampStr);
	    Date date = new java.util.Date(timestamp*1000L); 
	    SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	    sdf.setTimeZone(java.util.TimeZone.getTimeZone("GMT+9")); 
	    String formattedDate = sdf.format(date);
	    return formattedDate;
	}
	
	public PayBean getPayInfo(String var) {
		PayMybatis dao = mybatis.getMapper(PayMybatis.class);
		PayBean pay = dao.getPayInfo(var);
		return pay;
	}
}
