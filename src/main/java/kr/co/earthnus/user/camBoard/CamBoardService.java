package kr.co.earthnus.user.camBoard;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class CamBoardService {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void getCamBoardList(camBoardBean bean, String pagenum, String contentnum, Model model) {
		CamBoardMybatis CamBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		PagingBean pBean = new PagingBean();

        int cPagenum = Integer.parseInt(pagenum);
        int cContentnum = Integer.parseInt(contentnum);

        List<camBoardBean> CamBoardList = null;

        pBean.setTotalcount(CamBoardDAO.camBoardCount()); // mapper ��ü �Խñ� ������ �����Ѵ�
        pBean.setPagenum(cPagenum-1);   // ���� �������� ������ ��ü�� �����Ѵ� -1 �� �ؾ� �������� ����Ҽ� �ִ�
        pBean.setContentnum(cContentnum); // �� �������� ��� �Խñ��� �������� �����Ѵ�.
        pBean.setCurrentblock(cPagenum); // ���� ������ ����� ������� ���� ������ ��ȣ�� ���ؼ� �����Ѵ�.
        pBean.setLastblock(pBean.getTotalcount()); // ������ ��� ��ȣ�� ��ü �Խñ� ���� ���ؼ� ���Ѵ�.

        pBean.prevnext(cPagenum);//���� ������ ��ȣ�� ȭ��ǥ�� ��Ÿ���� ���Ѵ�.
        pBean.setStartPage(pBean.getCurrentblock()); // ���� �������� ������ ��Ϲ�ȣ�� ���Ѵ�.
        pBean.setEndPage(pBean.getLastblock(),pBean.getCurrentblock());
        //������ �������� ������ ������ ��ϰ� ���� ������ ��� ��ȣ�� ���Ѵ�.

        if(cContentnum == 6){//���� �Խñ� ��
        	pBean.setPagenum(pBean.getPagenum()*6);
        	CamBoardList = CamBoardDAO.getCamBoardList(pBean);
        }
        
		model.addAttribute("CamBoardList", CamBoardList);
        model.addAttribute("page", pBean);
	}
	public camBoardBean getCamBoard(String contentnum) {
		CamBoardMybatis camBoardDAO = mybatis.getMapper(CamBoardMybatis.class);
		
		System.out.println("���� : " + contentnum);
		return camBoardDAO.getCamBoard(Integer.parseInt(contentnum));
	}
	/*public MemberBean getMember(MemberBean mBean) {
		return CamBoardDAO.getMember(mBean);
	}*/
}
