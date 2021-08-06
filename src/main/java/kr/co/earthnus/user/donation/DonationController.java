package kr.co.earthnus.user.donation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DonationController {
	
	@Autowired
	private DonationService donationService;
	
	@RequestMapping("/donation/list")
	public String getDonationList() {
		return "donation/donationList";
	}
	
	@RequestMapping("/donation/ocean")
	public String getOcean(DonationBean bean, Model model) {
		model.addAttribute("ocean", donationService.getOcean(bean));
		return "donation/donationOcean";
	}
	
	@RequestMapping("/donation/forest")
	public String getForest(DonationBean bean, Model model) {
		model.addAttribute("forest", donationService.getForest(bean));
		return "donation/donationForest";
	}
	
	@RequestMapping("/donation/plastic")
	public String getPlastic(DonationBean bean, Model model) {
		model.addAttribute("plastic", donationService.getPlastic(bean));
		return "donation/donationPlastic";
	}
	
	@RequestMapping("/donation/ice")
	public String getIce(DonationBean bean, Model model) {
		model.addAttribute("ice", donationService.getIce(bean));
		return "donation/donationIce";
	}
}