package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

		 static  Connection connection;

		public  static Connection  getConnection() throws Exception {
			if(connection==null) {
				Class.forName("org.postgresql.Driver");
				connection=DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/onlinebanking?user=postgres&password=postgres");
				return connection;
			}
			else {
				return connection;
			}
		}

	}
