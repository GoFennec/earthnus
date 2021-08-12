package kr.co.earthnus.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{
	
    PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "baltolly@gmail.com";
        String mail_pw = "960822iy";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
