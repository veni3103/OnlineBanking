

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import connection.DBConnection;

/**
 * Servlet implementation class transactionHistory
 */
@WebServlet("/transactionHistory")
public class transactionHistory extends HttpServlet {

	public transactionHistory() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hi");
		int number=Integer.parseInt(request.getParameter("accountnumber"));
		String password=request.getParameter("password");
		PrintWriter res=response.getWriter();
		HttpSession session=request.getSession();
		session.setAttribute("usernumber", number);
		Connection con;
		try {
			con=DBConnection.getConnection();
			Statement state=con.createStatement();
			ResultSet result=state.executeQuery("select * from users where accountnumber="+number+ " and password='"+password+ "';" );
			if(result.next()) {
				System.out.println("end");
				response.sendRedirect("viewtranscation.jsp");

			}
			else {
				res.println("<script>alert('Invalid account number or password')</script>");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}




	}
}
