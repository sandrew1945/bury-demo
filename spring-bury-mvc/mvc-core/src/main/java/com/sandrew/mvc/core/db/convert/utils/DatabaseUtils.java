package com.sandrew.mvc.core.db.convert.utils;

import com.sandrew.mvc.core.common.PropertiesLoader;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 * Function    : 数据库连接处理类
 * @author liutt
 * CreateDate  : 2016年5月30日
 *
 */
public class DatabaseUtils {
	 private static PropertiesLoader propertiesLoader = new PropertiesLoader("conf/conf.properties");
	 
	 public static final String DRIVER = propertiesLoader.getProperty("jdbc.driverClassName.db01");
	 public static final String URL = propertiesLoader.getProperty("jdbc.url.db01");
	 public static final String NAME = propertiesLoader.getProperty("jdbc.username.db01");
	 public static final String PASS = propertiesLoader.getProperty("jdbc.password.db01");
   /**
    * Function    : 连接数据库
    * @author liutt
    * CreateDate  : 2016年5月30日
    *
    */
	public static Connection openConnection(){
	   //创建连接  
       Connection con =null;  
       try {  
           Class.forName(DRIVER);  
       } catch (ClassNotFoundException e1) {  
           // TODO Auto-generated catch block  
            e1.printStackTrace();  
       }  
       try {
    	   con = DriverManager.getConnection(URL,NAME,PASS);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
       return con;
	}
	
   /**
    * Function    : 关闭数据库连接
    * @author liutt
    * CreateDate  : 2016年5月30日
    *
    */
	public static void closeDatabase(Connection conn, PreparedStatement pstmt){
        try {
            if (pstmt!=null) {
                pstmt.close();//关闭预编译对象
            }
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        try {
            
            if (conn!=null) {
                conn.close();//关闭结果集对象
            }
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
    }
}
