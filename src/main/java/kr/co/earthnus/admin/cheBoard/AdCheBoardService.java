package kr.co.earthnus.admin.cheBoard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.earthnus.user.cheBoard.CheBoardBean;
import kr.co.earthnus.user.cheBoard.CheBoardMybatis;

@Service
public class AdCheBoardService{

	@Autowired
	private SqlSessionTemplate mybatis;

	
	

	public void deleteReply(int reply_id) {
		
		CheBoardMybatis ChreBoardDAO = mybatis.getMapper(CheBoardMybatis.class);
		ChreBoardDAO.replyDelete(reply_id);
	}


	


	public List<CheBoardBean> selectAllComment(Model model) {
		CheBoardMybatis ChreBoardDAO = mybatis.getMapper(CheBoardMybatis.class);
		List<CheBoardBean> CheBoardList = null;
		CheBoardList = ChreBoardDAO.CheBoardList();
		
		 model.addAttribute("list",CheBoardList);
		  return CheBoardList;
	}
}