package kr.co.earthnus.admin.chart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdChartController {
	
	@Autowired
	private AdChartService service;
	
	@RequestMapping(value = "/adChart", method = RequestMethod.GET)
	public String chart(Model model) {
		
		service.donationPie(model);
		service.camPie(model);
		service.chePie(model);
		
		service.countVisitor(model);
		service.sumPlastic(model);
		service.sumOcean(model);
		service.sumIce(model);
		service.sumForest(model);
		
		return "auth/adChart";
	}
	
	
//	@RequestMapping(value = "/adLineChart", method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String,String> adLineChart(){
//		
//	}
	
	
	
	

}