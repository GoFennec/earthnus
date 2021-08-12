package kr.co.earthnus.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{
	
    PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "earthnusfinal@gmail.com";
        String mail_pw = "Earthnus1234";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
