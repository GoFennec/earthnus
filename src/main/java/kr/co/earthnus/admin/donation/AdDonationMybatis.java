package kr.co.earthnus.admin.donation;

import java.util.List;

import kr.co.earthnus.user.pay.PayBean;

public interface AdDonationMybatis {
	public List<PayBean> getAdDonationList();
	public List<PayBean> waiting();
	public List<PayBean> cancel();
	public int donationCount();
	public void updatePay(PayBean bean);
	public void updatePoint(PayBean bean);
	
	public int payTotal();
	public int payMonthly();
	public int payWaiting();
	public int payTotalPoint();
	
	public int payPlastic();
	public int payForest();
}
