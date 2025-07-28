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
 * Servlet implementation class withdraw
 */
@WebServlet("/withdraw")
public class Withdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Withdraw() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		int number=Integer.parseInt(request.getParameter("accountnumber"));
		String password=request.getParameter("password");
		int amount=Integer.parseInt(request.getParameter("amount"));
		int otp=Integer.parseInt(request.getParameter("otp"));
		PrintWriter res=response.getWriter();
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		if(otp==1234) {
			Connection con;
			try {
				con=DBConnection.getConnection();
				Statement state=con.createStatement();
				ResultSet result=state.executeQuery("select * from users where accountnumber= "+number+ " and password='"+password+"';" );
				if(result.next()) {
					ResultSet rs=state.executeQuery("select availablecash from users where accountnumber="+number+  ";");
					int balance=0;
					if(rs.next()) {
						balance=rs.getInt(1);
					}
					if(balance>=amount) {
						int currentbalance=balance-amount;
						int updatebalance=state.executeUpdate("update users set availablecash= "+currentbalance+" where accountnumber="+number+";");
						int transcation=state.executeUpdate("insert into transactionhistory (user_id,amount_type,description ,date_time ,balance_after,transaction_amount) values("+number+",'"+type+"','ATM WITHDRAW','"+ timestamp+"',"+currentbalance+","+amount+");");
						res.println(" you Withdraw "+amount+" rupees successfully");
						response.sendRedirect("home.jsp");
					}
					else {
						res.println("<script>alert('insufficient Balance')</script>");
						response.sendRedirect("home.jsp");
					}
				}
				else {
					res.println("<script>alert('Invalid account number')</script>");
					response.sendRedirect("withdraw.jsp");
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}

		}
		else {
			res.println("<script>alert('Invalid otp')</script>");
			response.sendRedirect("withdraw.jsp");

		}

	}
}
