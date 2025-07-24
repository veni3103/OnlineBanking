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

import connection.DBConnection;

/**
 * Servlet implementation class withdraw
 */
@WebServlet("/withdraw")
public class withdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public withdraw() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int number=Integer.parseInt(request.getParameter("accountnumber"));
		int amount=Integer.parseInt(request.getParameter("amount"));
		int otp=Integer.parseInt(request.getParameter("otp"));
		PrintWriter res=response.getWriter();
		if(otp==1234) {
			Connection con;
			try {
				con=DBConnection.getConnection();
				Statement state=con.createStatement();
				ResultSet result=state.executeQuery("select * from users where accountnumber="+number+  ";" );
				if(result.next()) {
					ResultSet rs=state.executeQuery("select availablecash from users where accountnumber="+number+  ";");
					int balance=0;
					if(rs.next()) {
						balance=rs.getInt(1);
					}
					if(balance>=amount) {
						int currentbalance=balance-amount;
						int updatebalance=state.executeUpdate("update users set availablecash= "+currentbalance+";");
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
