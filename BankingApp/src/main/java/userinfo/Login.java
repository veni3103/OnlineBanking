package userinfo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import connection.DBConnection;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int number=Integer.parseInt(request.getParameter("accountnumber"));
		String password=request.getParameter("password");
		PrintWriter res=response.getWriter();
		Connection con;
		System.out.println(number +":"+password);
		try {
			con=DBConnection.getConnection();
			PreparedStatement state=con.prepareStatement("select * from  users where accountnumber=? and password=?");
			state.setInt(1, number);
			state.setString(2, password);
			ResultSet result=state.executeQuery();
			if(result.next()) {
				response.sendRedirect("home.jsp");
			}
			else {
				res.println("<script>alert('Invalid input')</script>");
				response.sendRedirect("Login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
