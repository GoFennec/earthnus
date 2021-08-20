package kr.co.earthnus.admin.cheBoard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.earthnus.user.cheBoard.CheBoardBean;

@Service
public class AdCheBoardService{

	@Autowired
	private SqlSessionTemplate mybatis;

	
	

	public void deleteReply(int reply_id) {
		
		AdCheBoardMybatis ChreBoardDAO = mybatis.getMapper(AdCheBoardMybatis.class);
		ChreBoardDAO.AdreplyDelete(reply_id);
	}


	


	public List<CheBoardBean> selectAllComment(Model model) {
		AdCheBoardMybatis ChreBoardDAO = mybatis.getMapper(AdCheBoardMybatis.class);
		List<CheBoardBean> CheBoardList = null;
		CheBoardList = ChreBoardDAO.AdCheBoardList();
		
		 model.addAttribute("list",CheBoardList);
		  return CheBoardList;
	}
}