package kr.co.earthnus.user.member;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.earthnus.user.cheBoard.CheBoardBean;
import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.user.member.PagingBean;
import kr.co.earthnus.user.pay.PayBean;
import kr.co.earthnus.util.SHA256;

@Service
public class MemberService {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int insertMember(MemberBean memberBean) throws NoSuchAlgorithmException {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		SHA256 sha256 = new SHA256();

		// 비밀번호
		String password = memberBean.getMem_pw();
		// SHA256으로 암호화된 비밀번호
		String cryptogram = sha256.encrypt(password);


		memberBean.setMem_pw(cryptogram);

		// 비밀번호 일치 여부
		int n = dao.insertMember(memberBean);
		return n;
	}

	// 카카오 회원가입
	public int insertMember_kakao(MemberBean memberBean) throws NoSuchAlgorithmException {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int n = dao.insertMember_kakao(memberBean);
		return n;
	}

	// 네이버 회원가입
	public int insertMember_naver(MemberBean memberBean) throws NoSuchAlgorithmException {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int n = dao.insertMember_naver(memberBean);
		return n;
	}

	// 마이페이지 포인트조회
	public String myPoint(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String myPoint = dao.myPoint(mem_id);
		if (myPoint == null) {
			myPoint = "0";
		}
		return myPoint;
	}

	// 마이페이지 총기부금액
	public String myDonation(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String myDonation = dao.myDonation(mem_id);
		if (myDonation == null) {
			myDonation = "0";
		}
		return myDonation;
	}

	// 나무
	public String myDonation_f(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String myDonation_f = dao.myDonation_f(mem_id);
		if (myDonation_f == null) {
			myDonation_f = "0";
		}
		return myDonation_f;
	}

	// 해양
	public String myDonation_o(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String myDonation_o = dao.myDonation_o(mem_id);
		if (myDonation_o == null) {
			myDonation_o = "0";
		}
		return myDonation_o;
	}

	// 북극
	public String myDonation_i(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String myDonation_i = dao.myDonation_i(mem_id);
		if (myDonation_i == null) {
			myDonation_i = "0";
		}
		return myDonation_i;
	}

	// 플라스틱
	public String myDonation_p(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String myDonation_p = dao.myDonation_p(mem_id);
		if (myDonation_p == null) {
			myDonation_p = "0";
		}
		return myDonation_p;
	}
	//기부내역
		public void myPay(String mem_id, String pagenum, String contentnum, Model model) {
			MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
			PagingBean pBean = new PagingBean();
		
			  	int cPagenum = Integer.parseInt(pagenum);
		        int cContentnum = Integer.parseInt(contentnum);
		        List<PayBean> list = null;
		        pBean.setTotalcount(dao.myPayCount(mem_id));
		        pBean.setPagenum(cPagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
		        pBean.setContentnum(cContentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
		        pBean.setCurrentblock(cPagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
		        pBean.setLastblock(pBean.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

		        pBean.prevnext(cPagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
		        pBean.setStartPage(pBean.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
		        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
		        //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
			
		        if(cContentnum == 5){//선택 게시글 수
		        	pBean.setPagenum(pBean.getPagenum()*5);
		        	list = dao.myPay(mem_id, pBean.getContentnum(), pBean.getPagenum());
		        }
		        model.addAttribute("myPay", list);
				model.addAttribute("page", pBean);
		       
			}
			
		
	// 비밀번호체크
	public String pwCheck(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String mem_pw = dao.pwCheck(mem_id);
		return mem_pw;
	}

	// 내정보
	public MemberBean myInfo(String mem_id) {
		System.out.println("S : myInfo()실행");
		MemberBean memberBean = null;
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		memberBean = dao.myInfo(mem_id);
		return memberBean;
	}

	// 내정보수정
	public void updateMyInfo(MemberBean memberBean) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		dao.updateMyInfo(memberBean);
	}

	
	
	// 비번수정
	public void updatePw(Map<String, Object> map) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		dao.updatePw(map);
	}

	// 이메일 변경
	public void updateEmail(Map<String, Object> map) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		dao.updateEmail(map);
	}

	
	// 마이메세지
		public void myMessage(String mem_id, String pagenum, String contentnum, Model model) {
			MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
			PagingBean pBean = new PagingBean();

	        int cPagenum = Integer.parseInt(pagenum);
	        int cContentnum = Integer.parseInt(contentnum);
	        List<CheBoardBean> list = null;
	        pBean.setTotalcount(dao.myMessageCount(mem_id));
	        pBean.setPagenum(cPagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
	        pBean.setContentnum(cContentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
	        pBean.setCurrentblock(cPagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
	        pBean.setLastblock(pBean.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

	        pBean.prevnext(cPagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
	        pBean.setStartPage(pBean.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
	        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
	        //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
		
	        if(cContentnum == 10){//선택 게시글 수
	        	pBean.setPagenum(pBean.getPagenum()*10);
//	        	list = dao.myMessage(mem_id, pBean);
	        	list = dao.myMessage(mem_id, pBean.getContentnum(), pBean.getPagenum());
	        }
	        model.addAttribute("myMessage", list);
			model.addAttribute("page", pBean);
	       
		}
		

	
		public void myOrder(String mem_id, String pagenum, String contentnum, Model model) {
			MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
			PagingBean pBean = new PagingBean();
			
	        int cPagenum = Integer.parseInt(pagenum);
	        int cContentnum = Integer.parseInt(contentnum);
	        List<ExGoodsBean> list = null;
	        pBean.setTotalcount(dao.myOrderCount(mem_id));
	        pBean.setPagenum(cPagenum-1);   
	        pBean.setContentnum(cContentnum);
	        pBean.setCurrentblock(cPagenum); 
	        pBean.setLastblock(pBean.getTotalcount()); 

	        pBean.prevnext(cPagenum);
	        pBean.setStartPage(pBean.getCurrentblock());
	        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
	        
	        
	        if(cContentnum == 10){
	        	pBean.setPagenum(pBean.getPagenum()*10);
	        	list = dao.myOrder(mem_id, pBean.getContentnum(), pBean.getPagenum());
	        	for(int i = 0; i < list.size(); i++) {
					String cc = list.get(i).getExg_cc();
					switch (cc) {
						case "CJ대한통운":		list.get(i).setExg_cc("04"); break;
						case "롯데택배":		list.get(i).setExg_cc("08"); break;
						case "우체국택배":		list.get(i).setExg_cc("01"); break;
						case "로젠택배":		list.get(i).setExg_cc("06"); break;
						case "한진택배":		list.get(i).setExg_cc("05"); break;
						case "CU편의점택배":	list.get(i).setExg_cc("46"); break;
						case "EMS택배":		list.get(i).setExg_cc("12"); break;
						case "경동택배":		list.get(i).setExg_cc("23"); break;
						case "대신택배":		list.get(i).setExg_cc("22"); break;
						case "DHL택배":		list.get(i).setExg_cc("13"); break;
						case "FedEx":		list.get(i).setExg_cc("21"); break;
					}
				}
	        	
	        }
	        model.addAttribute("myOrder", list);
			model.addAttribute("page", pBean);
			
		}
	
	
	
	
	
	
	
	
	// 회원탈퇴
	public void deleteMember(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		dao.deleteMember(mem_id);

	}

	// 아이디 중복체크
	public int idCheck(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int n = dao.idCheck(mem_id);
		System.out.println(n);
		return n;
	}

}