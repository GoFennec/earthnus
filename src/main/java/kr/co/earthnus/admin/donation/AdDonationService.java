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
}
