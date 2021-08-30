package kr.co.earthnus.user.cheBoard;

import java.util.Date;

public class CheBoardBean {
	private int cheb_num;
	private String cheb_id;
	private String cheb_name;
	private String cheb_dname;
	private String cheb_content;
	private String cheb_date;
	private String d_img;
	private int Like_comment_number;
	private String Like_click_user;
	public int getCheb_num() {
		return cheb_num;
	}
	public void setCheb_num(int cheb_num) {
		this.cheb_num = cheb_num;
	}
	public String getCheb_id() {
		return cheb_id;
	}
	public void setCheb_id(String cheb_id) {
		this.cheb_id = cheb_id;
	}
	public String getCheb_name() {
		return cheb_name;
	}
	public void setCheb_name(String cheb_name) {
		this.cheb_name = cheb_name;
	}
	public String getCheb_dname() {
		return cheb_dname;
	}
	public void setCheb_dname(String cheb_dname) {
		this.cheb_dname = cheb_dname;
	}
	public String getCheb_content() {
		return cheb_content;
	}
	public void setCheb_content(String cheb_content) {
		this.cheb_content = cheb_content;
	}
	public String getCheb_date() {
		return cheb_date;
	}
	public void setCheb_date(String cheb_date) {
		this.cheb_date = cheb_date;
	}
	public String getD_img() {
		return d_img;
	}
	public void setD_img(String d_img) {
		this.d_img = d_img;
	}
	public int getLike_comment_number() {
		return Like_comment_number;
	}
	public void setLike_comment_number(int like_comment_number) {
		Like_comment_number = like_comment_number;
	}
	public String getLike_click_user() {
		return Like_click_user;
	}
	public void setLike_click_user(String like_click_user) {
		Like_click_user = like_click_user;
	}
	
}