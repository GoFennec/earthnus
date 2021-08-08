package kr.co.earthnus.user.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertMember(MemberBean memberBean) {
		System.out.println("서비스");
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int n = dao.insertMember(memberBean);
		return n;
	}
	public MemberBean myInfo(String mem_id) {
		System.out.println("S : myInfo()실행");
		MemberBean memberBean = null;
									
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		
		memberBean = dao.myInfo(mem_id);
		System.out.println(memberBean.getMem_date() + " date check");
		System.out.println(memberBean);
		
		
		return memberBean;
	}																			
		public void updateMyInfo(MemberBean memberBean) {
			MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);	
			dao.updateMyInfo(memberBean);
			System.out.println("update service");
		}

		public void deleteMember(MemberBean memberBean) {
			MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);	
				dao.deleteMember(memberBean);
			
		}

	
}