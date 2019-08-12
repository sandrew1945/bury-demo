package com.sandrew.boot.core.mail;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.annotation.Resource;
import java.io.File;
import java.util.Map;

/**
 * Created by summer on 2018/11/12.
 */
@Component
public class MailUtil
{
    @Resource
    private JavaMailSender mailSender;

    @Resource
    private TemplateEngine templateEngine;

    /**
     *  发送简单格式邮件
     * @param from
     * @param to
     * @param subject
     * @param content
     */
    public void sendSimpleMail(final String from, final String to, final String subject, final String content)
    {
        Runnable runnable = new Runnable()
        {
            @Override
            public void run()
            {
                MailSender.sendSimpleMail(mailSender, from, to, subject, content);
            }
        };
        Thread thread = new Thread(runnable);
        thread.start();
    }

    /**
     *  发送带附件邮件
     * @param from
     * @param to
     * @param subject
     * @param content
     * @param files
     */
    public void sendAttachmentMail(final String from, final String to, final String subject, final String content, final File... files)
    {
        Runnable runnable = new Runnable()
        {
            @Override
            public void run()
            {
                MailSender.sendAttachmentMail(mailSender, from, to, subject, content, files);
            }
        };
        Thread thread = new Thread(runnable);
        thread.start();
    }

    /**
     *  发送模板邮件
     * @param from
     * @param to
     * @param subject
     * @param template
     * @param param
     */
    public void sendTemplateMail(final String from, final String to, final String subject, final String template, final Map<String, Object> param)
    {
        Runnable runnable = new Runnable()
        {
            @Override
            public void run()
            {
                MailSender.sendTemplateMail(mailSender, from, to, subject, new MailContentBuilder()
                {
                    @Override
                    public String build()
                    {
                        Context context = new Context();
                        context.setVariables(param);
                        return templateEngine.process(template, context);
                    }
                });

            }
        };
        Thread thread = new Thread(runnable);
        thread.start();
    }
}
