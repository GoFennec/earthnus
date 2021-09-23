package kr.co.earthnus.admin.donation;

import java.util.List;

import kr.co.earthnus.user.pay.PayBean;

public interface AdDonationMybatis {
	public List<PayBean> getAdDonationList();
	public List<PayBean> getWaiting();
	public List<PayBean> getCancel();
	
	public int getDonationCount();
	public void updatePay(PayBean bean);
	public void updatePoint(PayBean bean);
	
	public String getPayTotal();
	public String getPayMonthly();
	public int getPayWaiting();
	public String getPayTotalPoint();
	
	public String getPayPlastic();
	public String getPayForest();
	public String gatPayIce();
	public String getPayOcean();
}
