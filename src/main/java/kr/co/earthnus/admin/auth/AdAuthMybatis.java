package kr.co.earthnus.admin.auth;

import kr.co.earthnus.admin.member.AdMemberBean;

public interface AdAuthMybatis {
	public AdMemberBean selectByAdId(String auth_id);
	public void insertVisitor(VisitCountBean vcb);
	public int selectPlastic();
	public int selectOcean();
	public int selectIce();
	public int selectForest();
}
