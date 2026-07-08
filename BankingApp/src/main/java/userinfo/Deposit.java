package userinfo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import connection.DBConnection;

/**
 * Servlet implementation class deposit
 */
@WebServlet("/deposit")
public class Deposit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Deposit() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		int accountnumber=Integer.parseInt(request.getParameter("accountnumber"));
		String password=request.getParameter("password");
		int amount=Integer.parseInt(request.getParameter("amount"));
		PrintWriter writer=response.getWriter();
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		Connection con;
		try {
			con=DBConnection.getConnection();
			Statement state=con.createStatement();
			ResultSet result=state.executeQuery("select * from users where accountnumber="+accountnumber+ " and password='"+password+ "';" );
			if(result.next()) {
				ResultSet rs=state.executeQuery("select availablecash from users where accountnumber="+accountnumber+  ";");
				int balance = 0;
				if(rs.next())
				{
					balance=rs.getInt(1);	
				}
				int currentbalance=balance+amount;
				int updatebalance=state.executeUpdate("update users set availablecash="+currentbalance+" where accountnumber="+accountnumber+";");
				//writer.println(" you deposit "+amount+" rupees successfully");
				int transcation=state.executeUpdate("insert into transactionhistory (user_id,amount_type,description ,date_time ,balance_after,transaction_amount) values("+accountnumber+",'"+type+"','AMOUNT CREDITED','"+ timestamp+"',"+currentbalance+","+amount+");");
				writer.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");
				writer.println("<h3>AMOUNT DEPOSIT SUCCESFULLY DONE</h3>");
				writer.println("<script>setTimeout(() => { window.location = 'home.jsp'; }, 5000);</script>");
				writer.println("</body></html>");
			}


			else {
				
				writer.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");  
				writer.print("INVALID ACCOUNTNUMBEER OR PASSWORD");
				writer.println("<script>");
				writer.println("setTimeout(function(){ window.location.href='home.jsp'; }, 5000);");
				writer.println("</script>");
				writer.println("</body></html>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			writer.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");  
			writer.print("SOMETHINK WENT WRONG PLEASE TRY AGAIN");
			writer.println("<script>");
			writer.println("setTimeout(function(){ window.location.href='home.jsp'; }, 5000);");
			writer.println("</script>");
			writer.println("</body></html>");
		}

	}

}
