package kr.co.earthnus.admin.donation;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.earthnus.user.pay.PayBean;

@Service("adDonationSerivce")
public class AdDonationService {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void getAdDonationList(Model model) {
		AdDonationMybatis dao = mybatis.getMapper(AdDonationMybatis.class);
		List<PayBean> adDonationList = dao.getAdDonationList();
		model.addAttribute("adDonationList", adDonationList);
	}
	
	public void waiting(Model model) {
		AdDonationMybatis dao = mybatis.getMapper(AdDonationMybatis.class);

		List<PayBean> waitingList = dao.waiting();
		model.addAttribute("waitingList", waitingList);
	}
	
	public void cancel(Model model) {
		AdDonationMybatis dao = mybatis.getMapper(AdDonationMybatis.class);

		List<PayBean> cancelList = dao.cancel();
		model.addAttribute("cancelList", cancelList);
	}
	
	public void updatePay(PayBean bean) {
		AdDonationMybatis dao = mybatis.getMapper(AdDonationMybatis.class);
		dao.updatePay(bean);
	}
	
	public void updatePoint(PayBean bean) {
		AdDonationMybatis dao = mybatis.getMapper(AdDonationMybatis.class);
		dao.updatePoint(bean);
	}
	
	public void countPay(Model model) {
		AdDonationMybatis dao = mybatis.getMapper(AdDonationMybatis.class);
		
		String payTotal = dao.payTotal();
		String payMonthly = dao.payMonthly();
		int payWaiting = dao.payWaiting();
		String payTotalPoint = dao.payTotalPoint();
		
		String payPlastic = dao.payPlastic();
		String payForest = dao.payForest();
		String payIce = dao.payIce();
		String payOcean = dao.payOcean();
		
		if(payTotal == null) {
			payTotal = "0";
		}else if(payMonthly == null) {
			payMonthly = "0";
		}else if(payTotalPoint == null) {
			payTotalPoint = "0";
		}else if(payPlastic == null) {
			payPlastic = "0";
		}else if(payForest == null) {
			payForest = "0";
		}else if(payIce == null) {
			payIce = "0";
		}else if(payOcean == null) {
			payOcean = "0";
		}
		
		model.addAttribute("payTotal",payTotal);
		model.addAttribute("payMonthly",payMonthly);
		model.addAttribute("payWaiting",payWaiting);
		model.addAttribute("payTotalPoint",payTotalPoint);
		
		model.addAttribute("payPlastic",payPlastic);
		model.addAttribute("payForest",payForest);
		model.addAttribute("payIce",payIce);
		model.addAttribute("payOcean",payOcean);
	}
}
