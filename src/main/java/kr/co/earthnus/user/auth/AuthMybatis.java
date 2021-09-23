package kr.co.earthnus.user.auth;

import java.util.List;

import kr.co.earthnus.user.camBoard.camBoardBean;
import kr.co.earthnus.user.cheBoard.CheBoardBean;
import kr.co.earthnus.user.member.MemberBean;

public interface AuthMybatis {
	public MemberBean getSelectById(String auth_id);
	public String getTotal_pay();
	public String getEndCam();
	public String getTotal_f();
	public String getTotal_o();
	public String getTotal_i();
	public String getTotal_p();
	public List<camBoardBean> getCb_list();
	public List<CheBoardBean> getCh_list();
}
