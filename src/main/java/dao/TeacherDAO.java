package dao;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Teacher {
		
		public Connection get(String id) throws Exception{
			if (ds==null);{
				InitialContext ic=new InitialContext();
				ds=(DataSource)ic.lookup("java:/comp/env/jdbc/zaiko");
		
		}
		return id.get();
		}
}
