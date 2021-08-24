package kr.co.earthnus.admin.donation;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import kr.co.earthnus.admin.member.AdMemberService;
import kr.co.earthnus.user.pay.PayBean;

@Controller
public class AdDonationController {
	
	@Autowired
	private AdDonationService adDonationService;
	private IamportClient api;
	@Autowired
	private AdMemberService adMemberService;
	
	public AdDonationController() {
		this.api = new IamportClient("5293829777576283","lUt0GqQfFNCw3BhPmSyY7qhvfYvRUiyfd2fUs6a7TMDXnUMKNlIULZq1XWTSfs7sumnWtx4mjHjGC6qq");
	}
	
	@RequestMapping("/adDonation/list")
	public String getAdDonationList(Model model) {
		adDonationService.getAdDonationList(model);
		return "donation/adDonationList";
	}
	
	@RequestMapping("/adDonation/waiting")
	public String waiting(Model model) {
		adDonationService.waiting(model);
		return "donation/adDonationList";
	}
	
	@RequestMapping("/adDonation/canceled")
	public String cancel(Model model) {
		adDonationService.cancel(model);
		return "donation/adDonationList";
	}
	
	@ResponseBody
	@RequestMapping("/payments/cancel/{imp_uid}")
	public IamportResponse<Payment> cancelPaymentByImpUid(@RequestBody PayBean pBean, Model model, Locale locale, HttpSession session,
			@PathVariable(value="imp_uid") String imp_uid) throws IamportResponseException, IOException {
		
		adDonationService.updatePay(pBean);
		return api.cancelPaymentByImpUid(new CancelData(imp_uid, true));
	}
	
	@RequestMapping(value="/adDonation/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteGoods(@RequestParam("deletePW") String deletePW) throws NoSuchAlgorithmException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		int delete = adMemberService.deletePW(deletePW);
		
		if(delete > 0) {
			map.put("error", true);
		}else {
			map.put("error", false);
		}
		return map;
	}
	
	@RequestMapping("/adDonation/pointUpdate")
	public String updatePoint(@ModelAttribute PayBean pBean) {
		adDonationService.updatePoint(pBean);
		return "redirect:/adDonation/list";
	}
	
}
