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
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {

	public ChangePassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in");
		int accountnumber=Integer.parseInt(request.getParameter("accountnumber"));
		String oldpassword=request.getParameter("currentpassword");
		String newpassword=request.getParameter("newpassword");
		String confirmpassword=request.getParameter("confirmpassword");
		PrintWriter res=response.getWriter();
		System.out.println(newpassword);
		System.out.println(confirmpassword);
		Connection con;
		try {
			con=DBConnection.getConnection();
			Statement statement=con.createStatement();
			System.out.println(newpassword);
			System.out.println(confirmpassword);
			if(newpassword.equals(confirmpassword)) {
				System.out.println("correct password");
				System.out.println(oldpassword);

				ResultSet result=statement.executeQuery("select * from users where accountnumber="+accountnumber + " and password='"+oldpassword +"';");
				System.out.println(accountnumber);
				if(result.next()) {
					System.out.println("verify");
					int rs=statement.executeUpdate("update users set password='"+newpassword+"' where accountnumber="+accountnumber+";");
					if(rs>0) {
						res.println("hi your password recent successfully done");
						response.sendRedirect("home.jsp");

					}
					else {
						res.println("hi your password recent request is fail");
					}
				}
				else {
					res.println("Invalid user information");
				}
			}
			else {
				res.println("NewPassword and Confirm password are mismatched ");
				response.sendRedirect("changepassword.jsp");
			}

		}
		catch(Exception e) {
			e.printStackTrace(System.err);
			System.out.println("error");
		}


	}


}
