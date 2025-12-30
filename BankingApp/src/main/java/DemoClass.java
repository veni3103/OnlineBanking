import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DemoClass {
	public static void main(String[] args) throws SQLException, ClassNotFoundException {
		//System.out.println("hello");
		//Class.forName("org.postgresql.Driver");
		Connection con=DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/demo?user=postgres&password=postgres");
		Statement statement=con.createStatement();
		ResultSet set=statement.executeQuery("select * from sample");
		while(set.next()) {
			String name=set.getString(1);
			System.out.println(name);
		}
	
	}

}
