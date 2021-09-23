package kr.co.earthnus.user.donation;

import java.util.List;

public interface DonationMybatis {
	public List<DonationBean> getOcean(DonationBean bean);
	public List<DonationBean> getForest(DonationBean bean);
	public List<DonationBean> getPlastic(DonationBean bean);
	public List<DonationBean> getIce(DonationBean bean);
}
