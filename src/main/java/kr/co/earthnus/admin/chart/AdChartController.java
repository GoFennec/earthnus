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
		
		int selectPlastic = service.selectPlastic();
		model.addAttribute("selectPlastic", selectPlastic);
		
		int selectOcean = service.selectOcean();
		model.addAttribute("selectOcean", selectOcean);
		
		int selectIce = service.selectIce();
		model.addAttribute("selectIce", selectIce);
		
		int selectForest = service.selectForest();
		model.addAttribute("selectForest", selectForest);
		
		int[] countVisitor = service.countVisitor();
		for(int i = 0; i < countVisitor.length; i++) {
			System.out.println(countVisitor[i]);
		}
		model.addAttribute("countVisitor", countVisitor);
		
		return "auth/adChart";
	}
	
	
	
	

}
