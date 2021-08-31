package kr.co.earthnus.user.auth;

import java.util.List;

import kr.co.earthnus.user.camBoard.camBoardBean;
import kr.co.earthnus.user.cheBoard.CheBoardBean;
import kr.co.earthnus.user.member.MemberBean;

public interface AuthMybatis {
	public MemberBean selectById(String auth_id);
	public String total_pay();
	public String endCam();
	public String total_f();
	public String total_o();
	public String total_i();
	public String total_p();
	public List<camBoardBean> cb_list();
	public List<CheBoardBean> ch_list();
}
