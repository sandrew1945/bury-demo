package com.sandrew.boot.controller.example;

import com.sandrew.boot.core.mail.MailUtil;
import com.sandrew.boot.core.nosql.MongoUtil;
import org.springframework.data.mongodb.core.MongoTemplate;

import javax.annotation.Resource;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by summer on 2018/11/11.
 */
public class ExampleController
{

    @Resource
    private MailUtil mailUtil;

    @Resource
    private MongoTemplate mongoTemplatePri;

    @Resource
    private MongoTemplate mongoTemplateSec;


    /**
     *  发送邮件样例
     */
    public void sendMailExample()
    {
        Runnable runnable = new Runnable()
        {
            @Override
            public void run()
            {
                mailUtil.sendSimpleMail("42951690@qq.com", "sandrew1945@gmail.com", "测试主题", "测试内容");

                Map<String, Object> param = new HashMap<String, Object>();
                param.put("name", "王五");
                param.put("gender", "BOY");
                mailUtil.sendTemplateMail("42951690@qq.com", "sandrew1945@gmail.com", "Subject", "email/mailtemplate", param);

                File file = new File("/Users/summer/Desktop/doc.txt");
                mailUtil.sendAttachmentMail("42951690@qq.com", "sandrew1945@gmail.com", "Subject", "Content", file);
            }
        };
        Thread t = new Thread(runnable);
        t.start();
    }

    /**
     *  mongo CRUD样例
     */
    public void mongoExample()
    {
        MongoUtil util = new MongoUtil(mongoTemplatePri);
        util.save("collection", "testValue");
    }
}
