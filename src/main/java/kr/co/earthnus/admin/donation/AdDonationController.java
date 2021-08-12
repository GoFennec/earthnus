package kr.co.earthnus.admin.donation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.earthnus.user.pay.PayBean;

@Controller
public class AdDonationController {
	
	@Autowired
	private AdDonationService adDonationService;
	
	@
	RequestMapping("/adDonation/list")
	public String getAdDonationList(@RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "3") String contentnum, PayBean Bean, Model model) {
		adDonationService.getAdDonationList(Bean, pagenum, contentnum, model);
		return "donation/adDonationList";
	}
}
