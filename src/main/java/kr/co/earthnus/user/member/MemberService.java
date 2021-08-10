package kr.co.earthnus.user.member;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
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
import org.springframework.stereotype.Service;

import kr.co.earthnus.util.MailAuth;
import kr.co.earthnus.util.MailBean;
import kr.co.earthnus.util.SHA256;

@Service
public class MemberService {
	@Autowired
	private SqlSessionTemplate mybatis;

	public int insertMember(MemberBean memberBean) throws NoSuchAlgorithmException {
		System.out.println("서비스");
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
        SHA256 sha256 = new SHA256();

        //비밀번호
        String password = memberBean.getMem_pw();
        //SHA256으로 암호화된 비밀번호
        String cryptogram = sha256.encrypt(password);

        System.out.println(cryptogram);

        memberBean.setMem_pw(cryptogram);

        //비밀번호 일치 여부
        System.out.println(cryptogram.equals(sha256.encrypt(password)));
		int n = dao.insertMember(memberBean);
		return n;
	}

	public MemberBean myPage(String mem_id) {
		System.out.println("S : myPage()실행");
		MemberBean memberBean = null;
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		memberBean = dao.myPage(mem_id);
		return memberBean;
	}

	public int pwCheck(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int n = dao.pwCheck(mem_id);
		return n;
	}

	public MemberBean myInfo(String mem_id) {
		System.out.println("S : myInfo()실행");
		MemberBean memberBean = null;
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		memberBean = dao.myInfo(mem_id);
		return memberBean;
	}

	public void updateMyInfo(MemberBean memberBean) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		dao.updateMyInfo(memberBean);
		System.out.println("update service");
	}

	public void deleteMember(MemberBean memberBean) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		dao.deleteMember(memberBean);
		System.out.println("delete service");

	}

	// 아이디 중복체크
	public int idCheck(String mem_id) {
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		int n = dao.idCheck(mem_id);
		return n;
	}

	// 패스워드 찾기 이메일 발송
	public int mailSendWithPassword(String email, String id) {

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
		String content = "안녕하세요 EARTH & US 입니다. \n" + "고객님의 회원가입 이메일 인증 번호는 " + newnum + "입니다. \n"
				+ "홈페이지로 가서 인증번호를 입력해주세요.";
		String password = newnum;
		String sender = "baltolly@gmail.com";
		String receiver = email;
		String customer = id;

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
		System.out.println(i + " error service");
		return i;
	}

	public boolean mailCheck(String mailCheck, String id) {
		boolean correct = false;
		MemberMybatis dao = mybatis.getMapper(MemberMybatis.class);
		System.out.println(mailCheck + " Service");
		System.out.println(id + " Service");
		MailBean mailBean = dao.selectMail(id);
		
		if(mailBean.getMail_pw().equals(mailCheck)) {
			correct = true;
		}
		return correct;
	}

}