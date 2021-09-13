package kr.co.earthnus.admin.chart;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdChartController {
	
	@Autowired
	private AdChartService service;
	
	@RequestMapping(value = "/adChart", method = RequestMethod.GET)
	public String chart(Model model) {

		
		service.donationPie(model);
		service.camPie(model);
		service.chePie(model);
		
		return "auth/adChart";
	}
	
	
	@RequestMapping(value = "/adchart/getMonthData", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getMonthData(@RequestParam("select_year") String select_year, @RequestParam("select_month") String select_month, HttpServletRequest request){
		
		Calendar cal = Calendar.getInstance();
		int pselect_year = Integer.parseInt(select_year);
		int pselect_month = Integer.parseInt(select_month);
		cal.set(pselect_year,pselect_month-1 ,1);
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		Map<String, Object> map = new HashMap<String, Object>();

		Map<String, Object> map1 = service.getMonthData(select_year, select_month, lastDay);
		map.put("error", map1);
		
		return map;
	}
	
	@RequestMapping(value = "/adchart/getSevenData", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getSevenData(@RequestParam("select_year") String select_year, @RequestParam("select_month") String select_month, @RequestParam("select_date") String select_date, HttpServletRequest request){
		
		Map<String, Object> map = new HashMap<String, Object>();

		Map<String, Object> map1 = service.getSevenData(select_year, select_month, select_date);
		map.put("error", map1);
		
		return map;
	}
	
	
	
	

}