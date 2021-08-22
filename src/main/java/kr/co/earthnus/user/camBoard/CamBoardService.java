package kr.co.earthnus.user.camBoard;

import java.util.List;

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
        
        System.out.println("service pagenum : " + pBean.getPagenum());
        if(cContentnum == 6){
        	pBean.setPagenum(pBean.getPagenum()*6);
        	
        	CamBoardList = CamBoardDAO.getBoardList(pBean);
        }
        
        pBean.setTotalcount(CamBoardDAO.getBoardListCount(pBean));
        
        System.out.println("service pBean =======> search = " + pBean.getSearch() + ", contentnum = " + pBean.getContentnum() +
        		", pagenum = " + pBean.getPagenum() + ", totalcount = " + CamBoardDAO.getBoardListCount(pBean) + 
        		", CamBoardList ±æÀÌ = " + CamBoardList.size());
        
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
        
        System.out.println("service pBean =======> search = " + pBean.getSearch() + ", contentnum = " + pBean.getContentnum() +
        		", pagenum = " + pBean.getPagenum() + ", totalcount = " + CamBoardDAO.getBoardListCount(pBean) + 
        		", CamBoardList ±æÀÌ = " + CamBoardList.size());
        
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
        
        System.out.println("service pBean =======> search = " + pBean.getSearch() + ", contentnum = " + pBean.getContentnum() +
        		", pagenum = " + pBean.getPagenum() + ", totalcount = " + CamBoardDAO.getBoardListCount(pBean));
        System.out.println("service PageList : " + PageList.isEmpty());
        return PageList;
	}
	
	public camBoardBean getCamBoard(String contentnum) {
		CamBoardMybatis camBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		System.out.println("¼­ºñ½º : " + contentnum);
		return camBoardDAO.getCamBoard(Integer.parseInt(contentnum));
	}
	/*public MemberBean getMember(MemberBean mBean) {
		return CamBoardDAO.getMember(mBean);
	}*/
}
