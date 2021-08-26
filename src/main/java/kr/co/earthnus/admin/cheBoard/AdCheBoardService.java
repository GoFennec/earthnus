package kr.co.earthnus.admin.cheBoard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.earthnus.user.cheBoard.CheBoardBean;

@Service
public class AdCheBoardService {
		
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CheBoardBean> getBoardList() {
		AdCheBoardMybatis cheBoardDAO = mybatis.getMapper(AdCheBoardMybatis.class);
        List<CheBoardBean> cheBoardList = cheBoardDAO.getAdCheBoardList();
        return cheBoardList;
	}
	
	public void deleteCheBoard(List<String> checkArr) {
		AdCheBoardMybatis cheBoardDAO = mybatis.getMapper(AdCheBoardMybatis.class);
		cheBoardDAO.deleteCheBoard(checkArr);
	}

}
