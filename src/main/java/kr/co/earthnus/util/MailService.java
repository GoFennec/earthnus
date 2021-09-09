package kr.co.earthnus.util;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;
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
import org.springframework.stereotype.Service;

import kr.co.earthnus.user.member.MemberBean;
import kr.co.earthnus.user.member.MemberMybatis;

@Service
public class MailService {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 인증 이메일 발송
	public int mailSendWithPassword(String email, String name) {

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

		String title = "EARTH & US 이메일 인증입니다.";
		String content = "안녕하세요 EARTH & US 입니다. \n" + "고객님이 요청하신 이메일 인증 번호는 " + newnum + " 입니다. \n"
				+ "인증번호를 인증번호 입력창에 입력해 주세요. \n 감사합니다.";
		String password = newnum;
		String sender = "baltolly@gmail.com";
		String receiver = email;
		String customer = name;

		MailBean mailBean = new MailBean(title, content, password, sender, receiver, customer);
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		dao.insertMail(mailBean);

		int i = 0;
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress(sender, "EARTH & US"));
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject(title, "UTF-8");
			msg.setText(content, "UTF-8");

			Transport.send(msg);

		} catch (AddressException ae) {
			i++;
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			i++;
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			i++;
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		} catch (Exception ex) {
			i++;
			System.out.println("Exception : " + ex.getMessage());
		}
		return i;
	}
	
	// 임시 비밀번호 발송
	public int mailSendWithPassword2(String email, String name) throws MalformedURLException, NoSuchAlgorithmException {

		char[] num = new char[10];
		for (int i = 0; i < 5; i++) {
			char y = (char) ((int) ((Math.random() * (122 - 97)) + 97));
			num[i] = y;
		}
		for (int i = 5; i < 10; i++) {
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

		String title = "EARTH & US 임시 비밀번호입니다.";
		String content = "안녕하세요 EARTH & US 입니다. \n" + "고객님의 임시 비밀번호는 " + newnum + " 입니다. \n"
				+ "임시 비밀번호로 로그인을 하신 후 마이페이지에서 비밀번호를 변경해 주세요.";
		String password = newnum;
		String sender = "baltolly@gmail.com";
		String receiver = email;
		String customer = name;

		MailBean mailBean = new MailBean(title, content, password, sender, receiver, customer);
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		dao.insertMail(mailBean);
		changePW(newnum, email, name);

		int i = 0;
		try {
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress(sender, "EARTH & US"));
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject(title, "UTF-8");
			msg.setText(content, "UTF-8");

			Transport.send(msg);

		} catch (AddressException ae) {
			i++;
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			i++;
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			i++;
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		} catch (Exception ex) {
			i++;
			System.out.println("Exception : " + ex.getMessage());
		}
		return i;
	}
	
	
	public int changePW(String newnum, String email, String name) throws NoSuchAlgorithmException {
		
		SHA256 sha256 = new SHA256();

        //SHA256으로 암호화된 비밀번호
        String changeNum = sha256.encrypt(newnum);

		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int n = dao.changePW(changeNum, email, name);
		return n;
	}
	
	//인증번호 확인
	public boolean mailCheck(String mailCheck, String name, String email) {
		boolean correct = false;
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		MailBean mailBean = dao.getSelectMail(name, email);
		
		if(mailBean.getMail_pw().equals(mailCheck)) {
			correct = true;
		}
		return correct;
	}
	
	//아이디 일치 여부
	public boolean find(String findName, String findEmail) {
		boolean correct = false;
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int find = dao.getFind(findName, findEmail);
		
		if(find > 0) {
			correct = true;
		}
		return correct;
	}
	
	//비밀번호 찾기 일치 여부
	public boolean findpw(String findName, String findEmail, String mem_id) {
		boolean correct = false;
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int find = dao.getFindpw(findName, findEmail, mem_id);
		
		if(find > 0) {
			correct = true;
		}
		return correct;
	}
	
	//아이디 찾기에서 인증번호 일치 확인
	public List<MemberBean> findID(String findName, String mail_receiver) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		List<MemberBean> findID = dao.getFindID(findName, mail_receiver);
		
		return findID;
	}
}
