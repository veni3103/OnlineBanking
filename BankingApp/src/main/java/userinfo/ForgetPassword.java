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

@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ForgetPassword() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int accountnumber=Integer.parseInt(request.getParameter("accountnumber"));
		String email=request.getParameter("email");
		String DOB=request.getParameter("DOB");
		String password=request.getParameter("password");
		PrintWriter res=response.getWriter();
		
		Connection con;
		try {
			con=DBConnection.getConnection();
			Statement statement=con.createStatement();
			ResultSet result=statement.executeQuery("select * from users where accountnumber="+accountnumber + " and email='"+email+"' and dob='"+DOB +"';");
			System.out.println("result");
			if(result.next()) {
				int rs=statement.executeUpdate("update users set password='"+password+"' where accountnumber="+accountnumber+";");
				if(rs>0) {
					res.println("hi your password recent successfully done");
					response.sendRedirect("home.jsp");
					
				}
			}
			else {
				res.println("hi your password recent request is fail");
			}
		}
			catch(Exception e) {
				e.printStackTrace(System.err);
				System.out.println("error");
			}
	}

}
