package kr.co.earthnus.util;

public class MailBean {
	
	private String mail_title;
	private String mail_content;
	private String mail_pw;
	private String mail_sender;
	private String mail_receiver;
	private String mail_customer;
	
	public MailBean() {}
	
	public MailBean(String title, String content, String pw, String sender, String receiver, String customer) {
		this.mail_title = title;
		this.mail_content = content;
		this.mail_pw = pw;
		this.mail_sender = sender;
		this.mail_receiver = receiver;
		this.mail_customer = customer;
	}
	
	public String getMail_title() {
		return mail_title;
	}
	public void setMail_title(String mail_title) {
		this.mail_title = mail_title;
	}
	public String getMail_content() {
		return mail_content;
	}
	public void setMail_content(String mail_content) {
		this.mail_content = mail_content;
	}
	public String getMail_pw() {
		return mail_pw;
	}
	public void setMail_pw(String mail_pw) {
		this.mail_pw = mail_pw;
	}
	public String getMail_sender() {
		return mail_sender;
	}
	public void setMail_sender(String mail_sender) {
		this.mail_sender = mail_sender;
	}
	public String getMail_receiver() {
		return mail_receiver;
	}
	public void setMail_receiver(String mail_receiver) {
		this.mail_receiver = mail_receiver;
	}
	public String getMail_customer() {
		return mail_customer;
	}
	public void setMail_customer(String mail_customer) {
		this.mail_customer = mail_customer;
	}
	
	
}
