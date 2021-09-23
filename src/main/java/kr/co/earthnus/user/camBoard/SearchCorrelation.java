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
		ArrayList<Double> orderList = new ArrayList<Double>();				// 검색어 비율 담는 리스트
		HashMap<Double, Object> list = new HashMap<Double, Object>();		// 검색어 비율 <===> camboard데이터 매핑
		
		for(int i = 0; i < CamBoardList.size(); i++) {
			int count = containCount(CamBoardList.get(i).getCAMB_CONTENT().replace("</p>", ""), search); //search.replace("%", "")
			int testcount = 0;
			
			String[] testArr = ca.context(CamBoardList.get(i).getCAMB_CONTENT()).split(" ");
			
			for(String a:testArr) {
				testcount++;
			}
			Double rate = Double.valueOf(count) / Double.valueOf(testcount);
			
			// 초기 검색어 비율 기준 설정 및 갱신
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
		
		System.out.println("현재 페이지 : " + pBean.getCurrentPage() + ", 출력 게시글 개수 : " + printCount + ", 시작 인덱스 : " + printIndex);
		System.out.println("검색결과 개수 : " + orderList.size());
		
		orderList.sort(null);
		
		// 페이지에 연관성 높은 순서대로 게시글 저장
		for(int k = printCount - 1; k >= 0; k--) {
			tempList.add((camBoardBean)list.get(orderList.get(printIndex - 1 + k)));
			System.out.println(orderList.get(printIndex - 1 + k));
		}
		CamBoardList = tempList;
		
		return CamBoardList;
	}
	
	// 검색어 빈도수 체크
	public int containCount(String total_str, String str) {
		int str_count = 0;
		char searchFirstLetter = str.charAt(0);
		
		ArrayList a_list = new ArrayList();
			
		for(int i=0; i<total_str.length(); i++) {
			if(total_str.charAt(i) == searchFirstLetter) {
				a_list.add(i);
			}
		}
		
		//배열사이즈를 확인해 a문자 개수 만큼 다시 for 반복문을 수행하며 2자리씩 문자열을 잘라서 확인한다
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
