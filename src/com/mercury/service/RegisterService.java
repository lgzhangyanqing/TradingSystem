package com.mercury.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.beans.User;
import com.mercury.beans.UserInfo;
import com.mercury.dao.UserDao;

@Service
@Transactional
public class RegisterService {
	@Autowired
	private UserDao ud;
	
	public UserDao getud() {
		return ud;
	}

	public void setud(UserDao ud) {
		this.ud = ud;
	}
	
	public UserInfo register(User user) {
		user.setAuthority("ROLE_USER");
		user.setBalance(0);
		user.setEnabled(0);
		ud.save(user);
		UserInfo userInfo = new UserInfo();
		userInfo.setMessage("Hello " + user.getUserName() + ", welcome to YFTS!");
		userInfo.setUsers(ud.queryAll());
		return userInfo;
	}
	
	public void ActivateUser(String username){
		User user = ud.findByUserName(username);
		user.setEnabled(1);
		ud.update(user);
	}
	
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
	
	public void sendMail(String username, String email) {
		final String fromMail = "yftsemailsystem@gmail.com";
		final String password = "yftspassword";
		
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";  
        Properties prop = System.getProperties();
        prop.setProperty("mail.smtp.host", "smtp.gmail.com");   
        prop.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);   
        prop.setProperty("mail.smtp.socketFactory.fallback", "false");   
        prop.setProperty("mail.smtp.port", "465");   
        prop.setProperty("mail.smtp.socketFactory.port", "465");   
        prop.put("mail.smtp.auth", "true");   
        
        
        Session session = Session.getDefaultInstance(prop, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() { 
            	return new PasswordAuthentication(fromMail, password);
            	} 
            });
        try {		
        	//create a default MimeMessage object
            Message msg = new MimeMessage(session);
            //set From: header field of the header
            msg.setFrom(new InternetAddress(fromMail));
            //set To: header field of the header
            //msg.setRecipient(Message.RecipientType.TO, new InternetAddress("good.qu@gmail.com"));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
            //msg.addRecipient(Message.RecipientType.CC, "good.qu@gmail.com");
            //set Subject: header field
            msg.setSubject("Greetings from Yahoo Finance Trading System"); msg.setSentDate(new Date());
            //msg.setText("Hello!"); 
            
            // Create the message part
            BodyPart messageBodyPart = new MimeBodyPart();
            //now set the actual message
            //messageBodyPart.setText("Dear " + username +",\n\nWelcome to Yahoo Finance!");
            String link = "http://localhost:8080/TradingSystem/activateAccount.html?username=" + username + "&" + "checkcode" + "=" + md5(username);  
            messageBodyPart.setContent("Dear " + username + "<br><br>Welcome to Yahoo Finance!<br>" + 
            		"<a href='" + link +"'>Please click this link to activate your account</a>","text/html;charset=utf-8");  
            // Create a multipart message
            Multipart multipart = new MimeMultipart();
            //set text message part
            multipart.addBodyPart(messageBodyPart);
            
            //send the complete message parts
            msg.setContent(multipart);
            //send message
            Transport.send(msg);
            System.out.println("Message sent successfully!");
        } catch (Exception e) { 
        	System.out.println(e); 
        }
	}
	
}
