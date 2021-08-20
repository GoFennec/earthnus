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


	public List<CheBoardBean> selectAllComment(String startnum,String comment_step) {
		CheBoardMybatis ChreBoardDAO = mybatis.getMapper(CheBoardMybatis.class);
		PageBean bean = new PageBean();
		List<CheBoardBean> CheBoardList = null;
		int start_num = Integer.parseInt(startnum);
		int step_num = Integer.parseInt(comment_step);
		
		bean.setComment_step(step_num);
		bean.setStartNum(start_num);
		CheBoardList = ChreBoardDAO.CheBoardList(bean);
		  return CheBoardList;
	}
}