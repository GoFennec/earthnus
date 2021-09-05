package kr.co.earthnus.admin.chart;

import org.apache.ibatis.annotations.Param;

public interface AdChartMybatis {
	
	public int donationPiePlastic();
	public int donationPieOcean();
	public int donationPieIce();
	public int donationPieForest();
	
	public int camPiePlastic();
	public int camPieOcean();
	public int camPieIce();
	public int camPieForest();
	
	public int chePiePlastic();
	public int chePieOcean();
	public int chePieIce();
	public int chePieForest();
	
	public int countVisitor(@Param("i")int i);
	
	public String sumPlastic(@Param("i")int i);
	public String sumOcean(@Param("i")int i);
	public String sumIce(@Param("i")int i);
	public String sumForest(@Param("i")int i);
	
	public int countMember(@Param("i")int i);
	public int countExgoods(@Param("i")int i);

}