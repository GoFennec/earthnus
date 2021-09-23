package kr.co.earthnus.admin.chart;

import org.apache.ibatis.annotations.Param;

public interface AdChartMybatis {
	//파이차트
	public int getDonationPiePlastic();
	public int getDonationPieOcean();
	public int getDonationPieIce();
	public int getDonationPieForest();
	
	public int getCamPiePlastic();
	public int getCamPieOcean();
	public int getCamPieIce();
	public int getCamPieForest();
	
	public int getChePiePlastic();
	public int getChePieOcean();
	public int getChePieIce();
	public int getChePieForest();
	
	//7일 차트
	public int getCountVisitor(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("select_date")String select_date);
	public String getSumPlastic(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("select_date")String select_date);
	public String getSumOcean(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("select_date")String select_date);
	public String getSumIce(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("select_date")String select_date);
	public String getSumForest(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("select_date")String select_date);
	public int getCountMember(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("select_date")String select_date);
	public int getCountDelMember(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("select_date")String select_date);
	public int getCountExgoods(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("select_date")String select_date);
	
	//월별 차트
	public int getMonthData(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public String getPlasticMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public String getOceanMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public String getIceMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public String getForestMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public int getMemberMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public int getDelMemberMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	public int getExgoodsMonth(@Param("i")int i,@Param("select_year")String select_year,@Param("select_month")String select_month,@Param("lastDay")int lastDay);
	
	public int getCountVisitorMonth(@Param("select_year")String select_year,@Param("select_month")String select_month);
	public int getCountMemberMonth(@Param("select_year")String select_year,@Param("select_month")String select_month);
	public int getCountDelMemberMonth(@Param("select_year")String select_year,@Param("select_month")String select_month);
	public int getCountExgoodsMonth(@Param("select_year")String select_year,@Param("select_month")String select_month);
	public String getCountDonationMonth(@Param("select_year")String select_year,@Param("select_month")String select_month);
	public String getCountPlasticMonth(@Param("select_year")String select_year,@Param("select_month")String select_month);
	public String getCountOceanMonth(@Param("select_year")String select_year,@Param("select_month")String select_month);
	public String getCountIceMonth(@Param("select_year")String select_year,@Param("select_month")String select_month);
	public String getCountForestMonth(@Param("select_year")String select_year,@Param("select_month")String select_month);
	
	
	
}