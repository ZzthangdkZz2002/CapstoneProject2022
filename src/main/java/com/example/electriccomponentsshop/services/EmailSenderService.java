package com.example.electriccomponentsshop.services;


import org.springframework.mail.javamail.JavaMailSender;

public interface EmailSenderService {
   void sendMail(String to, String content,String subject);
}
