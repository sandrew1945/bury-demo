package com.sandrew.boot;


import com.sandrew.boot.core.exception.ServiceException;
import lombok.extern.log4j.Log4j2;
import org.springframework.aop.aspectj.AspectJExpressionPointcutAdvisor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.interceptor.*;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

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
    @Value("${aop.pointcut.expression}")
    private String aopPointcutExpression;

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


    /**********************************/
    /**      事务配置信息  START      **/
    /**********************************/

    /*事务拦截类型*/
    @Bean("txSource")
    public TransactionAttributeSource transactionAttributeSource()
    {
        NameMatchTransactionAttributeSource source = new NameMatchTransactionAttributeSource();
         /*只读事务，不做更新操作*/
        RuleBasedTransactionAttribute readOnlyTx = new RuleBasedTransactionAttribute();
        readOnlyTx.setReadOnly(true);
        readOnlyTx.setPropagationBehavior(TransactionDefinition.PROPAGATION_NOT_SUPPORTED);
        /*当前存在事务就使用当前事务，当前不存在事务就创建一个新的事务*/
        RuleBasedTransactionAttribute requiredTx = new RuleBasedTransactionAttribute(TransactionDefinition.PROPAGATION_REQUIRED, Collections.singletonList(new RollbackRuleAttribute(ServiceException.class)));
        requiredTx.setTimeout(5);
        Map<String, TransactionAttribute> txMap = new HashMap<String, TransactionAttribute>();
        txMap.put("add*", requiredTx);
        txMap.put("save*", requiredTx);
        txMap.put("insert*", requiredTx);
        txMap.put("update*", requiredTx);
        txMap.put("delete*", requiredTx);
        txMap.put("get*", readOnlyTx);
        txMap.put("query*", readOnlyTx);
        txMap.put("*", readOnlyTx);
        source.setNameMap(txMap);

        return source;
    }

    /**
     * 切面拦截规则 参数会自动从容器中注入
     */
    @Bean
    public AspectJExpressionPointcutAdvisor pointcutAdvisor(TransactionInterceptor txInterceptor)
    {
        AspectJExpressionPointcutAdvisor pointcutAdvisor = new AspectJExpressionPointcutAdvisor();
        pointcutAdvisor.setAdvice(txInterceptor);
        pointcutAdvisor.setExpression(aopPointcutExpression);
        return pointcutAdvisor;
    }

    /*事务拦截器*/
    @Bean("txInterceptor")
    TransactionInterceptor getTransactionInterceptor(PlatformTransactionManager platformTransactionManager)
    {
        return new TransactionInterceptor(platformTransactionManager, transactionAttributeSource());
    }
    /**********************************/
    /**        事务配置信息  END       **/
    /**********************************/
}
