package kr.co.earthnus.admin.chart;

import java.util.List;

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
		
		List<Integer> countVisitor = service.countVisitor();
		model.addAttribute("countVisitor", countVisitor);
		
		return "auth/adChart";
	}
	
	
	
	

}