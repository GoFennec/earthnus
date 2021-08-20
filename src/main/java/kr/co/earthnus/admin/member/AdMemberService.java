package kr.co.earthnus.admin.member;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.earthnus.user.member.MemberBean;
import kr.co.earthnus.util.SHA256;

@Service("adMemberService")
public class AdMemberService {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MemberBean> memberList() {
		AdMemberMybatis dao = mybatis.getMapper(AdMemberMybatis.class);
		List<MemberBean> memberList = dao.memberList();
		return memberList;
	}
	
	public List<MemberBean> memberListDetail(String mem_id) {
		AdMemberMybatis dao = mybatis.getMapper(AdMemberMybatis.class);
		List<MemberBean> memberList = dao.memberListDetail(mem_id);
		return memberList;
	}
	
	public int payCount(String mem_id) {
		AdMemberMybatis dao = mybatis.getMapper(AdMemberMybatis.class);
		int payCount = dao.payCount(mem_id);
		return payCount;
	}
	
	public Integer payTotal(String mem_id) {
		int payTotal = 0;
		AdMemberMybatis dao = mybatis.getMapper(AdMemberMybatis.class);
		if(dao.payTotal(mem_id) == null) {
			payTotal = 0;
		}else {
			payTotal = dao.payTotal(mem_id);
		}
		return payTotal;
	}
	
	public int cheerCount(String mem_id) {
		AdMemberMybatis dao = mybatis.getMapper(AdMemberMybatis.class);
		int cheerCount = dao.cheerCount(mem_id);
		return cheerCount;
	}
	
	public int deletePW(String deletePW) throws NoSuchAlgorithmException {
		AdMemberMybatis dao = mybatis.getMapper(AdMemberMybatis.class);
        SHA256 sha256 = new SHA256();

        //SHA256으로 암호화된 비밀번호
        String cryptogram = sha256.encrypt(deletePW);

        System.out.println(cryptogram);

        //비밀번호 일치 여부
        System.out.println(cryptogram.equals(sha256.encrypt(deletePW)));
		int deletePass = dao.deletePW(cryptogram);
		return deletePass;
	}
	
	public void deleteMember(String deleteMember) {
		AdMemberMybatis dao = mybatis.getMapper(AdMemberMybatis.class);
		dao.adDeleteMember(deleteMember);
	}
}
