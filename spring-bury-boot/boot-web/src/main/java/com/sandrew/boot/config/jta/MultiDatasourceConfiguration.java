package com.sandrew.boot.config.jta;

import com.alibaba.druid.pool.xa.DruidXADataSource;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jta.atomikos.AtomikosDataSourceBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;

/**
 * Druid配置多数据源
 * Created by summer on 2018/10/20.
 */
//@Configuration
public class MultiDatasourceConfiguration
{

    @Autowired
    DataSourcesProperties dataSourceProperties;

    @Primary
    @Bean
    public DataSource dataSourceMySql()
    {
        DataSourcesProperties s = dataSourceProperties;
        DruidXADataSource datasource = new DruidXADataSource();
        BeanUtils.copyProperties(dataSourceProperties.getMysql(), datasource);
        AtomikosDataSourceBean xaDataSource = new AtomikosDataSourceBean();
        xaDataSource.setXaDataSource(datasource);
        xaDataSource.setMinPoolSize(5);
        xaDataSource.setMaxPoolSize(10);
        xaDataSource.setBorrowConnectionTimeout(60);
        //xaDataSource.setUniqueResourceName("oneDataSource");
        return xaDataSource;
    }

    @Bean
    public DataSource dataSourceOracle()
    {
        DruidXADataSource datasource = new DruidXADataSource();
        BeanUtils.copyProperties(dataSourceProperties.getOracle(), datasource);
        AtomikosDataSourceBean xaDataSource = new AtomikosDataSourceBean();
        xaDataSource.setMinPoolSize(5);
        xaDataSource.setMaxPoolSize(10);
        xaDataSource.setBorrowConnectionTimeout(60);
        xaDataSource.setXaDataSource(datasource);
        //xaDataSource.setUniqueResourceName("oneDataSource");
        return xaDataSource;
    }

}
