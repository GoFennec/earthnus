package kr.co.earthnus.user.camBoard;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class CamBoardService {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void getBoardList(String search, String search_type, String search_user, String arr, String orderBy, String order, 
			String contentnum, String pagenum, Model model) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		ConvertEntoKo cek = new ConvertEntoKo();
		int camBoardListCount = 0;
		
		PagingBean pBean = new PagingBean();
		List<camBoardBean> CamBoardList = null;
		List<camBoardBean> tempList = new ArrayList<camBoardBean>();
		
		if(search.equals("ocean")) {
			search = "해양";
		}else if(search.equals("plastic")) {
			search = "플라스틱";
		}else if(search.equals("forest")) {
			search = "산림";
		}else if(search.equals("ice")) {
			search = "극지방";
		}else if(search.equals("all")) {
			search = "기타";
		}
		
		if(search != null) {
			search = "%" + search + "%";
		}else if(search == null || search.equals("")) {
			search = "%%";
		}
		
        int cPagenum = Integer.parseInt(pagenum);
        int cContentnum = Integer.parseInt(contentnum);
        
        pBean.setCurrentPage(cPagenum);
        pBean.setSearch_type(search_type);
        pBean.setSearch(search);
        pBean.setArr(arr);
        pBean.setOrderBy(orderBy);
        pBean.setOrder(order);
        pBean.setTotalcount(CamBoardDAO.getBoardListCount(pBean));
        pBean.setPagenum(cPagenum-1);
        pBean.setContentnum(cContentnum);
        pBean.setCurrentblock(cPagenum);
        pBean.setLastblock(pBean.getTotalcount());

        pBean.prevnext(cPagenum);
        pBean.setStartPage(pBean.getCurrentblock());
        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
        
        if(cContentnum == 6){
        	pBean.setPagenum(pBean.getPagenum()*6);
        	CamBoardList = CamBoardDAO.getBoardList(pBean);
        	camBoardListCount = CamBoardList.size();
        }
        
        pBean.setTotalcount(CamBoardDAO.getBoardListCount(pBean));
        pBean.setSearch(search.substring(1, search.length()-1));
        
        pBean.setSearch_user(search_user);
        
        // 검색어 영한 보정
        String search_test = search.replace("%", "");
        int ascii = 0;
        int asciiAVG = 0;
        int EnKoCheck = 0;
        
		for(int i = 0; i < search_test.length(); i++) {
			char myChar = search_test.charAt(i);
			asciiAVG += myChar;
			ascii = myChar;
			if((ascii >= 12592 && ascii <= 12687) || (ascii >= 44032 && ascii <= 55203)) {
				EnKoCheck++;
			}else if((ascii >= 65 && ascii <= 90) || (ascii >= 97 && ascii <= 122)) {
				EnKoCheck--;
			}
		}// 한글 아스키 코드 범위 < 44032 ~ 55203 >  단자음, 단모음 아스키코드 범위 < 12592 ~ 12687 >  영어 아스키 코드 범위 (대문자) < 65 ~ 90 > (소문자) < 97 ~ 122 > 
		
		// 보정된 검색어 추천
		if(search_test.length() != 0) {
			if(Math.abs(EnKoCheck) == search_test.length()) {
				if(EnKoCheck > 0) {
				}else if(EnKoCheck < 0) {
					if(CamBoardList.isEmpty()) {
						String transSearch = cek.engToKor(search);
						
						pBean.setSearch(transSearch);
						CamBoardList = CamBoardDAO.getBoardList(pBean);
						
						if(!CamBoardList.isEmpty()) {
							model.addAttribute("RecommandWord", transSearch.replace("%", ""));
						}
					}
				}
			}
		}
		
		// 검색어 빈도수 체크  && 검색대상 다듬기 && 검색결과 우선순위 정하기
		String searchReplace = search.replace("%", "");
		
		if(!searchReplace.equals("")) {
			SearchCorrelation sc = new SearchCorrelation();
			CamBoardList = sc.searchResult(searchReplace, CamBoardList, pBean);
			System.out.println("검색어 : " + searchReplace + ", 검색어 길이 : " + searchReplace.length());
			
		}else if(searchReplace.equals("")) {
			int printCount = 0;
			int printIndex = (pBean.getCurrentPage()-1) * 6 + 1;
			
			if((CamBoardList.size() - (pBean.getCurrentPage()-1) * 6) > 6) {
				printCount = 6;
			}else if((CamBoardList.size() - (pBean.getCurrentPage()-1) * 6) <= 6 && (CamBoardList.size() - (pBean.getCurrentPage()-1) * 6) > 0){
				printCount = (CamBoardList.size() - (pBean.getCurrentPage()-1) * 6);
			}
			
			for(int i = 0; i < printCount; i++) {
				tempList.add(CamBoardList.get(printIndex - 1 + i));
			}
			CamBoardList = tempList;
		}
		
		System.out.println("CamBoardList길이 : " + CamBoardList.size());
		
		if(CamBoardList.isEmpty()) {
			List<String> searchList = new ArrayList<String>();
			
			pBean.setSearch("%%");
			pBean.setContentnum(-1);
			search = search.replace("%", "");
			int test = 0;
			int word_length = 0;
			
			for(int i = 0; i < searchList.size(); i++) {
				int test1 = 0;
				test1 = getDistance(search, searchList.get(i));
				if(test == 0) {
					test = test1;
				} else if(test == test1 || test <= test1) {
					if(search.length() == searchList.get(i).length()) {
						word_length++;
						search = searchList.get(i);
					}else if(search.length() != searchList.get(i).length() && word_length == 0) {
						search = searchList.get(i);
					}
				}
			}
			if(!searchList.isEmpty() || searchList.size() > camBoardListCount) {
				model.addAttribute("RecommandWord", search);
			}
		}
		model.addAttribute("CamBoardList", CamBoardList);
        model.addAttribute("page", pBean);
	}
	
	public List<camBoardBean> getList(String search, String search_type, String arr, String orderBy, String order, 
			String contentnum, String pagenum, List<camBoardBean> CamBoardList, Model model) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		PagingBean pBean = new PagingBean();
		
        int cPagenum = Integer.parseInt(pagenum);
        int cContentnum = Integer.parseInt(contentnum);
        
        pBean.setCurrentPage(cPagenum);
        pBean.setSearch_type(search_type);
        pBean.setSearch(search);
        pBean.setArr(arr);
        pBean.setOrderBy(orderBy);
        pBean.setOrder(order);
        pBean.setTotalcount(CamBoardDAO.getBoardListCount(pBean));
        pBean.setPagenum(cPagenum-1);
        pBean.setContentnum(cContentnum);
        pBean.setCurrentblock(cPagenum);
        pBean.setLastblock(pBean.getTotalcount());

        pBean.prevnext(cPagenum);
        pBean.setStartPage(pBean.getCurrentblock());
        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
        
        if(cContentnum == 6){
        	pBean.setPagenum(pBean.getPagenum()*6);
        	
        	CamBoardList = CamBoardDAO.getBoardList(pBean);
        }
        
        pBean.setTotalcount(CamBoardDAO.getBoardListCount(pBean));
        
        pBean.setSearch(search.substring(1, search.length()-1));
        
        return CamBoardList;
	}
	
	public List<PagingBean> getPage(String search, String search_type, String arr, String orderBy, String order, 
			String contentnum, String pagenum, List<PagingBean> PageList, Model model) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		PagingBean pBean = new PagingBean();
		
        int cPagenum = Integer.parseInt(pagenum);
        int cContentnum = Integer.parseInt(contentnum);
        
        pBean.setCurrentPage(cPagenum);
        pBean.setSearch_type(search_type);
        pBean.setSearch(search);
        pBean.setArr(arr);
        pBean.setOrderBy(orderBy);
        pBean.setOrder(order);
        pBean.setTotalcount(CamBoardDAO.getBoardListCount(pBean));
        pBean.setPagenum(cPagenum-1);
        pBean.setContentnum(cContentnum);
        pBean.setCurrentblock(cPagenum);
        pBean.setLastblock(pBean.getTotalcount());

        pBean.prevnext(cPagenum);
        pBean.setStartPage(pBean.getCurrentblock());
        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
        
        pBean.setTotalcount(CamBoardDAO.getBoardListCount(pBean));
        
        pBean.setSearch(search.substring(1, search.length()-1));
        PageList.add(0, pBean);
        
        return PageList;
	}
	
	public camBoardBean getCamBoard(int cambnum, String cambname) {
		CamBoardMybatis camBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		return camBoardDAO.getCamBoard(cambname);
	}
	
	public Map<String, Object> getBoardIndex(String search, String search_type, String arr, String orderBy, String order, 
			int CAMB_NUM, int limit, int offset, List<camBoardBean> CamBoardList, Map<String, Object> list, Model model) {
		CamBoardMybatis camBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		PagingBean pBean = new PagingBean();
        pBean.setSearch_type(search_type);
        pBean.setSearch(search);
        pBean.setArr(arr);
        pBean.setOrderBy(orderBy);
        pBean.setOrder(order);
        pBean.setTotalcount(camBoardDAO.getBoardListCount(pBean));
        pBean.setLimit(1);
        
        pBean.setCAMB_NUM(-1);
        int total = camBoardDAO.getBoardIndex(pBean);
        list.put("totalIndex", total);
        if(CAMB_NUM == total) {
        	pBean.setOffset(CAMB_NUM - 2);
            list.put("preBoard", camBoardDAO.getOtherBoard(pBean));
        }else if(CAMB_NUM == 1) {
        	pBean.setOffset(CAMB_NUM);
            list.put("nextBoard", camBoardDAO.getOtherBoard(pBean));
        }else if(CAMB_NUM < total && CAMB_NUM > 1){
        	pBean.setOffset(CAMB_NUM);
            list.put("nextBoard", camBoardDAO.getOtherBoard(pBean));
            pBean.setOffset(CAMB_NUM - 2);
            list.put("preBoard", camBoardDAO.getOtherBoard(pBean));
        }
		return list;
	}
	
	// 검색어 유사도 체크
	private int getDistance(String s1, String s2) {
		  int longStrLen = s1.length() + 1;
		  int shortStrLen = s2.length() + 1;
		  int[] cost = new int[longStrLen];
		  int[] newcost = new int[longStrLen];
		  for (int i = 0; i < longStrLen; i++) { cost[i] = i; }
		  for (int j = 1; j < shortStrLen; j++) {
			  
		    newcost[0] = j;
		    for (int i = 1; i < longStrLen; i++) {
		    	
		      int match = 0;
		      if (s1.charAt(i - 1) != s2.charAt(j - 1)) { match = 1; }

		      int replace = cost[i - 1] + match;
		      int insert = cost[i] + 1;
		      int delete = newcost[i - 1] + 1;

		      newcost[i] = Math.min(Math.min(insert, delete), replace);
		    }
		    int[] temp = cost; 
		    cost = newcost; 
		    newcost = temp;
		  }
		  
		  return cost[longStrLen - 1];
		}
	
	
	
}