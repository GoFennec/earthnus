package kr.co.earthnus.admin.chart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		int donationPiePlastic = dao.getDonationPiePlastic();
		int donationPieOcean = dao.getDonationPieOcean();
		int donationPieIce = dao.getDonationPieIce();
		int donationPieForest = dao.getDonationPieForest();
		
		model.addAttribute("donationPiePlastic", donationPiePlastic);
		model.addAttribute("donationPieOcean", donationPieOcean);
		model.addAttribute("donationPieIce", donationPieIce);
		model.addAttribute("donationPieForest", donationPieForest);
	}
	
	public void camPie(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int camPiePlastic = dao.getCamPiePlastic();
		int camPieOcean = dao.getCamPieOcean();
		int camPieIce = dao.getCamPieIce();
		int camPieForest = dao.getCamPieForest();
		
		model.addAttribute("camPiePlastic", camPiePlastic);
		model.addAttribute("camPieOcean", camPieOcean);
		model.addAttribute("camPieIce", camPieIce);
		model.addAttribute("camPieForest", camPieForest);
	}
	
	public void chePie(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int chePiePlastic = dao.getChePiePlastic();
		int chePieOcean = dao.getChePieOcean();
		int chePieIce = dao.getChePieIce();
		int chePieForest = dao.getChePieForest();
		
		model.addAttribute("chePiePlastic", chePiePlastic);
		model.addAttribute("chePieOcean", chePieOcean);
		model.addAttribute("chePieIce", chePieIce);
		model.addAttribute("chePieForest", chePieForest);
	}
	
	
	public void countVisitor(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int count = 0;
		List<Integer> count1 = new ArrayList<Integer>();
		
		for(int i = 0; i < 7; i++) {
			count = dao.getCountVisitor(i);
			count1.add(count);
		}
		model.addAttribute("countVisitor", count1);
	}
	
	public void sumPlastic(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		String count = null;
		int parse = 0;
		List<Integer> count1 = new ArrayList<Integer>();
		
		for(int i = 0; i < 7; i++) {
			count = dao.getSumPlastic(i);
			if(count == null) {
				count = "0";
			}
			parse = Integer.parseInt(count);
			count1.add(parse);
		}
		model.addAttribute("sumPlastic", count1);
	}
	
	public void sumOcean(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		String count = null;
		int parse = 0;
		List<Integer> count1 = new ArrayList<Integer>();
		
		for(int i = 0; i < 7; i++) {
			count = dao.getSumOcean(i);
			if(count == null) {
				count = "0";
			}
			parse = Integer.parseInt(count);
			count1.add(parse);
		}
		model.addAttribute("sumOcean", count1);
	}
	
	public void sumIce(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		String count = null;
		int parse = 0;
		List<Integer> count1 = new ArrayList<Integer>();
		
		for(int i = 0; i < 7; i++) {
			count = dao.getSumIce(i);
			if(count == null) {
				count = "0";
			}
			parse = Integer.parseInt(count);
			count1.add(parse);
		}
		model.addAttribute("sumIce", count1);
	}
	
	public void sumForest(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		String count = null;
		int parse = 0;
		List<Integer> count1 = new ArrayList<Integer>();
		
		for(int i = 0; i < 7; i++) {
			count = dao.getSumForest(i);
			if(count == null) {
				count = "0";
			}
			parse = Integer.parseInt(count);
			count1.add(parse);
		}
		model.addAttribute("sumForest", count1);
	}
	
	public void countMember(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int count = 0;
		List<Integer> count1 = new ArrayList<Integer>();
		
		for(int i = 0; i < 7; i++) {
			count = dao.getCountMember(i);
			count1.add(count);
		}
		model.addAttribute("countMember", count1);
	}
	
	public void countExgoods(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int count = 0;
		List<Integer> count1 = new ArrayList<Integer>();
		
		for(int i = 0; i < 7; i++) {
			count = dao.getCountExgoods(i);
			count1.add(count);
		}
		model.addAttribute("countExgoods", count1);
	}
	
	
	public Map<String, Object> getMonthData(String select_year, String select_month, int lastDay) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		List<Integer> count1 = new ArrayList<Integer>();
		List<Integer> count2 = new ArrayList<Integer>();
		List<Integer> count3 = new ArrayList<Integer>();
		List<Integer> count4 = new ArrayList<Integer>();
		List<Integer> count5 = new ArrayList<Integer>();
		List<Integer> count6 = new ArrayList<Integer>();
		List<Integer> count7 = new ArrayList<Integer>();
		List<Integer> count8 = new ArrayList<Integer>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(int i = 0; i < lastDay; i++) {
			int count = dao.getMonthData(i, select_year, select_month, lastDay);
			count1.add(count);
		}
		map.put("getMonthData", count1);
		
		for(int i = 0; i < lastDay; i++) {
			String count = dao.getPlasticMonth(i, select_year, select_month, lastDay);
			if(count == null) {
				count = "0";
			}
			int parse = Integer.parseInt(count);
			count2.add(parse);
		}
		map.put("getPlasticMonth", count2);
		
		for(int i = 0; i < lastDay; i++) {
			String count = dao.getOceanMonth(i, select_year, select_month, lastDay);
			if(count == null) {
				count = "0";
			}
			int parse = Integer.parseInt(count);
			count3.add(parse);
		}
		map.put("getOceanMonth", count3);
		
		for(int i = 0; i < lastDay; i++) {
			String count = dao.getIceMonth(i, select_year, select_month, lastDay);
			if(count == null) {
				count = "0";
			}
			int parse = Integer.parseInt(count);
			count4.add(parse);
		}
		map.put("getIceMonth", count4);
		
		for(int i = 0; i < lastDay; i++) {
			String count = dao.getForestMonth(i, select_year, select_month, lastDay);
			if(count == null) {
				count = "0";
			}
			int parse = Integer.parseInt(count);
			count5.add(parse);
		}
		map.put("getForestMonth", count5);
		
		for(int i = 0; i < lastDay; i++) {
			int count = dao.getMemberMonth(i, select_year, select_month, lastDay);
			count6.add(count);
		}
		map.put("getMemberMonth", count6);
		
		for(int i = 0; i < lastDay; i++) {
			int count = dao.getDelMemberMonth(i, select_year, select_month, lastDay);
			count7.add(count);
		}
		map.put("getDelMemberMonth", count7);
		
		for(int i = 0; i < lastDay; i++) {
			int count = dao.getExgoodsMonth(i, select_year, select_month, lastDay);
			count8.add(count);
		}
		map.put("getExgoodsMonth", count8);
		
		int getCountVisitorMonth = dao.getCountVisitorMonth(select_year, select_month);
		map.put("getCountVisitorMonth", getCountVisitorMonth);
		
		int getCountMemberMonth = dao.getCountMemberMonth(select_year, select_month);
		map.put("getCountMemberMonth", getCountMemberMonth);
		
		int getCountDelMemberMonth = dao.getCountDelMemberMonth(select_year, select_month);
		map.put("getCountDelMemberMonth", getCountDelMemberMonth);
		
		int getCountExgoodsMonth = dao.getCountExgoodsMonth(select_year, select_month);
		map.put("getCountExgoodsMonth", getCountExgoodsMonth);
		
		String getCountDonationMonth = dao.getCountDonationMonth(select_year, select_month);
		if(getCountDonationMonth == null) {
			getCountDonationMonth = "0";
		}
		map.put("getCountDonationMonth", getCountDonationMonth);
		
		String getCountPlasticMonth = dao.getCountPlasticMonth(select_year, select_month);
		if(getCountPlasticMonth == null) {
			getCountPlasticMonth = "0";
		}
		map.put("getCountPlasticMonth", getCountPlasticMonth);
		
		String getCountOceanMonth = dao.getCountOceanMonth(select_year, select_month);
		if(getCountOceanMonth == null) {
			getCountOceanMonth = "0";
		}
		map.put("getCountOceanMonth", getCountOceanMonth);
		
		String getCountIceMonth = dao.getCountIceMonth(select_year, select_month);
		if(getCountIceMonth == null) {
			getCountIceMonth = "0";
		}
		map.put("getCountIceMonth", getCountIceMonth);
		
		String getCountForestMonth = dao.getCountForestMonth(select_year, select_month);
		if(getCountForestMonth == null) {
			getCountForestMonth = "0";
		}
		map.put("getCountForestMonth", getCountForestMonth);
		
		
		return map;
		
	}
}