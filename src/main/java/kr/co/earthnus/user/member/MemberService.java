package kr.co.earthnus.user.member;

import java.security.NoSuchAlgorithmException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public String myPoint(String mem_id) {
		System.out.println("S : myPoint()실행");
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String myPoint = dao.myPoint(mem_id);
		System.out.println("mypoint service");
		return myPoint;
	}

	public String myDonation(String mem_id) {
		System.out.println("S : mydonation()실행");
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String myDonation = dao.myDonation(mem_id);
		System.out.println("donation service");
		if(myDonation == null) {
		myDonation = "0";
	}	return myDonation;
	}
	
	public String pwCheck(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		String mem_pw = dao.pwCheck(mem_id);
		return mem_pw;
	}

	public MemberBean myInfo(String mem_id) {
		System.out.println("S : myInfo()실행");
		MemberBean memberBean = null;
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		memberBean = dao.myInfo(mem_id);
		return memberBean;
	}

	public void updateMyInfo(MemberBean memberBean) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		dao.updateMyInfo(memberBean);
		System.out.println("update service");
	}

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