package com.sandrew.boot.config.jta;

import com.sandrew.bury.SqlSessionFactory;
import com.sandrew.bury.datasource.DataSourceWrapper;
import com.sandrew.bury.spring.SqlSessionFactoryBean;
import com.sandrew.bury.springboot.autoconfigure.BuryConfigurePerproties;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 *  Bury配置多数据源
 * Created by summer on 2018/10/20.
 */
//@Configuration
public class BuryMultiDatasourceConfiguration
{
    @Value("${spring.bury.mysql.database-type}")
    private String mysqlDatabaseType;

    @Value("${spring.bury.mysql.datasource-name}")
    private String mysqlDatasourceName;

    @Value("${spring.bury.oracle.database-type}")
    private String oracleDatabaseType;

    @Value("${spring.bury.oracle.datasource-name}")
    private String oracleDatasourceName;

    private BuryConfigurePerproties configurePerproties;

    public BuryMultiDatasourceConfiguration(BuryConfigurePerproties configurePerproties)
    {
        this.configurePerproties = configurePerproties;
    }

    @Bean
    @ConditionalOnMissingBean
    public SqlSessionFactory sqlSessionFactory(@Qualifier("dataSourceMySql") DataSource dataSourceMySql, @Qualifier("dataSourceOracle") DataSource dataSourceOracle) throws Exception {
        Map<String, DataSourceWrapper> dataSources = new HashMap<String, DataSourceWrapper>();
        DataSourceWrapper wrapper = new DataSourceWrapper();
        wrapper.setDefault();
        wrapper.setDatabaseType(this.mysqlDatabaseType);
        wrapper.setDataSourceName(this.mysqlDatasourceName);
        wrapper.setDataSource(dataSourceMySql);
        wrapper.setAutocommit(false);
        dataSources.put("default", wrapper);

        wrapper = new DataSourceWrapper();
        wrapper.setDatabaseType(this.oracleDatabaseType);
        wrapper.setDataSourceName(this.oracleDatasourceName);
        wrapper.setDataSource(dataSourceOracle);
        wrapper.setAutocommit(false);
        dataSources.put("oracle", wrapper);

        SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
        factory.setDataSources(dataSources);
        return factory.getObject();
    }
}
