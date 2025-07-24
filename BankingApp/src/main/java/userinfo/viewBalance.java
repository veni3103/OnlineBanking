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

@WebServlet("/viewBalance")
public class viewBalance extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public viewBalance() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num=(request.getParameter("accountnumber"));
		String password=request.getParameter("password");
		PrintWriter writer=response.getWriter();
		int number=0;
		if(num !=null  ) {
			number=Integer.parseInt(num);	
			}
		Connection con;
		try {
			con=DBConnection.getConnection();
			Statement state=con.createStatement();
			ResultSet res=state.executeQuery("select * from users where accountnumber= "+number + " and password='"+password+"' ;");
			if(res.next()) {
				ResultSet val=state.executeQuery("select availablecash from users where accountnumber= "+number + ";");
				int balance=0;
					if(val.next()) {
						balance=val.getInt(1);

					}
					writer.println("AccounNumber :"+number);
					writer.println("AccountBalance:"+balance);
				}
				else {
					writer.println("<script>alert('Invalid input')</script>");
					response.sendRedirect("home.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}
