package kr.co.earthnus.admin.chart;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdChartService {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int selectPlastic() {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int selectPlastic = dao.selectPlastic();
		return selectPlastic;
	}
	public int selectOcean() {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int selectOcean = dao.selectOcean();
		return selectOcean;
	}
	public int selectIce() {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int selectIce = dao.selectIce();
		return selectIce;
	}
	public int selectForest() {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int selectForest = dao.selectForest();
		return selectForest;
	}
	
	public List<Integer> countVisitor() {
		AdChartMybatis dao = mybatis.getMapper(AdChartMybatis.class);
		int count = 0;
		List<Integer> count1 = new ArrayList<Integer>();
		
		for(int i = 0; i < 7; i++) {
			count = dao.countVisitor(i);
			System.out.println(count);
			count1.add(count);
		}
		return count1;
	}

}