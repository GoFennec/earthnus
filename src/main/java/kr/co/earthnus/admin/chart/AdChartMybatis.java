package kr.co.earthnus.admin.chart;

import org.apache.ibatis.annotations.Param;

public interface AdChartMybatis {
	
	public int selectPlastic();
	public int selectOcean();
	public int selectIce();
	public int selectForest();
	
	public int countVisitor(@Param("i")int i);

}
