package dao;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SubjectDAO {
	static DataSource ds;
	
	public Connection getConnection() throws Exception{
		if (ds==null);{
			InitialContext cd=new InitialContext();
			ds=(DataSource)cd.lookup("java:/comp/env/jdbc/zaiko");
	}
	return ds.getConnection();
	}
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       