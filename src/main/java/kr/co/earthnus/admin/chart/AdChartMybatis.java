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
	
	public int getMonthData(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public String getPlasticMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public String getOceanMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public String getIceMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public String getForestMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public int getMemberMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public int getDelMemberMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public int getExgoodsMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	
	public int getCountVisitorMonth(@Param("select_year")String select_year,@Param("select_month")String select_month);
	
}