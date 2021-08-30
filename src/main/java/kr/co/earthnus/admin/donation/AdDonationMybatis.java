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
	
	public String payTotal();
	public String payMonthly();
	public int payWaiting();
	public String payTotalPoint();
	
	public String payPlastic();
	public String payForest();
	public String payIce();
	public String payOcean();
}
