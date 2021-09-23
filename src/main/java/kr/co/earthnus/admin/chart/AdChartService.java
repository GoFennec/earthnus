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
	
	public Map<String, Object> getSevenData(String select_year, String select_month, String select_date) {
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
		
		int totalVisitor = 0;
		for(int i = 0; i < 7; i++) {
			int count = dao.getCountVisitor(i, select_year, select_month, select_date);
			count1.add(count);
			totalVisitor += count;
		}
		map.put("getVisitorSeven", count1);
		map.put("getCountVisitorSeven", totalVisitor);
		
		int totalPlatic = 0;
		for(int i = 0; i < 7; i++) {
			String count = dao.getSumPlastic(i, select_year, select_month, select_date);
			if(count == null) {
				count = "0";
			}
			int parse = Integer.parseInt(count);
			totalPlatic += parse;
			count2.add(parse);
		}
		map.put("sumPlastic", count2);
		map.put("getCountPlasticSeven", totalPlatic);
		
		int totalOcean = 0;
		for(int i = 0; i < 7; i++) {
			String count = dao.getSumOcean(i, select_year, select_month, select_date);
			if(count == null) {
				count = "0";
			}
			int parse = Integer.parseInt(count);
			totalOcean += parse;
			count3.add(parse);
		}
		map.put("sumOcean", count3);
		map.put("getCountOceanSeven", totalOcean);
		
		int totalIce = 0;
		for(int i = 0; i < 7; i++) {
			String count = dao.getSumIce(i, select_year, select_month, select_date);
			if(count == null) {
				count = "0";
			}
			int parse = Integer.parseInt(count);
			totalIce += parse;
			count4.add(parse);
		}
		map.put("sumIce", count4);
		map.put("getCountIceSeven", totalIce);
		
		int totalForest = 0;
		for(int i = 0; i < 7; i++) {
			String count = dao.getSumForest(i, select_year, select_month, select_date);
			if(count == null) {
				count = "0";
			}
			int parse = Integer.parseInt(count);
			totalForest += parse;
			count5.add(parse);
		}
		map.put("sumForest", count5);
		map.put("getCountForestSeven", totalForest);
		
		int totalMember = 0;
		for(int i = 0; i < 7; i++) {
			int count = dao.getCountMember(i, select_year, select_month, select_date);
			count6.add(count);
			totalMember += count;
		}
		map.put("getCountMember", count6);
		map.put("getCountMemberSeven", totalMember);
		
		int totalDelMember = 0;
		for(int i = 0; i < 7; i++) {
			int count = dao.getCountDelMember(i, select_year, select_month, select_date);
			count7.add(count);
			totalDelMember += count;
		}
		map.put("getCountDelMember", count7);
		map.put("getCountDelMemberSeven", totalDelMember);
		
		int totalExgoods = 0;
		for(int i = 0; i < 7; i++) {
			int count = dao.getCountExgoods(i, select_year, select_month, select_date);
			count8.add(count);
			totalExgoods += count;
		}
		map.put("getCountExgoods", count8);
		map.put("getCountExgoodsSeven", totalExgoods);
		
		return map;
		
	}
}