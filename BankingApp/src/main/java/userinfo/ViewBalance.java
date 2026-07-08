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
public class ViewBalance extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ViewBalance() {
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
					writer.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");
					writer.println("AccounNumber :"+number);
					writer.println("AccountBalance:"+balance);
					writer.println("</body></html>");
				}
				else {
					writer.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");  
					writer.print("INVALID INPUT");
					writer.println("<script>");
					writer.println("setTimeout(function(){ window.location.href='home.jsp'; }, 3000);");
					writer.println("</script>");
					writer.println("</body></html>");
				
				}
			} catch (Exception e) {
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
