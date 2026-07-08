

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
		String start=request.getParameter("sdate");
		String end=request.getParameter("edate");
		String status=request.getParameter("alldata");
		PrintWriter res=response.getWriter();
		System.out.println(start+": start");
		System.out.println(end+": end");
		HttpSession session=request.getSession();
		session.setAttribute("usernumber", number);
		session.setAttribute(password, session);
		session.setAttribute("start", start);
		session.setAttribute("end", end);
		session.setAttribute("status", status);
	
		Connection con;
		try {
			con=DBConnection.getConnection();
			Statement state=con.createStatement();
			ResultSet result=state.executeQuery("select * from users where accountnumber="+number+ " and password='"+password+ "';" );
			if(result.next()) {
				System.out.println("history");
				response.sendRedirect("viewtranscation.jsp");

			}
			else {
				
				res.print("INVALID ACCOUNTNUMBEER OR PASSWORD");
				res.println("<script>");
				res.println("setTimeout(function(){ window.location.href='home.jsp'; }, 3000);");
				res.println("</script>");
				res.println("</body></html>");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}




	}
}
