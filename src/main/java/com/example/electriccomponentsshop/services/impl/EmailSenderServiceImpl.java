package com.example.electriccomponentsshop.services.impl;

import com.example.electriccomponentsshop.services.EmailSenderService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@AllArgsConstructor
@Service
public class EmailSenderServiceImpl implements EmailSenderService {
    private final String MAIL = "ZzthangdkZz2002@gmail.com";
    private final String PASSWORD = "txxchttmhzzupmsq";


    @Override
    public void sendMail(String to, String content, String subject){
        // Config
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", 587);

        // Authenticator
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MAIL, PASSWORD);
            }
        });

        // Mail info
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(MAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setContent(content,"text/html; charset=utf-8");
            Transport.send(message);
            System.out.println("Message sent successfully...");

        } catch (MessagingException e) {
            System.out.println("Message sent Fail...: "+ e.getMessage());

            throw new RuntimeException(e);
        }

    }
}
