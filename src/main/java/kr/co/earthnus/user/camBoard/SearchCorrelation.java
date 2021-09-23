package kr.co.earthnus.user.camBoard;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class SearchCorrelation {
	public List<camBoardBean> searchResult(String search, List<camBoardBean> CamBoardList, PagingBean pBean){
		List<camBoardBean> tempList = new ArrayList<camBoardBean>();
		ContextArrange ca = new ContextArrange();
		Double rateOrigin = 0.0;
		ArrayList<Double> orderList = new ArrayList<Double>();				// �˻��� ���� ��� ����Ʈ
		HashMap<Double, Object> list = new HashMap<Double, Object>();		// �˻��� ���� <===> camboard������ ����
		
		for(int i = 0; i < CamBoardList.size(); i++) {
			int count = containCount(CamBoardList.get(i).getCAMB_CONTENT().replace("</p>", ""), search); //search.replace("%", "")
			int testcount = 0;
			
			String[] testArr = ca.context(CamBoardList.get(i).getCAMB_CONTENT()).split(" ");
			
			for(String a:testArr) {
				testcount++;
			}
			Double rate = Double.valueOf(count) / Double.valueOf(testcount);
			
			// �ʱ� �˻��� ���� ���� ���� �� ����
			if(rateOrigin == 0.0 || rateOrigin >= rate) {
				Date nowDate = new Date();
				Date startdate = CamBoardList.get(i).getCAMB_STARTDATE();
				Date findate = CamBoardList.get(i).getCAMB_FINDATE();
				
				if(startdate.before(nowDate) == true && findate.after(nowDate)) {
					rate += 1.0;
				}
				
				rateOrigin = rate;
				orderList.add(rate);
				list.put(rate, CamBoardList.get(i));
			}else {
				orderList.add(rate);
				list.put(rate, CamBoardList.get(i));
			}
			
		}
		
		int printCount = 0;
		if((orderList.size() - (pBean.getCurrentPage()-1) * 6) > 6) {
			printCount = 6;
		}else if((orderList.size() - (pBean.getCurrentPage()-1) * 6) <= 6 && (orderList.size() - (pBean.getCurrentPage()-1) * 6) > 0){
			printCount = (orderList.size() - (pBean.getCurrentPage()-1) * 6);
		}
		
		int printIndex = (pBean.getCurrentPage()-1) * 6 + 1;
		
		System.out.println("���� ������ : " + pBean.getCurrentPage() + ", ��� �Խñ� ���� : " + printCount + ", ���� �ε��� : " + printIndex);
		System.out.println("�˻���� ���� : " + orderList.size());
		
		orderList.sort(null);
		
		// �������� ������ ���� ������� �Խñ� ����
		for(int k = printCount - 1; k >= 0; k--) {
			tempList.add((camBoardBean)list.get(orderList.get(printIndex - 1 + k)));
			System.out.println(orderList.get(printIndex - 1 + k));
		}
		CamBoardList = tempList;
		
		return CamBoardList;
	}
	
	// �˻��� �󵵼� üũ
	public int containCount(String total_str, String str) {
		int str_count = 0;
		char searchFirstLetter = str.charAt(0);
		
		ArrayList a_list = new ArrayList();
			
		for(int i=0; i<total_str.length(); i++) {
			if(total_str.charAt(i) == searchFirstLetter) {
				a_list.add(i);
			}
		}
		
		//�迭����� Ȯ���� a���� ���� ��ŭ �ٽ� for �ݺ����� �����ϸ� 2�ڸ��� ���ڿ��� �߶� Ȯ���Ѵ�
		String pandan = "";
		for(int i=0; i<a_list.size(); i++) {
			int start_idx = Integer.valueOf(a_list.get(i).toString());
			pandan = total_str.substring(start_idx, start_idx+str.length());
			if(pandan.equals(str)) {
				str_count ++;
			}
		}
					
		return str_count;
	}
}
