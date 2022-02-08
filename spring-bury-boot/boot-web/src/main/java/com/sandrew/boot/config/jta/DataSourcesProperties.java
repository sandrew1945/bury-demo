package com.sandrew.boot.config.jta;

import org.springframework.boot.context.properties.NestedConfigurationProperty;

/**
 * Created by summer on 2019/8/13.
 */
//@Configuration
//@ConfigurationProperties(prefix = "spring.datasource.druid")
//@Component
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
