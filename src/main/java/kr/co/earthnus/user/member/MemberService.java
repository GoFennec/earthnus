package kr.co.earthnus.user.member;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private SqlSessionTemplate mybatis;
	@Autowired
	private JavaMailSender mailSender;

	public int insertMember(MemberBean memberBean) {
		System.out.println("서비스");
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int n = dao.insertMember(memberBean);
		return n;
	}
	
	public int idCheck(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int n = dao.idCheck(mem_id);
		return n;
	}

	// 패스워드 찾기 이메일 발송
	public void mailSendWithPassword(String email) {
		
		
		char[] num = new char[8];

		for (int i = 0; i < 4; i++) {
			char y = (char) ((int) ((Math.random() * (122 - 97)) + 97));
			num[i] = y;
		}
		for (int i = 4; i < 8; i++) {
			char y = Character.forDigit(((int) (Math.random() * 9)), 10);
			num[i] = y;
		}

		String newnum = "";
		for (int i = 0; i < num.length; i++) {
			newnum = newnum + num[i];
		}
		
		Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "587");
        
        Authenticator auth = new MailAuth();
        
        Session session = Session.getDefaultInstance(prop, auth);
        
        MimeMessage msg = new MimeMessage(session);
    
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress("baltolly@gmail.com", "EARTH & US"));
            InternetAddress to = new InternetAddress(email);         
            msg.setRecipient(Message.RecipientType.TO, to);            
            msg.setSubject("EARTH & US 이메일 인증입니다.", "UTF-8");            
            msg.setText("안녕하세요 EARTH & US 입니다. \n"
            		  + "고객님의 이메일 인증 번호는 " + newnum + "입니다. \n"
            		  + "홈페이지로 가서 인증번호를 입력해주세요.", "UTF-8");            
            
            Transport.send(msg);
            
        } catch(AddressException ae) {            
            System.out.println("AddressException : " + ae.getMessage());           
        } catch(MessagingException me) {            
            System.out.println("MessagingException : " + me.getMessage());
        } catch(UnsupportedEncodingException e) {
            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
        }
	}

}