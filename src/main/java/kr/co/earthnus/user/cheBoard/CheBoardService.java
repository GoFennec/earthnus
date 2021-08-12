package kr.co.earthnus.user.cheBoard;

import java.util.List;

import javax.xml.stream.events.Comment;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class CheBoardService{

	@Autowired
	private SqlSessionTemplate mybatis;

	
	

	public void deleteReply(int reply_id) {
		
		CheBoardMybatis ChreBoardDAO = mybatis.getMapper(CheBoardMybatis.class);
		ChreBoardDAO.replyDelete(reply_id);
	}


	public void replyInsert(CheBoardBean boardBean) {
		CheBoardMybatis ChreBoardDAO = mybatis.getMapper(CheBoardMybatis.class);
		ChreBoardDAO.replyInsert(boardBean);
	}


	public List<CheBoardBean> selectAllComment(CheBoardBean bean, Model model) {
		CheBoardMybatis ChreBoardDAO = mybatis.getMapper(CheBoardMybatis.class);
		List<CheBoardBean> CheBoardList = null;
		CheBoardList = ChreBoardDAO.CheBoardList();
		
		 model.addAttribute("list",CheBoardList);
		  return CheBoardList;
	}
}