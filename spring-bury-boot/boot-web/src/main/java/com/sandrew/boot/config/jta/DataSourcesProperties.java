package com.sandrew.boot.config.jta;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.NestedConfigurationProperty;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

/**
 * Created by summer on 2019/8/13.
 */
@Configuration
@ConfigurationProperties(prefix = "spring.datasource.druid")
@Component
public class DataSourcesProperties
{

    @NestedConfigurationProperty
    DataSourceMetaProperties mysql = new DataSourceMetaProperties();


    @NestedConfigurationProperty
    DataSourceMetaProperties oracle = new DataSourceMetaProperties();

    public DataSourceMetaProperties getMysql()
    {
        return mysql;
    }

    public void setMysql(DataSourceMetaProperties mysql)
    {
        this.mysql = mysql;
    }

    public DataSourceMetaProperties getOracle()
    {
        return oracle;
    }

    public void setOracle(DataSourceMetaProperties oracle)
    {
        this.oracle = oracle;
    }
}
