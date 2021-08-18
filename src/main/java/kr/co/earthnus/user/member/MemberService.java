package kr.co.earthnus.user.member;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.earthnus.user.cheBoard.CheBoardBean;
import kr.co.earthnus.user.goods.ExGoodsBean;
import kr.co.earthnus.util.SHA256;

@Service
public class MemberService {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public int insertMember(MemberBean memberBean) throws NoSuchAlgorithmException {
		System.out.println("서비스");
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
        SHA256 sha256 = new SHA256();

        //비밀번호
        String password = memberBean.getMem_pw();
        //SHA256으로 암호화된 비밀번호
        String cryptogram = sha256.encrypt(password);

        System.out.println(cryptogram);

        memberBean.setMem_pw(cryptogram);

        //비밀번호 일치 여부
        System.out.println(cryptogram.equals(sha256.encrypt(password)));
		int n = dao.insertMember(memberBean);
		return n;
	}


	//카카오 회원가입
	public int insertMember_kakao(MemberBean memberBean) throws NoSuchAlgorithmException {
		System.out.println("kakao 서비스");
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
       
		int n = dao.insertMember_kakao(memberBean);
		return n;
	}
	
	
	//마이페이지 포인트조회
	public String myPoint(String mem_id) {
		System.out.println("S : myPoint()실행");
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String myPoint = dao.myPoint(mem_id);
		if(myPoint == null) {
			myPoint = "0";
		System.out.println("mypoint service");
		}return myPoint;
	}
	//마이페이지 총기부금액
	public String myDonation(String mem_id) {
		System.out.println("S : mydonation()실행");
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String myDonation = dao.myDonation(mem_id);
		System.out.println("donation service");
		if(myDonation == null) {
		myDonation = "0";
	}	return myDonation;
	}
	//나무
	public String myDonation_f(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String myDonation_f = dao.myDonation_f(mem_id);
		System.out.println("mydonation_f test" + myDonation_f);
		if(myDonation_f == null) {
			myDonation_f = "0";
	}	return myDonation_f;
	}
	
	//해양
		public String myDonation_o(String mem_id) {
			MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
			String myDonation_o = dao.myDonation_o(mem_id);
			if(myDonation_o == null) {
				myDonation_o = "0";
		}	return myDonation_o;
		}
		
	//북극
		public String myDonation_i(String mem_id) {
			MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
			String myDonation_i = dao.myDonation_i(mem_id);
			if(myDonation_i == null) {
				myDonation_i = "0";
		}	return myDonation_i;
		}
	//플라스틱
		public String myDonation_p(String mem_id) {
			MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
			String myDonation_p = dao.myDonation_p(mem_id);
			if(myDonation_p == null) {
				myDonation_p = "0";
		}	return myDonation_p;
		}
	
	
	
	
	
	
	
	//비밀번호체크
	public String pwCheck(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String mem_pw = dao.pwCheck(mem_id);
		return mem_pw;
	}
	//내정보
	public MemberBean myInfo(String mem_id) {
		System.out.println("S : myInfo()실행");
		MemberBean memberBean = null;
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		memberBean = dao.myInfo(mem_id);
		return memberBean;
	}
	//내정보수정
	public void updateMyInfo(MemberBean memberBean) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		dao.updateMyInfo(memberBean);
		System.out.println("update service");
	}
	
	//마이오더
	public List<ExGoodsBean> myOrder(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		List<ExGoodsBean> list = dao.myOrder(mem_id);
		return list;
	}
	
	//마이메세지
	public List<CheBoardBean> myMessage(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		List<CheBoardBean> list = dao.myMessage(mem_id);
		return list;
	}
	
	
	
	
	
	//회원탈퇴
	public void deleteMember(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		dao.deleteMember(mem_id);
		System.out.println("delete service");

	}



	// 아이디 중복체크
	public int idCheck(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int n = dao.idCheck(mem_id);
		return n;
	}



}