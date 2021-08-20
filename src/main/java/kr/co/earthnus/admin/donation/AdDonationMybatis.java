package kr.co.earthnus.admin.donation;

import java.util.List;

import kr.co.earthnus.user.goods.PagingBean;
import kr.co.earthnus.user.pay.PayBean;

public interface AdDonationMybatis {
	public List<PayBean> getAdDonationList(PagingBean pBean);
	public int donationCount();
	public void updatePay(PayBean bean);
	public void updatePoint(PayBean bean);
}
