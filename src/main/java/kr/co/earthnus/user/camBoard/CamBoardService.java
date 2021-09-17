package kr.co.earthnus.user.camBoard;

import java.util.ArrayList;
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
		
		PagingBean pBean = new PagingBean();
		List<camBoardBean> CamBoardList = null;
		
		
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
        }
        
        pBean.setTotalcount(CamBoardDAO.getBoardListCount(pBean));
        pBean.setSearch(search.substring(1, search.length()-1));
        
        model.addAttribute("CamBoardList", CamBoardList);
        pBean.setSearch_user(search_user);
        
        if(search_user != null && !search_user.equals("") && !CamBoardList.isEmpty()) {
        	CamBoardDAO.searchInsert(pBean);
        }
        
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
		}// 한글 아스키 코드 범위 < 44032 ~ 55203 > 단자음, 단모음 아스키코드 범위 < 12592 ~ 12687 >  ||||| 영어 아스키 코드 범위 (대문자) < 65 ~ 90 > < 97 ~ 122 > 
		
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
						//System.out.println(search.replace("%", "") + " ========> " + transSearch.replace("%", ""));
					}
				}
			}else {
				
			}
		}
		
		if(search_user != null && CamBoardList.isEmpty()) {
			List<String> searchList = new ArrayList<String>();
			
			searchList = CamBoardDAO.searchWord(pBean);
			
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
			
			model.addAttribute("RecommandWord", search);
			
		}
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
		camBoardBean cBean = new camBoardBean();
		cBean.setCAMB_NUM(cambnum);
		
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
	/*public MemberBean getMember(MemberBean mBean) {
		return CamBoardDAO.getMember(mBean);
	}*/
	
	private int getDistance(String s1, String s2) {
		  int longStrLen = s1.length() + 1;
		  int shortStrLen = s2.length() + 1; // 긴 단어 만큼 크기가 나올 것이므로, 가장 긴단어 에 맞춰 Cost를 계산
		  int[] cost = new int[longStrLen];
		  int[] newcost = new int[longStrLen]; // 초기 비용을 가장 긴 배열에 맞춰서 초기화 시킨다.
		  for (int i = 0; i < longStrLen; i++) { cost[i] = i; } // 짧은 배열을 한바퀴 돈다.
		  for (int j = 1; j < shortStrLen; j++) {
		    // 초기 Cost는 1, 2, 3, 4...
		    newcost[0] = j; // 긴 배열을 한바퀴 돈다.
		    for (int i = 1; i < longStrLen; i++) {
		      // 원소가 같으면 0, 아니면 1
		      int match = 0;
		      if (s1.charAt(i - 1) != s2.charAt(j - 1)) { match = 1; }
		      // 대체, 삽입, 삭제의 비용을 계산한다.
		      int replace = cost[i - 1] + match;
		      int insert = cost[i] + 1;
		      int delete = newcost[i - 1] + 1;
		      // 가장 작은 값을 비용에 넣는다.
		      newcost[i] = Math.min(Math.min(insert, delete), replace);
		    } // 기존 코스트 & 새 코스트 스위칭 
		    int[] temp = cost; 
		    cost = newcost; 
		    newcost = temp;
		  }
		  // 가장 마지막값 리턴
		  return cost[longStrLen - 1];
		}
}