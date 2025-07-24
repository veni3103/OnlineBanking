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


@WebServlet("/transferAmount")
public class transferAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public transferAmount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sendernumber=Integer.parseInt(request.getParameter("sendernumber"));
		String password=request.getParameter("password");
		int receivernumber=Integer.parseInt(request.getParameter("receivernumber"));
		int amount=Integer.parseInt(request.getParameter("amount"));
		int confirm=Integer.parseInt(request.getParameter("confirm"));
		PrintWriter writer=response.getWriter();
		if(confirm==1) {
			Connection con;
			try {
				con=DBConnection.getConnection();
				Statement state=con.createStatement();
				Statement state2=con.createStatement();
				ResultSet sendb=state.executeQuery("select availablecash from users where accountnumber="+sendernumber+ " and password='"+password +"';" );
				ResultSet rs=state2.executeQuery("select availablecash from users where accountnumber= "+ receivernumber+";");
				System.out.println("hi");
				boolean first=sendb.next();
				boolean second=rs.next();
				System.out.println("hello");
				if(first && second) {
					System.out.println("if");
					int senderbalance=sendb.getInt(1);
					
					if(senderbalance>=amount) {
						System.out.println("3rd if");
						System.out.println("amount");
						int currentbalance=senderbalance-amount;
						int updatebalance=state.executeUpdate("update users set availablecash= "+currentbalance+" where accountnumber="+sendernumber+";");
						int receiverbalance=rs.getInt(1);
						System.out.println("balance");
						int balance=receiverbalance+amount;
						int updatebalances=state.executeUpdate("update users set availablecash="+balance+ " where accountnumber="+receivernumber+";");
						writer.println("Transcation succesful");
						response.sendRedirect("home.jsp");
					}
					else {
						writer.println("<script>alert('insufficient Balance')</script>");
						response.sendRedirect("home.jsp");
					}
				}
				else {
					writer.println("<script>alert('Invalid account number')</script>");
					response.sendRedirect("withdraw.jsp");
				}
			}
			catch (Exception e) {
				e.printStackTrace();			}
			
			
		}
		else {
			writer.println("<script>alert('Transacction Failed')</script>");
			response.sendRedirect("home.jsp");
		}
		
	}

}
