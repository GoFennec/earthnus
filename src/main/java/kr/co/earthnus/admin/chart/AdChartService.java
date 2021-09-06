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
	
	public void chePie(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int chePiePlastic = dao.chePiePlastic();
		int chePieOcean = dao.chePieOcean();
		int chePieIce = dao.chePieIce();
		int chePieForest = dao.chePieForest();
		
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
			count = dao.countVisitor(i);
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
			count = dao.sumPlastic(i);
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
			count = dao.sumOcean(i);
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
			count = dao.sumIce(i);
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
			count = dao.sumForest(i);
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
			count = dao.countMember(i);
			count1.add(count);
		}
		model.addAttribute("countMember", count1);
	}
	
	public void countExgoods(Model model) {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int count = 0;
		List<Integer> count1 = new ArrayList<Integer>();
		
		for(int i = 0; i < 7; i++) {
			count = dao.countExgoods(i);
			count1.add(count);
		}
		model.addAttribute("countExgoods", count1);
	}

}