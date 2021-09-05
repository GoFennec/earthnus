package kr.co.earthnus.user.camBoard;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
		CamBoardStatBean csBean = new CamBoardStatBean();
		PagingBean pBean = new PagingBean();
		List<camBoardBean> CamBoardList = null;
		List<CamBoardStatBean> statList = null;
		
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
        	statList = CamBoardDAO.getStatList(pBean);
        }
        
        pBean.setTotalcount(CamBoardDAO.getBoardListCount(pBean));
        
        pBean.setSearch(search.substring(1, search.length()-1));

        camBoardBean cBean = new camBoardBean();
        
        DateFormat format = new SimpleDateFormat("MM월 dd일");
        
        for(int i = 1; i <= CamBoardList.size(); i++) {
        	cBean = CamBoardList.get(i-1);
        	
        	String startdate = format.format(cBean.getCAMB_STARTDATE());
        	String findate = format.format(cBean.getCAMB_FINDATE());

        	csBean = statList.get(i-1);
        	int ABLEDATE = 472 - 472*csBean.getCAMB_ABLEDATE()/100;
        	int cBean_ABLEDATE = cBean.getCAMB_ABLEDATE();
        	if(csBean.getCAMB_ABLEDATE() >= 100) {
        		ABLEDATE = 472;
        	}else if(csBean.getCAMB_ABLEDATE() < 0) {
        		ABLEDATE = 0;
        	}
        	
        	model.addAttribute("CAMB_ABLEDATE" + i, ABLEDATE);
        	model.addAttribute("CAMB_STARTDATE" + i, startdate);
        	model.addAttribute("CAMB_FINDATE" + i, findate);
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
	
	public camBoardBean getCamBoard(String contentnum) {
		CamBoardMybatis camBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		return camBoardDAO.getCamBoard(Integer.parseInt(contentnum));
	}
	
	public Map<String, Object> getBoardIndex(String search, String search_type, String arr, String orderBy, String order, 
			int CAMB_NUM, Map<String, Object> list, Model model) {
		CamBoardMybatis camBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		PagingBean pBean = new PagingBean();
		
        pBean.setSearch_type(search_type);
        pBean.setSearch(search);
        pBean.setArr(arr);
        pBean.setOrderBy(orderBy);
        pBean.setOrder(order);
        pBean.setTotalcount(camBoardDAO.getBoardListCount(pBean));
        
        pBean.setCAMB_NUM(-1);
        int total = camBoardDAO.getBoardIndex(pBean);
        list.put("totalIndex", total);
        pBean.setCAMB_NUM(CAMB_NUM);
        list.put("index", camBoardDAO.getBoardIndex(pBean));
        
        if(camBoardDAO.getBoardIndex(pBean) == total) {
            pBean.setCAMB_INDEX(camBoardDAO.getBoardIndex(pBean)-2);
            list.put("preBoard", camBoardDAO.preBoard(pBean));
        }else if(camBoardDAO.getBoardIndex(pBean) == 1) {
        	pBean.setCAMB_INDEX(camBoardDAO.getBoardIndex(pBean));
            list.put("nextBoard", camBoardDAO.nextBoard(pBean));
        }else if(camBoardDAO.getBoardIndex(pBean) < total && camBoardDAO.getBoardIndex(pBean) > 1){
        	pBean.setCAMB_INDEX(camBoardDAO.getBoardIndex(pBean));
            list.put("nextBoard", camBoardDAO.nextBoard(pBean));
            pBean.setCAMB_INDEX(camBoardDAO.getBoardIndex(pBean)-2);
            list.put("preBoard", camBoardDAO.preBoard(pBean));
        }
        
		return list;
	}
	/*public MemberBean getMember(MemberBean mBean) {
		return CamBoardDAO.getMember(mBean);
	}*/
}