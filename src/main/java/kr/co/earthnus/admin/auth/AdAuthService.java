package kr.co.earthnus.admin.auth;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.earthnus.admin.member.AdMemberBean;
import kr.co.earthnus.user.camBoard.camBoardBean;
import kr.co.earthnus.user.cheBoard.CheBoardBean;
import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.user.pay.PayBean;
import kr.co.earthnus.util.SHA256;

@Service("adAuthService")
public class AdAuthService {
	@Autowired
	private SqlSessionTemplate mybatis;

	public AdAuthBean adLogin(String auth_id, String auth_pw) throws NoSuchAlgorithmException{
		AdAuthMybatis dao = mybatis.getMapper(AdAuthMybatis.class);
		AdAuthBean aBean = new AdAuthBean();
		
		SHA256 sha256 = new SHA256();
        String password = auth_pw;
        String cryptogram = sha256.encrypt(password);
        auth_pw = cryptogram;

		
        AdMemberBean mBean = dao.getSelectByAdId(auth_id);
		if (mBean == null) {
			aBean = null;
		} else {
			System.out.println(mBean.getAd_pw() + " ad디비에 있는 비밀번호");
			if (mBean.getAd_pw().equals(auth_pw) && mBean.getAd_id().equals(auth_id)) {
				aBean.setAuth_id(mBean.getAd_id());
				aBean.setAuth_name(mBean.getAd_name());
				System.out.println(aBean.getAuth_id() + " 서비스");
			} else {
				aBean = null;
			}
		}
		return aBean;
	}
	
	public List<PayBean> adPay() {
		AdAuthMybatis dao = mybatis.getMapper(AdAuthMybatis.class);
		List<PayBean> adPayList = dao.getAdPay();
		return adPayList;
	}
	
	public List<ExGoodsBean> adGoods() {
		AdAuthMybatis dao = mybatis.getMapper(AdAuthMybatis.class);
		List<ExGoodsBean> adGoodsList = dao.getAdGoods();
		return adGoodsList;
	}
	
	public List<camBoardBean> adCamboard() {
		AdAuthMybatis dao = mybatis.getMapper(AdAuthMybatis.class);
		List<camBoardBean> adCamboardList = dao.getAdCamboard();
		return adCamboardList;
	}
	
	public List<CheBoardBean> adCheboard() {
		AdAuthMybatis dao = mybatis.getMapper(AdAuthMybatis.class);
		List<CheBoardBean> adCheboardList = dao.getAdCheboard();
		return adCheboardList;
	}
	
	public String sumPay() {
		AdAuthMybatis dao = mybatis.getMapper(AdAuthMybatis.class);
		String sumPay = dao.getSumPay();
		if(sumPay == null) {
			sumPay = "0";
		}
		return sumPay;
	}
	
	public int countMember() {
		AdAuthMybatis dao = mybatis.getMapper(AdAuthMybatis.class);
		int countMember = dao.getCountMember();
		return countMember;
	}
	
	public int orderExGoods() {
		AdAuthMybatis dao = mybatis.getMapper(AdAuthMybatis.class);
		int orderExGoods = dao.getOrderExGoods();
		return orderExGoods;
	}
	
	public int todayVisitor() {
		AdAuthMybatis dao = mybatis.getMapper(AdAuthMybatis.class);
		int todayVisitor = dao.getTodayVisitor();
		return todayVisitor;
	}
}