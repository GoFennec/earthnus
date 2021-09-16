package kr.co.earthnus.user.cheBoard;

import java.util.Date;

public class CheBoardBean {
	private int cheb_num;
	private String cheb_id;
	private String cheb_name;
	private String cheb_dname;
	private String cheb_content;
	private String cheb_date;
	private int cheb_comment_like_total;
	private String d_img;
	private Date cheb_time;
	
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
	public int getCheb_comment_like_total() {
		return cheb_comment_like_total;
	}
	public void setCheb_comment_like_total(int cheb_comment_like_total) {
		this.cheb_comment_like_total = cheb_comment_like_total;
	}
	public String getD_img() {
		return d_img;
	}
	public void setD_img(String d_img) {
		this.d_img = d_img;
	}
	public Date getCheb_time() {
		return cheb_time;
	}
	public void setCheb_time(Date cheb_time) {
		this.cheb_time = cheb_time;
	}
}