package kr.co.earthnus.user.goods;

import org.springframework.web.multipart.MultipartFile;

public class GoodsBean {
	private String goods_num;
	private String goods_name;
	private String goods_category;
	private int goods_point;
	private String goods_info;
	private String goods_desc;
	private String goods_img;
	private MultipartFile goods_uploadFile;
	
	public String getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_category() {
		return goods_category;
	}
	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}
	public int getGoods_point() {
		return goods_point;
	}
	public void setGoods_point(int goods_point) {
		this.goods_point = goods_point;
	}
	public String getGoods_info() {
		return goods_info;
	}
	public void setGoods_info(String goods_info) {
		this.goods_info = goods_info;
	}
	public String getGoods_desc() {
		return goods_desc;
	}
	public void setGoods_desc(String goods_desc) {
		this.goods_desc = goods_desc;
	}
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
	public MultipartFile getGoods_uploadFile() {
		return goods_uploadFile;
	}
	public void setGoods_uploadFile(MultipartFile goods_uploadFile) {
		this.goods_uploadFile = goods_uploadFile;
	}
}
