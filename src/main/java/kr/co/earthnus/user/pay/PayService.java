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
	
	public int insertPay(PayBean pBean) {
		PayMybatis dao = mybatis.getMapper(PayMybatis.class);
		String pay_date = getTimestampToDate(pBean.getPay_date());
		pBean.setPay_date(pay_date);
		int n = dao.insertPay(pBean);
		return n;
	}
	
	public String getTimestampToDate(String timestampStr){
	    long timestamp = Long.parseLong(timestampStr);
	    Date date = new java.util.Date(timestamp*1000L); 
	    SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	    sdf.setTimeZone(java.util.TimeZone.getTimeZone("GMT+9")); 
	    String formattedDate = sdf.format(date);
	    return formattedDate;
	}
	
	public int updatePoint(PayBean pBean) {
		PayMybatis dao = mybatis.getMapper(PayMybatis.class);
		int m = dao.updatePoint(pBean);
		return m;
	}
	
	public PayBean getPayInfo(String var) {
		PayMybatis dao = mybatis.getMapper(PayMybatis.class);
		PayBean pay = dao.getPayInfo(var);
		return pay;
	}
}
