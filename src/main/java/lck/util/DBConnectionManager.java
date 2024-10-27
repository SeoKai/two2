package lck.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionManager {
	
	private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "system";                
    private static final String DB_PASSWORD = "1234"; 
    
    public static Connection getConnection() throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");                           // 오라클 드라이버 로드
        return DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);         // DB 연결 생성 후 반환
    }

}
