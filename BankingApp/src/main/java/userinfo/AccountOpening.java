package userinfo;

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

@WebServlet("/accountopening")
public class AccountOpening extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public AccountOpening() {
		super();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clientname=request.getParameter("name");
		String aadhar=request.getParameter("Aadhar");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String DOB=request.getParameter("DOB");
		System.out.println("welccome");
		String phonenumber=request.getParameter("phonenumber");
		String door=request.getParameter("Doornumber");
		String street=request.getParameter("street");
		String village=request.getParameter("village");
		String taluk=request.getParameter("taluk");
		int pincode=Integer.parseInt(request.getParameter("pincode"));
		String dist=request.getParameter("dist");
		String state=request.getParameter("state");
		String gender=request.getParameter("gender");
		PrintWriter res=response.getWriter();
		Connection con;
		try {
			con=DBConnection.getConnection();
			Statement statement=con.createStatement();
			ResultSet result=statement.executeQuery("select * from users where aadharnumber='"+aadhar +"';");
			HttpSession session=request.getSession();  

			if(!result.next()) {
				ResultSet insert=statement.executeQuery("insert into users (name,password,availablecash,aadharnumber,email,phonenumber,dob,genter) values ('"+clientname +"','"+password +"',"+0+",'"+aadhar+"','"+email+"','"+phonenumber+"','"+DOB+"','"+gender+"') returning accountnumber");
				if(insert.next()) {
					int id=insert.getInt(1);
					int insert2=statement.executeUpdate("insert into userAddress (accountnumber,doornumber,street,village,taluk,pincode,district,state) values("+id +",'"+door +"','"+street+"','"+village+"','"+taluk+"',"+pincode+",'"+dist+"','"+state+"') ;");
					session.setAttribute("AccountNumber", id);
					System.out.println(id);
					response.sendRedirect("ViewAccountNumber.jsp");

				}
				else {

					res.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");  
					res.print("Hi "+clientname+" your registration failed Please try Again");
					res.println("<script>");
					res.println("setTimeout(function(){ window.location.href='home.jsp'; }, 4000);");
					res.println("</script>");
					res.println("</body></html>");

				}
			}
			else {
				res.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");  
				res.print("You Already Have a Account Please Login Your Acoount");
				res.println("<script>");
				res.println("setTimeout(function(){ window.location.href='Login.jsp'; }, 4000);");
				res.println("</script>");
				res.println("</body></html>");
			}
		} catch (Throwable e) 
		{
			e.printStackTrace(System.err);
			System.out.println("error");
			res.println("<html><body style='display:flex; justify-content:center; align-items:center; height:100vh;'>");  
			res.print("SOMETHINK WENT WRONG PLEASE TRY AGAIN");
			res.println("<script>");
			res.println("setTimeout(function(){ window.location.href='home.jsp'; }, 4000);");
			res.println("</script>");
			res.println("</body></html>");

		}


	}

}
