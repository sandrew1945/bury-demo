package com.sandrew.boot;


import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by summer on 2017/12/25.
 */
//@EnableAutoConfiguration
@SpringBootApplication
@EnableCaching
@EnableTransactionManagement
@Log4j2
@Controller
public class Application
{
    @Autowired
    private ApplicationContext applicationContext;

    public static void main(String[] args)
    {
        SpringApplication.run(Application.class, args);
    }

    @RequestMapping("shutdown")
    public String stopApp()
    {
        SpringApplication.exit(applicationContext);
        return "stopped ...";
    }

}
