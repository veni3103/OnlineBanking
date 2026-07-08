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


@WebServlet("/transferAmount")
public class TransferAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public TransferAmount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type=request.getParameter("type");
		int sendernumber=Integer.parseInt(request.getParameter("sendernumber"));
		String password=request.getParameter("password");
		int receivernumber=Integer.parseInt(request.getParameter("receivernumber"));
		int amount=Integer.parseInt(request.getParameter("amount"));
		int confirm=Integer.parseInt(request.getParameter("confirm"));
		PrintWriter writer=response.getWriter();
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		if(confirm==1) {
			Connection con;
			try {
				con=DBConnection.getConnection();
				Statement state=con.createStatement();
				Statement state2=con.createStatement();
				ResultSet sendb=state.executeQuery("select availablecash from users where accountnumber="+sendernumber+ " and password='"+password +"';" );
				ResultSet rs=state2.executeQuery("select availablecash from users where accountnumber= "+ receivernumber+";");
				boolean first=sendb.next();
				boolean second=rs.next();
				if(first && second) {
					int senderbalance=sendb.getInt(1);
					
					if(senderbalance>=amount) {
						int currentbalance=senderbalance-amount;
						int updatebalance=state.executeUpdate("update users set availablecash= "+currentbalance+" where accountnumber="+sendernumber+";");
						int receiverbalance=rs.getInt(1);
						int balance=receiverbalance+amount;
						int updatebalances=state.executeUpdate("update users set availablecash="+balance+ " where accountnumber="+receivernumber+";");
						int transcation1=state.executeUpdate("insert into transactionhistory (user_id,amount_type,description ,date_time ,balance_after,transaction_amount) values("+sendernumber+",'"+type+"','AMOUNT TRANSFER TO "+receivernumber+"','"+ timestamp+"',"+currentbalance+","+amount+");");
						int transcation2=state.executeUpdate("insert into transactionhistory (user_id,amount_type,description ,date_time ,balance_after,transaction_amount) values("+receivernumber+",'"+type+"','AMOUNT TRANSFER FROM  "+sendernumber+"','"+ timestamp+"',"+balance+","+amount+");");
						writer.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");  
						writer.print("TRANSACTION SUCCESFULLY DONE");
						writer.println("<script>");
						writer.println("setTimeout(function(){ window.location.href='home.jsp'; }, 3000);");
						writer.println("</script>");
						writer.println("</body></html>");
					}
					else {
						writer.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");  
						writer.print("INSUFFICIENT BALANCE");
						writer.println("<script>");
						writer.println("setTimeout(function(){ window.location.href='home.jsp'; }, 3000);");
						writer.println("</script>");
						writer.println("</body></html>");
						
					}
				}
				else {
					writer.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");  
					writer.print("INVALID ACCOUNTNUMBER");
					writer.println("<script>");
					writer.println("setTimeout(function(){ window.location.href='home.jsp'; }, 3000);");
					writer.println("</script>");
					writer.println("</body></html>");
					
				}
			}
			catch (Exception e) {
				e.printStackTrace();		
				writer.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");  
				writer.print("SOMETHINK WENT WRONG PLEASE TRY AGAIN");
				writer.println("<script>");
				writer.println("setTimeout(function(){ window.location.href='home.jsp'; }, 5000);");
				writer.println("</script>");
				writer.println("</body></html>");
				}
			
			
		}
		else {
			writer.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");  
			writer.print("TRANSACTION FAILED PLEASE TRY AGAIN");
			writer.println("<script>");
			writer.println("setTimeout(function(){ window.location.href='home.jsp'; }, 3000);");
			writer.println("</script>");
			writer.println("</body></html>");
		}
		
	}

}
