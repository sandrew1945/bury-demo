package com.sandrew.boot;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;

/**
 *  Druid配置多数据源
 * Created by summer on 2018/10/20.
 */
//@Configuration
public class MultiDatasourceConfiguration
{
    @Primary
    @Bean
    @ConfigurationProperties("spring.datasource.druid.mysql")
    public DataSource dataSourceMySql(){
        return DruidDataSourceBuilder.create().build();
    }

    @Bean
    @ConfigurationProperties("spring.datasource.druid.oracle")
    public DataSource dataSourceOracle(){
        return DruidDataSourceBuilder.create().build();
    }
}
