package kr.co.earthnus.user.camBoard;

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

	public void getBoardList(String search, String search_type, String arr, String orderBy, String order, 
			String contentnum, String pagenum, Model model) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		
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
        	System.out.println("서비스가 받아오는 데이터 =======> search  : " + pBean.getSearch() + ", search_type : " + pBean.getSearch_type() + ", arr : " + pBean.getArr() + 
    				", orderBy : " + pBean.getOrderBy() + ", contentnum : " + pBean.getContentnum() + ", pagenum : " + pBean.getPagenum());
        	CamBoardList = CamBoardDAO.getBoardList(pBean);
        }
        
        for(int i = 0; i < CamBoardList.size(); i++) {
        	System.out.println((i + 1) + "번째 캠페인 번호 : " + CamBoardList.get(i).getCAMB_NUM() + ", 캠페인 이름 : " + CamBoardList.get(i).getCAMB_NAME());
        }
        
        pBean.setTotalcount(CamBoardDAO.getBoardListCount(pBean));
        pBean.setSearch(search.substring(1, search.length()-1));

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
	
	public camBoardBean getCamBoard(int contentnum) {
		CamBoardMybatis camBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		return camBoardDAO.getCamBoard(contentnum);
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
        pBean.setLimit(limit);
        pBean.setOffset(offset);
        
        System.out.println("limit : " + limit + ", offset : " + offset);
        
        pBean.setCAMB_NUM(-1);
        int total = camBoardDAO.getBoardIndex(pBean);
        list.put("totalIndex", total);
        
        CamBoardList = camBoardDAO.getOtherBoard(pBean);
        System.out.println("total : " + total + ", 순서 : " + camBoardDAO.getBoardIndex(pBean));
        System.out.println("CamBoardList 결과 : " + CamBoardList.size());
        
        if(CAMB_NUM == total) {
        	System.out.println("마지막 켐페인 정보 : " + CamBoardList.get(0).getCAMB_NAME());
            list.put("preBoard", CamBoardList.get(0));
        }else if(CAMB_NUM == 1) {
        	System.out.println("처음 캠페인 정보 : " + CamBoardList.get(1).getCAMB_NAME());
            list.put("nextBoard", CamBoardList.get(1));
        }else if(CAMB_NUM < total && CAMB_NUM > 1){
        	System.out.println(CamBoardList.get(0).getCAMB_NAME() + " + " + CamBoardList.get(2).getCAMB_NAME() );
            list.put("nextBoard", CamBoardList.get(2));
            list.put("preBoard", CamBoardList.get(0));
        }
        
		return list;
	}
	/*public MemberBean getMember(MemberBean mBean) {
		return CamBoardDAO.getMember(mBean);
	}*/
}