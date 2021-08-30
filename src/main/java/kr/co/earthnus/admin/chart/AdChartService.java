package kr.co.earthnus.admin.chart;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class AdChartService {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void donationPie(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int donationPiePlastic = dao.donationPiePlastic();
		int donationPieOcean = dao.donationPieOcean();
		int donationPieIce = dao.donationPieIce();
		int donationPieForest = dao.donationPieForest();
		
		model.addAttribute("donationPiePlastic", donationPiePlastic);
		model.addAttribute("donationPieOcean", donationPieOcean);
		model.addAttribute("donationPieIce", donationPieIce);
		model.addAttribute("donationPieForest", donationPieForest);
	}
	
	public void camPie(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int camPiePlastic = dao.camPiePlastic();
		int camPieOcean = dao.camPieOcean();
		int camPieIce = dao.camPieIce();
		int camPieForest = dao.camPieForest();
		
		model.addAttribute("camPiePlastic", camPiePlastic);
		model.addAttribute("camPieOcean", camPieOcean);
		model.addAttribute("camPieIce", camPieIce);
		model.addAttribute("camPieForest", camPieForest);
	}
	
	
	public List<Integer> countVisitor() {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int count = 0;
		List<Integer> count1 = new ArrayList<Integer>();
		
		for(int i = 0; i < 7; i++) {
			count = dao.countVisitor(i);
			count1.add(count);
		}
		return count1;
	}

}