package com.mercury.mail;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Properties;
import javax.mail.*; // Include Authenticator, Message, PasswordAuthentication, Session, Transport
import javax.mail.internet.*; // Include InternetAddress, MimeMessage

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.User;
import com.mercury.beans.UserInfo;
import com.mercury.dao.UserDao;


@Service
@Transactional
public class MailForgotPassword {
	
	@Autowired
	private UserDao ud;
	
	public UserDao getud() {
		return ud;
	}

	public void setud(UserDao ud) {
		this.ud = ud;
	}	
	
	public void sendForgotPasswordMail(String username, String useremail) {
		
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		Properties prop = System.getProperties();
		prop.setProperty("mail.smtp.host", "smtp.gmail.com");
		prop.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		prop.setProperty("mail.smtp.socketFactory.fallback", "false");
		prop.setProperty("mail.smtp.port", "465");
		prop.setProperty("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.auth", "true");		
		
		final String sender = "yftsemailsender@gmail.com";
		final String password = "yftspassword";
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
		
		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(sender));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress());
			msg.setSubject("Please verity your email address on Yahoo Finance Trading System");
			msg.setSentDate(new Date());
			BodyPart messageBodyPart = new MimeBodyPart();
			
			//link to the forgot password page
			String link = "http://localhost:8080/TradingSystem/activateAccount.html?username=" + username + "&" + "checkcode" + "=" + md5(username);
			
			messageBodyPart.setContent("<panel>"+
            		"<h2>Dear " + username +",</h2>"
            		+ "<h3>Change your password of Yohoo Finance Trading System</h3><br>" 
            		+ "<h4>Please " + "<a href='" + link +"'>click here</a>" + " to change your password.</h4><br>"
            		+ "<h4>Thanks,</h4>" 
            		+ "<h4>Team YFTS</h4></panel>"
            		,"text/html;charset=utf-8");
		
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
			msg.setContent(multipart);
			Transport.send(msg);
			System.out.println("Message sent successfully!");
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	/*
	 * MD5 encryption for the activity link of the email
	 */
	public String md5(String string) {  
        MessageDigest md = null;  
        try {  
            md = MessageDigest.getInstance("md5");  
            md.update(string.getBytes());  
            byte[] md5Bytes = md.digest();  
            return bytes2Hex(md5Bytes);  
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
        }  
          
        return null;  
    }  
    private static String bytes2Hex(byte[] byteArray)  
    {  
        StringBuffer strBuf = new StringBuffer();  
        for (int i = 0; i < byteArray.length; i++)  
        {  
            if(byteArray[i] >= 0 && byteArray[i] < 16)  
            {  
                strBuf.append("0");  
            }  
            strBuf.append(Integer.toHexString(byteArray[i] & 0xFF));  
        }  
        return strBuf.toString();  
    }  
    
    
    /*
     * update the user database password using MD5
     */
    public UserInfo updateUserPassword(String username) throws Exception {
    	User user = ud.findByUserName(username);
    	user.setPassWord(user.MD5Hashing(user.getUserName()));
    	ud.save(user);
    	UserInfo userInfo = new UserInfo();
    	userInfo.setMessage("Hello " + user.getUserName() + ", Welcome come back YFTS!");
    	userInfo.setUsers(ud.queryAll());
    	return userInfo;
    }
}
