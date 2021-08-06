package kr.co.earthnus.user.donation;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("donationService")
public class DonationService {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<DonationBean> getOcean(DonationBean bean) {
		DonationMybatis dao = mybatis.getMapper(DonationMybatis.class);
		List<DonationBean> getOcean = dao.getOcean(bean);
		return getOcean;
	}

	public List<DonationBean> getForest(DonationBean bean) {
		DonationMybatis dao = mybatis.getMapper(DonationMybatis.class);
		List<DonationBean> getForest = dao.getForest(bean);
		return getForest;
	}
	
	public List<DonationBean> getPlastic(DonationBean bean) {
		DonationMybatis dao = mybatis.getMapper(DonationMybatis.class);
		List<DonationBean> getPlastic = dao.getPlastic(bean);
		return getPlastic;
	}
	
	public List<DonationBean> getIce(DonationBean bean) {
		DonationMybatis dao = mybatis.getMapper(DonationMybatis.class);
		List<DonationBean> getIce = dao.getIce(bean);
		return getIce;
	}
}