package com.sandrew.boot.core.mail;

import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;

/**
 * Created by summer on 2018/11/11.
 */
public class MailSender
{
    /**
     *  发送简单右键
     * @param mailSender
     * @param from
     * @param to
     * @param subject
     * @param content
     */
    public static void sendSimpleMail(JavaMailSender mailSender, String from, String to, String subject, String content)
    {
        try
        {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(from);
            message.setTo(to);
            message.setSubject(subject);
            message.setText(content);
            mailSender.send(message);
        }
        catch (MailException e)
        {
            e.printStackTrace();
        }
    }

    /**
     *  发送带附件邮件
     * @param mailSender
     * @param from
     * @param to
     * @param subject
     * @param content
     * @param files
     */
    public static void sendAttachmentMail(JavaMailSender mailSender, String from, String to, String subject, String content, File... files)
    {
        try
        {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(content);
            for (File file : files)
            {
                helper.addAttachment(file.getName(), file);
            }
            mailSender.send(mimeMessage);
        }
        catch (MessagingException e)
        {
            e.printStackTrace();
        }
    }

    /**
     *  发送模本邮件
     * @param mailSender
     * @param from
     * @param to
     * @param subject
     * @param builder
     */
    public static void sendTemplateMail(JavaMailSender mailSender, String from, String to, String subject, MailContentBuilder builder)
    {
        try
        {
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
            helper.setFrom(from);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(builder.build(), true);

            mailSender.send(mimeMessage);
        }
        catch (MessagingException e)
        {
            e.printStackTrace();
        }
    }
}
