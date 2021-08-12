package kr.co.earthnus.user.pay;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import kr.co.earthnus.user.auth.AuthBean;

@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	private IamportClient api;

	public PayController() {
		this.api = new IamportClient("5293829777576283","lUt0GqQfFNCw3BhPmSyY7qhvfYvRUiyfd2fUs6a7TMDXnUMKNlIULZq1XWTSfs7sumnWtx4mjHjGC6qq");
	}
	
	@RequestMapping("/pay/pay")
	public String getPayPage(@ModelAttribute PayBean pBean, HttpSession session, Model model) {
		model.addAttribute("pay", pBean);
		AuthBean auth = (AuthBean)session.getAttribute("auth");
		if (auth != null) {
			model.addAttribute("member", payService.getMemberInfo(auth));
		}	
		return "pay/pay";
	}
	
	@ResponseBody
	@RequestMapping("/payments/complete/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(@RequestBody PayBean pBean, Model model, Locale locale, HttpSession session,
			@PathVariable(value="imp_uid") String imp_uid) throws IamportResponseException, IOException {
		int n = payService.insertPay(pBean);
		int m = payService.updatePoint(pBean);
		return api.paymentByImpUid(imp_uid);
	}

	@RequestMapping("/pay/payOk/{var}")
	public String getPayInfo(@PathVariable("var") String var, Model model) {
		model.addAttribute("pay", payService.getPayInfo(var));
		return "pay/payOk";
	}
}
