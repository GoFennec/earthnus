package kr.co.earthnus.user.cheBoard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class CheBoardService{

	@Autowired
	private SqlSessionTemplate mybatis;

	
	public void CheBoardList(CheBoardBean bean, String pagenum, String contentnum, Model model) {
		CheBoardMybatis ChreBoardDAO = mybatis.getMapper(CheBoardMybatis.class);
		
		PagingBean pBean = new PagingBean();

        int cPagenum = Integer.parseInt(pagenum);
        int cContentnum = Integer.parseInt(contentnum);
        
        List<CheBoardBean> CheBoardList = null;

        pBean.setTotalcount(ChreBoardDAO.CheBoardCount()); // mapper �쟾泥� 寃뚯떆湲� 媛쒖닔瑜� 吏��젙�븳�떎
        pBean.setPagenum(cPagenum-1);
        // �쁽�옱 �럹�씠吏�瑜� �럹�씠吏� 媛앹껜�뿉 吏��젙�븳�떎 -1 �쓣 �빐�빞 荑쇰━�뿉�꽌 �궗�슜�븷�닔 �엳�떎
        pBean.setContentnum(cContentnum);// �븳 �럹�씠吏��뿉 紐뉕컻�뵫 寃뚯떆湲��쓣 蹂댁뿬以꾩� 吏��젙�븳�떎.
        pBean.setCurrentblock(cPagenum); // �쁽�옱 �럹�씠吏� 釉붾줉�씠 紐뉖쾲�씤吏� �쁽�옱 �럹�씠吏� 踰덊샇瑜� �넻�빐�꽌 吏��젙�븳�떎.
        pBean.setLastblock(pBean.getTotalcount()); // 留덉�留� 釉붾줉 踰덊샇瑜� �쟾泥� 寃뚯떆湲� �닔瑜� �넻�빐�꽌 �젙�븳�떎.
        
        pBean.prevnext(cPagenum);//�쁽�옱 �럹�씠吏� 踰덊샇濡� �솕�궡�몴瑜� �굹���궪吏� �젙�븳�떎.
        pBean.setStartPage(pBean.getCurrentblock()); // �떆�옉 �럹�씠吏�瑜� �럹�씠吏� 釉붾줉踰덊샇濡� �젙�븳�떎.
       
        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
        //留덉�留� �럹�씠吏�瑜� 留덉�留� �럹�씠吏� 釉붾줉怨� �쁽�옱 �럹�씠吏� 釉붾줉 踰덊샇濡� �젙�븳�떎.
        
        if(cContentnum == 10){//�꽑�깮 寃뚯떆湲� �닔
        	pBean.setPagenum(pBean.getPagenum()*10);
        	CheBoardList = ChreBoardDAO.CheBoardList(pBean);
        }
        System.out.println(CheBoardList);
        model.addAttribute("list", CheBoardList);
		model.addAttribute("page", pBean);
	}
}